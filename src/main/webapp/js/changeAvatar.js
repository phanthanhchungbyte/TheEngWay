const modal = document.querySelector('#modal');
const modal2 = document.querySelector('#modal2');
const openModal = document.querySelector('.changeavatar-button');
const submitAvatarButton = document.querySelector('.submit-avatar');
const closeModal = document.querySelector('.close-button');
const saveModal2 = document.querySelector('.return-to-main');
const closeModal2 = document.querySelector('.go-back');

const currentAvatarSrc = document.querySelector('.student-avatar > img').src;

let croppedImageDataURL = '';
let isEventListenerAdded = false;

// Create a cropper for cropping avatar images.
let cropper;

openModal.addEventListener('click', () => {
   let curFileId = currentAvatarSrc.substring(currentAvatarSrc.indexOf('=') + 1);
   modal.showModal();
   console.log(currentAvatarSrc);
   console.log(curFileId);
})

closeModal.addEventListener('click', () => {
   modal.close();
})

closeModal2.addEventListener('click', () => {
   document.getElementById('imageInput').value = ''; // Reset the file input if the user doesn't save in modal 2.
   modal2.close();
})

document.getElementById('imageInput').addEventListener("change", (event) => {
   let files = event.target.files;
   let file;

   if (files && files.length > 0) {
      file = files[0];
      let reader = new FileReader();

      reader.onload = function (e) {
         let image = document.getElementById('image');
         image.src = e.target.result;
         image.onload = function () {

            // Create an off screen canvas
            let canvas = document.createElement('canvas');
            let ctx = canvas.getContext('2d');

            const MAX_WIDTH = 400;
            let ratio = MAX_WIDTH / image.width; // Ensure the image is not upscaled
            canvas.width = MAX_WIDTH;
            if(ratio < 1){
               canvas.height = image.height * ratio;
            } else {
               canvas.height = image.height;
            }

            // Draw the image onto the canvas at the new size
            ctx.drawImage(image, 0, 0, canvas.width, canvas.height);

            // Set the src of the image element to the downscaled image data URL

            image.src = canvas.toDataURL('image/png');
            image.style.display = 'block';
         };

         if(cropper) {
            cropper.destroy();
         }
         cropper = new Cropper(image, {
            viewMode: 1,
            aspectRatio: 1
         });
      };

      reader.readAsDataURL(file);
   }

   modal2.showModal();
})

document.getElementById('crop-button').addEventListener('click', function() {
   if(cropper){
      let croppedCanvas = cropper.getCroppedCanvas({
         width: 160,
         height: 160
      });

      // Convert the canvas to a data URL
      croppedImageDataURL = croppedCanvas.toDataURL("image/png");

      // Set the src of the image in the cropped=container to the data URL
      document.getElementById('output').src = croppedImageDataURL;

      if(isEventListenerAdded) {
         saveModal2.removeEventListener('click', saveImage);
      }
      // Add the event listener for the second model only after it has been cropped.
      saveModal2.addEventListener('click', () => {
         isEventListenerAdded = true;
         document.getElementById('imageInput').value = ''; // Reset the file input
         let curAvatar = document.querySelector('.cur-avatar');
         curAvatar.src = croppedImageDataURL;
         modal2.close();

         submitAvatarButton.disabled = false; // Enable the submit butotn if avatar changes
         submitAvatarButton.addEventListener("click", function () {
            saveImage(croppedImageDataURL);
         });
      });
   }
})

const saveImage = (imageDataURL) => {
   let url = "https://script.google.com/macros/s/AKfycbymNaO403Khzjh_I36ni167CFhidMLZXk-uf4Lwhs8RG9dxmWRml67ty_7LJ6RLdhrZNA/exec";

   // Extract the base64 part of the data URL
   let base64code = imageDataURL.split("base64,")[1];
   let curFileId = currentAvatarSrc.substring(currentAvatarSrc.indexOf('=') + 1);

   if(currentAvatarSrc.startsWith('https://drive.google.com/thumbnail?id=1CMew23JedgSH1qOuT0K6jIscj-VRcwEC')) {
      curFileId = 'none';
   }

   let obj = {
      base64: base64code,
      type: 'image/png', // Assuming the image is a PNG. Change if necessary.
      name: 'cropped_image.png', // A default name for the cropped image file
      deleteId: curFileId
   }

   fetch(url, {
      method: "POST",
      body: JSON.stringify(obj)
   })
    .then(r => r.text())
    .then(data => {
       let avatarURL = data;

       // Ensure avatarURL is not empty
       if (!avatarURL) {
          throw new Error('Avatar URL is empty.');
       }

       // Append the avatarURL to the formData for further processing
       let formData = new URLSearchParams();
       formData.append('avatar', encodeURIComponent(avatarURL));
       return fetch(contextPath + '/changeavatar', {
          method: "POST",
          headers: {
             'Content-Type': 'application/x-www-form-urlencoded',
          },
          body: formData
       });
    })
    .then(response => response.text())
    .then(() => window.location.reload())
    .catch(error => console.error('Error:', error));
}