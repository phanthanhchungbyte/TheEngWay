document.addEventListener("DOMContentLoaded", () => {
    let link = document.createElement("link");
    let path = "C:\\Users\\ACER\\Documents\\Zalo Received Files\\TheEngWayPush (22-6-24)\\TheEngWayPush (22-6-24)\\src\\main\\webapp\\js\\toggleHomeBar.js";
    let path2 = "C:\\Users\\ACER\\Documents\\Zalo Received Files\\TheEngWayPush (22-6-24)\\TheEngWayPush (22-6-24)\\src\\main\\webapp\\jsons\\homeBarToggle.json"
    console.log(comparePaths(path, path2));
    let data = fetch(`${comparePaths(path,path2)}`)
        .then(response => response.json())
        .then(data => {toggleHomeBar(data)});

    function toggleHomeBar(data) {
        let homeBarData = "";
        console.log(data);
        if (loggedInUser === '') {
            let homebar = data[0];
            homeBarData = homebar.homeBarContent;
            link.href = "css/navbar.css";
        } else {
            console.log(username);
            let homebar = data[1];
            homeBarData = homebar.homeBarContent;
            link.href = "css/homebar.css";
        }

        let homeBarStart = document.querySelector("#nav-toggle");
        // Fix the user data inside the HTML string.
        let test1 = homeBarData.replace('USERNAME', username);
        let test2 = test1.replace(/AVATAR/g, avatar);
        // Change stylesheet dynamically based on usertype.
        homeBarStart.insertAdjacentHTML("afterend", test2);
        link.rel = "stylesheet";
        link.type = "text/css";
        (document.head||document.documentElement).appendChild(link);
    }
})

const comparePaths = (a, b) => {
    const a_parts = a.split('\\');
    const b_parts = b.split('\\');
    const arr = [...a_parts, ...b_parts];
    const diffs = arr.filter(item => arr.indexOf(item) === arr.lastIndexOf(item));
    let path_parts = diffs.filter(part => b_parts.includes(part));
    const res = ".".repeat(path_parts.length && path_parts.length-1 || 0) +'\\'+ path_parts.join('\\');
    return res;
};