const post = document.getElementById("new-post");
const form = document.getElementById("post-form");

post.onfocus = function () {
    form.style.display = "block";
}
post.onblur = function () {
    form.style.display = "none";
}
