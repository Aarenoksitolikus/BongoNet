function changeDisplayStyle(comments) {
    if (comments.style.display === "block") {
        comments.style.display = "none";
    } else if (comments.style.display === "none") {
        comments.style.display = "block";
    }
}
