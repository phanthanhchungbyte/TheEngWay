<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 6/24/2024
  Time: 6:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <link rel="icon" href="imgs/favicon/favicon.ico">
    <title>Testing</title>
</head>
<body>
    <script>
        tinymce.init({
            // Replace textarea having class .tnymce with tinymce editor
            selector: "textarea#testing",

            // Theme of the editor
            theme: "silver",
            skin: "tinymce-5",

            // Width and height of the editor
            width: "100%",
            height: 400,

            // Display statusbar
            statusbar: true,

            // // plugins
            plugins: [
                "advlist", "autolink", "link", "image", "lists", "charmap", "preview", "anchor", "pagebreak",
                "searchreplace", "wordcount", "visualblocks", "code", "fullscreen", "insertdatetime", "media",
                "table", "emoticons", "codesample"
            ],

            toolbar: 'undo redo | styles | fontname | bold italic underline | alignleft aligncenter alignright alignjustify |' +
                'bullist numlist outdent indent | link image | print preview media fullscreen |' +
                'forecolor backcolor emoticons',
            menubar: 'favs file edit view insert format tools table',
            content_style: 'body{font-family: Helvetica, Arial, sans-serif; font-size: 16px}'
        });

        const submitButton = document.querySelector('.submit-btn');
        let htmlContent = "";

        submitButton.addEventListener("click", e => {
            e.preventDefault();
            htmlContent = tinymce.get('testing').getContent();
            console.log(htmlContent);

            let url = "https://script.google.com/macros/s/AKfycbz6HMT3GzqXjDJmLqWOHUkKjIzjd3sggqNhYBgr4YqRjD7OSJEcEEbdssntCAyxyK-n/exec";
            let contentObj = {
                fileName: "lesson#01",
                fileContent: htmlContent
            }
            fetch(url, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(contentObj)
            }).then(response => response.json())
                .then(data => {
                    if(data.status === "success") {
                        console.log('File URL: ', data.embedUrl);
                        document.getElementById('embed-container').innerHTML = `<iframe src="${data.embedUrl}" width="100%"></iframe>`;
                    }
                })
        })
    </script>
</body>
</html>
