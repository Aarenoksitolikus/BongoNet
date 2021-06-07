const post = document.getElementById("new-post-content");
const form = document.getElementById("submit-new-post-row");

post.onclick = function () {
    console.log(post);
    post.style.height = ""
    form.classList.remove("d-none");
    form.classList.add("d-flex");
}
post.onblur = function () {
    if (post.value === "") {
        form.classList.remove("d-flex");
        form.classList.add("d-none");
    }
}

const url = 'https://bongonet.herokuapp.com/profile/'
const data = { jopa: 'jopa'};
const data2 = new FormData(document.querySelector('form'));
console.log(data2);

const data3 = $('#form').serializeArray().reduce(function(obj, item) {
    obj[item.name] = item.value;
    return obj;
}, {});

async function postData(url = '', data = {}) {
    try {
        const response = await fetch(url, {
            method: "POST",
            mode: "cors",
            cache: "no-cache",
            credentials: "same-origin",
            headers: {
                'Content-Type': 'application-json'
            },
            redirect: "follow",
            referrerPolicy: "no-referrer",
            body: JSON.stringify(data)
        });
        const json = await response.json();
        console.log(json);
    } catch (error) {
        console.log(error);
    }
}

