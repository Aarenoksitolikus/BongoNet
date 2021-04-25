const password = document.getElementById("password");
const passwordCheck = document.getElementById("passwordCheck");
const passwordMessage = document.getElementById("passwordMessage");
const passwordCheckMessage = document.getElementById("passwordCheckMessage");
const check = document.getElementById("check");

const classesAndConstraints = [
    [document.getElementById("letter"), /[a-z]/g],
    [document.getElementById("capital"), /[A-Z]/g],
    [document.getElementById("number"), /[0-9]/g],
    [document.getElementById("special"), /[!@#$%^&*]/g],
    [document.getElementById("length"), /.{6,}/]
];

password.onfocus = function () {
    showMessage(passwordMessage)
}
password.onblur = function () {
    hideMessage(passwordMessage)
}
passwordCheck.onfocus = function () {
    showMessage(passwordCheckMessage)
}
passwordCheck.onblur = function () {
    hideMessage(passwordCheckMessage)
}

password.onkeyup = function () {
    classesAndConstraints.forEach(element => privateCheck(element));

    function privateCheck(array) {
        if (password.value.match(array[1])) {
            array[0].classList.remove("invalid");
            array[0].classList.add("valid");
        } else {
            array[0].classList.remove("valid");
            array[0].classList.add("invalid");
        }
    }
}

passwordCheck.onkeyup = function () {
    if (passwordCheck.value === password.value) {
        check.classList.remove("invalid");
        check.classList.add("valid");
    } else {
        check.classList.remove("valid");
        check.classList.add("invalid");
    }
}

function showMessage(message) {
    message.style.display = "block";
}

function hideMessage(message) {
    message.style.display = "none";
}
