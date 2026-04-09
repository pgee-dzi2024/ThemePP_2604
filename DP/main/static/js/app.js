const { createApp, ref } = Vue;

createApp({
    setup() {
        const selectedFile = ref(null);
        const previewUrl = ref(null);
        const extractedText = ref('');
        const isLoading = ref(false);
        const errorMessage = ref('');

        // При избиране на файл
        const onFileChange = (event) => {
            const file = event.target.files[0];
            if (file) {
                selectedFile.value = file;
                previewUrl.value = URL.createObjectURL(file);
                extractedText.value = ''; // Изчистваме стария текст
                errorMessage.value = '';
            }
        };

        // Изпращане към бекенда
        const uploadDocument = async () => {
            if (!selectedFile.value) return;

            isLoading.value = true;
            errorMessage.value = '';

            // Използваме FormData, защото изпращаме файл
            const formData = new FormData();
            formData.append('image', selectedFile.value);

            try {
                // Изпращаме POST заявка към създадения API endpoint
                const response = await axios.post('/api/upload/', formData, {
                    headers: {
                        'Content-Type': 'multipart/form-data'
                    }
                });

                // Задаваме извлечения текст в текстовото поле
                extractedText.value = response.data.extracted_text;

            } catch (error) {
                console.error(error);
                errorMessage.value = "Възникна грешка при обработката на изображението.";
            } finally {
                isLoading.value = false;
            }
        };

        return {
            selectedFile,
            previewUrl,
            extractedText,
            isLoading,
            errorMessage,
            onFileChange,
            uploadDocument
        }
    }
}).mount('#app');

