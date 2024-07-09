const profileHomeCardMini = document.querySelector('.profile-home-card-mini');
const profileHomeDropdown = document.querySelector('.mini-profile-dropdown');

profileHomeDropdown.style.display = "none";
// Default that the profile home dropdown to not show
profileHomeCardMini.addEventListener("click", () => {
    if(profileHomeDropdown.style.display === "none") {
        profileHomeDropdown.style.display = "block";
    } else if(profileHomeDropdown.style.display === "block") {
        profileHomeDropdown.style.display = "none";
    }
})