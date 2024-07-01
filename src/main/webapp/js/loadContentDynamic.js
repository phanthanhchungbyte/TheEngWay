const APP = {
   SW: null,
   cacheName: 'assetCache1',
   init() {
      APP.startCaching();

      document.querySelector('.delete_cache')
         .addEventListener('click', APP.deleteCache);
   },
   startCaching() {
      // open a cache and save some response
      caches.open(APP.cacheName).then((cache) => {
         console.log(`Cache ${APP.cacheName} opened`);

         let urlString = '/imgs/logogov.png';
         cache.add(urlString);
      })
   },
   async cacheResource(url, content) {
      const cache = await caches.open(APP.cacheName);
      const response = new Response(content, {
         headers: {'Content-Type': 'text/html'}
      });
      await cache.put(url, response);
      console.log(`Resource ${url} cached`);
   },
   async getCachedResource(url) {
      const cache = await caches.open(APP.cacheName);
      const cachedResponse = await cache.match(url);
      if(cachedResponse) {
         const cachedContent = await cachedResponse.text();
         console.log(`Resource ${url} retrieved from cache`);
         return cachedContent;
      }
      return null;
   }
}

// Doing caching to save the time needed to load the requested html content
document.addEventListener("DOMContentLoaded", APP.init());

const getFileURL = "https://script.google.com/macros/s/AKfycbzDHw_aPjnP9Qfjbd9WracPAAyJAOkRAPWunPMSjnOqC_maK36a2f1gkhQrpcKxkp8t/exec";
// Store the original content to restore the state
const lessonDisplay = document.querySelector('.lesson-display');
const originalContent = lessonDisplay.innerHTML;

function linkClickedEvent(element) {
   console.log(element);
   // // Get the lesson name from the link, not the event target
   let lessonName = element.getAttribute("data-lessonname");
   console.log(lessonName);
   loadData(lessonName);
}

function loadAnimation() {
   const progressbar = document.querySelector(".progressbar");

   function enableProgressbar() {
      progressbar.setAttribute("role", "progressbar");
      progressbar.setAttribute("aria-live", "polite");
      runProgress();
   }
   
   function runProgress() {
      let currentvalue = 0;
      let targetValue = 100;
      const duration = 3000;
      
      function updateProgress() {
         const percentage = (currentvalue / targetValue) * 100;
         progressbar.setAttribute("aria-valuenow", currentvalue);
         progressbar.style.setProperty('--progress', percentage + "%");
         currentvalue++;
         
         if (currentvalue <= targetValue) {
            setTimeout(updateProgress, duration / targetValue);
         }
      }
      updateProgress();
   }
   
   enableProgressbar();
}
// Wait for all content loaded first before changing.

async function loadData(lessonName) {
   try {
      // Look in the cache first before doing the fetch to App Script for lesson content
      const cachedContent = await APP.getCachedResource(lessonName);
      if(cachedContent) {
         loadPage(cachedContent);
         history.pushState({ lessonName }, "", `listening.html#${lessonName}`);
         return;
      }

      // Only do loading animation when fetching from GG App Script.
      lessonDisplay.innerHTML = `
      <p class="progress">Please standby</p>
      <div class="progressbar">
         <span>This <em>really awesome features</em> requires JS</span>
      </div>
      `;
      loadAnimation();
      
      const contentToPost = {
         lessonName: `${lessonName}.txt`
      }
      let start = performance.now();
      const response = await fetch(getFileURL, {
         redirect: "follow",
         method: "POST",
         body: JSON.stringify(contentToPost),
         headers: {
            "Content-Type": 'text/plain'
         }
      })

      let responseContent = await response.json(); // We get the array of objects here
      if (responseContent.status === "success") {
         console.log(`%c Fetch succeed`, "color: green; background-color: blue");
         let time = (performance.now() - start) / 1000;
         console.log(`Time to fetch was ${time}`);
      } 
      let lessonContent = await responseContent.content;

      // Do the cache if the requested content isn't available on the cache yet
      await APP.cacheResource(lessonName, lessonContent);
      loadPage(lessonContent);
      // doing pushState to the URL after the content is loaded.
      history.pushState({ lessonName }, "", `listening.html#${lessonName}`);
   } catch (error) {
      console.error("Error fetching JSON:", error);
   }
}

function loadPage(lessonContent) {
   if (lessonContent) {
      // Fade out the current content
      lessonDisplay.style.opacity = '0';
      lessonDisplay.style.transition = 'opacity 0.3s';
      // Render the content for the page
      setTimeout(() => {
         lessonDisplay.innerHTML = lessonContent;
         // Fade in the new content
         lessonDisplay.style.opacity = '1';
      }, 300)
   } else {
      console.error("Page not found");
   }
}

// Trying popState to restore the previous content after the user click "Back"
window.addEventListener("popstate", (event) => {
   if (event.state) {
      console.log("popstate fired with state!");
      const lessonName = event.state.lessonName;
      let start = performance.now();
      if (lessonName) {
         fetch("../../json/allLessons.json")
            .then(response => response.json())
            .then(allPagesContent => {
               let time = (performance.now() - start) / 1000;
               console.log("Time to fetch was " + start);
               loadPage(lessonName, allPagesContent);
            })
            .catch(error => console.error("Error fetching JSON:", error));
      } else {
         lessonDisplay.innerHTML = originalContent; // Restore the original content
      }
   } else {
      console.log("popstate fired without state!");
      lessonDisplay.innerHTML = originalContent; // Restore the original content if no state is provided

   }
});

// Remove the .html extension from the current URL
// const newURL = window.location.href.replace(/\.html$/, '');
// window.history.replaceState(null, null, newURL);

// Get the fragment identifier when the user clicks into the page.
const lessonNameFragment = window.location.hash.substr(1);
if(lessonNameFragment !== null && lessonNameFragment !== "") {
   loadData(lessonNameFragment);
}


// Checking for the content dinamically.
// window.addEventListener("hashchange", () => {
//    const pageId = Number((window.location.hash).substring(1));
//    if (allPagesContent) {
//       loadPage(pageId, allPagesContent)
//    }
// });