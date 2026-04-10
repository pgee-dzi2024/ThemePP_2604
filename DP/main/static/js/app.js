const { createApp, ref, computed, onBeforeUnmount, onMounted } = Vue;

createApp({
    setup() {
        const selectedFile = ref(null);
        const previewUrl = ref(null);
        const extractedText = ref('');
        const isLoading = ref(false);
        const errorMessage = ref('');
        const successMessage = ref('');

        const cameraStream = ref(null);
        const cameraActive = ref(false);
        const cameraPreview = ref(null);
        const capturedFromCamera = ref(false);
        const cameraAvailable = ref(false);

        const canUseCamera = computed(() => cameraAvailable.value);

        const stopCamera = () => {
            if (cameraStream.value) {
                cameraStream.value.getTracks().forEach(track => track.stop());
                cameraStream.value = null;
            }
            cameraActive.value = false;
        };

        const detectCameraAvailability = async () => {
            try {
                if (!navigator.mediaDevices || !navigator.mediaDevices.enumerateDevices) {
                    cameraAvailable.value = false;
                    return;
                }

                const devices = await navigator.mediaDevices.enumerateDevices();
                cameraAvailable.value = devices.some(device => device.kind === 'videoinput');
            } catch (error) {
                cameraAvailable.value = false;
            }
        };

        const onFileChange = (event) => {
            const file = event.target.files[0];
            if (file) {
                selectedFile.value = file;
                previewUrl.value = URL.createObjectURL(file);
                extractedText.value = '';
                errorMessage.value = '';
                successMessage.value = '';
                capturedFromCamera.value = false;
            }
        };

        const startCamera = async () => {
            errorMessage.value = '';
            successMessage.value = '';

            if (!canUseCamera.value) {
                errorMessage.value = 'На това устройство не е открита камера.';
                return;
            }

            try {
                stopCamera();

                const stream = await navigator.mediaDevices.getUserMedia({
                    video: {
                        facingMode: 'environment'
                    },
                    audio: false
                });

                cameraStream.value = stream;
                cameraActive.value = true;

                if (cameraPreview.value) {
                    cameraPreview.value.srcObject = stream;
                    await cameraPreview.value.play();
                }
            } catch (error) {
                console.error(error);

                if (error.name === 'NotFoundError') {
                    errorMessage.value = 'Не е открита камера на това устройство.';
                } else if (error.name === 'NotAllowedError') {
                    errorMessage.value = 'Достъпът до камерата е отказан. Разреши го в браузъра.';
                } else {
                    errorMessage.value = 'Не може да се стартира камерата.';
                }

                stopCamera();
            }
        };

        const capturePhoto = () => {
            errorMessage.value = '';
            successMessage.value = '';

            if (!cameraPreview.value) {
                errorMessage.value = 'Камерата не е активна.';
                return;
            }

            const video = cameraPreview.value;
            const canvas = document.createElement('canvas');
            canvas.width = video.videoWidth;
            canvas.height = video.videoHeight;

            if (!canvas.width || !canvas.height) {
                errorMessage.value = 'Камерата още не е готова.';
                return;
            }

            const ctx = canvas.getContext('2d');
            ctx.drawImage(video, 0, 0, canvas.width, canvas.height);

            canvas.toBlob((blob) => {
                if (!blob) {
                    errorMessage.value = 'Неуспешно заснемане на изображението.';
                    return;
                }

                const file = new File([blob], `camera_${Date.now()}.jpg`, {
                    type: 'image/jpeg'
                });

                selectedFile.value = file;
                previewUrl.value = URL.createObjectURL(blob);
                extractedText.value = '';
                capturedFromCamera.value = true;
                successMessage.value = 'Снимката е заснета успешно.';
            }, 'image/jpeg', 0.95);
        };

        const uploadDocument = async () => {
            if (!selectedFile.value) {
                errorMessage.value = 'Моля, избери или заснеми изображение първо.';
                return;
            }

            isLoading.value = true;
            errorMessage.value = '';
            successMessage.value = '';

            const formData = new FormData();
            formData.append('image', selectedFile.value);

            try {
                const response = await axios.post('/api/upload/', formData, {
                    headers: {
                        'Content-Type': 'multipart/form-data'
                    }
                });

                extractedText.value = response.data.extracted_text || '';
                successMessage.value = 'OCR обработката е завършена успешно.';
            } catch (error) {
                console.error(error);
                errorMessage.value = 'Възникна грешка при обработката на изображението.';
            } finally {
                isLoading.value = false;
            }
        };

        const downloadTxt = () => {
            const text = extractedText.value || '';
            if (!text.trim()) {
                errorMessage.value = 'Няма текст за изтегляне.';
                return;
            }

            const blob = new Blob([text], { type: 'text/plain;charset=utf-8' });
            const url = URL.createObjectURL(blob);

            const link = document.createElement('a');
            link.href = url;
            link.download = 'ocr_text.txt';
            link.style.display = 'none';

            document.body.appendChild(link);
            link.click();

            setTimeout(() => {
                document.body.removeChild(link);
                URL.revokeObjectURL(url);
            }, 100);
        };

        onMounted(() => {
            detectCameraAvailability();
        });

        onBeforeUnmount(() => {
            stopCamera();
        });

        return {
            selectedFile,
            previewUrl,
            extractedText,
            isLoading,
            errorMessage,
            successMessage,
            cameraStream,
            cameraActive,
            cameraPreview,
            canUseCamera,
            onFileChange,
            startCamera,
            capturePhoto,
            uploadDocument,
            downloadTxt,
            stopCamera
        };
    }
}).mount('#app');

