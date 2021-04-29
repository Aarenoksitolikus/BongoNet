const post = document.getElementById("content");
const form = document.getElementById("submit-new-post-row");

post.onfocus = function () {
    form.style.display = "block";
}
post.onblur = function () {
    form.style.display = "none";
}

const url = 'http:/localhost/profile/'
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

