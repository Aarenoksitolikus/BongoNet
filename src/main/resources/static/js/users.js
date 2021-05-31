window.onload = async function() {
    const userRows = document.getElementsByClassName("user-row");
    for (let i = 0; i < userRows.length; i++) {
        userRows[i].addEventListener("click", async function() {
            console.log(userRows.item(i).id);
            const url = "/get/profile/" + userRows.item(i).id.replace("user-", "");
            console.log(url);
            let response = await fetch(url);
            document.getElementById("user-partial").innerHTML = await response.text();
        });
    }
}
