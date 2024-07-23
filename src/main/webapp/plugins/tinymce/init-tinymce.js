tinymce.init({
   // Replace textarea having class .tnymce with tinymce editor
   selector: "textarea#lessonbox",

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

tinymce.init({
   // Replace textarea having class .tnymce with tinymce editor
   selector: "textarea.tinymce",

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
      "searchreplace", "visualblocks", "code", "insertdatetime", "media",
      "table",
   ],

   toolbar: 'undo redo | styles | fontname | bold italic underline | alignleft aligncenter alignright alignjustify |' + 'link image | media fullscreen |',

   menubar:  'edit view insert format tools table',

   content_style: 'body{font-family: Helvetica, Arial, sans-serif; font-size: 16px}'
});