let stompClient;
const currentUserId = parseInt(document.getElementById("current-user-id").innerText);
const currentUserUsername = document.getElementById("current-user-username").innerText;

window.onload = async function connect() {
    SockJS = new SockJS("https://localhost/ws");
    stompClient = Stomp.over(SockJS);
    stompClient.connect({}, onConnected, function () {
        alert("error during connection");
    });

    const contactRows = document.getElementsByClassName("contact-row");
    const userSearch = document.getElementById("user-search");
    const userSearchName = document.getElementById("user-search-name");

    userSearch.addEventListener("click", async function () {
        if (userSearchName.value !== "") {
            const url = "/get/chat/" + userSearchName.value;
            let response = await fetch(url);
            document.getElementById("chat-partial").innerHTML = await response.text();
        }
    });

    for (let i = 0; i < contactRows.length; i++) {
        contactRows[i].addEventListener("click", async function () {
            const url = "/get/chat/" + contactRows.item(i).id.replace("contact-", "") + "/" + currentUserId;
            let response = await fetch(url);
            document.getElementById("chat-partial").innerHTML = await response.text();
        });
    }
}

function onConnected() {
    const destination = "/user/" + currentUserId + "/queue/messages";
    stompClient.subscribe(destination, onMessageReceived);
}

function send(recipientId, recipientUsername) {
    let message = document.getElementById("send-message").value;
    sendMessage(message, recipientId, recipientUsername);
    document.getElementById("send-message").value = "";
}

function onMessageReceived(message) {
    const msg = JSON.parse(message.body);
    if (msg.senderId.toString() === document.getElementById("other-user-id").innerText) {
        drawMessage(msg.content, new Date(msg.sendDate), msg.senderUsername, false);
        scrollMessages();
    }
}

function sendMessage(msg, recipientId, recipientUsername) {
    if (msg.trim() !== "") {
        const message = {
            senderId: currentUserId,
            recipientId: recipientId,
            senderUsername: currentUserUsername,
            recipientUsername: recipientUsername,
            content: msg.trim(),
            sendDate: new Date()
        };
        stompClient.send("/app/chat", {}, JSON.stringify(message));
        drawMessage(message.content, message.sendDate, "You",true);
        scrollMessages();
    }
}

function drawMessage(msg, date, sender, isMyMessage) {
    let list = document.getElementById("chat-messages");
    const newMessageBlock = document.createElement("div");
    newMessageBlock.classList.add("pb-4");
    const avatarBlock = document.createElement("div");
    const avatar = document.createElement("img");
    avatar.classList.add("rounded-circle", "mr-1");
    avatar.alt = "avatar";
    avatar.height = 40;
    avatar.width = 40;
    const timeBlock = document.createElement("div");
    timeBlock.classList.add("text-muted", "small", "text-nowrap", "mt-2");
    let messageTime = date;
    const messageValue = document.createElement("div");
    messageValue.classList.add("flex-shrink-1", "bg-light", "rounded", "py-2", "px-3");
    const usernameBlock = document.createElement("div");
    usernameBlock.classList.add("font-weight-bold", "mb-1");
    const contentBlock = document.createElement("div");
    contentBlock.innerText = msg;
    usernameBlock.innerText = sender;

    if (isMyMessage) {
        newMessageBlock.classList.add("chat-message-right");
        avatar.src = document.getElementById("current-user-avatar").innerText;
        messageValue.classList.add("mr-3");
    } else {
        newMessageBlock.classList.add("chat-message-left");
        avatar.src = document.getElementById("other-user-avatar").innerText;
        messageValue.classList.add("ml-3");
    }

    let time = messageTime.getHours() + ":";
    if (messageTime.getMinutes() < 10) {
        time += "0";
    }
    time += messageTime.getMinutes();
    timeBlock.innerText = time;

    avatarBlock.appendChild(avatar);
    avatarBlock.appendChild(timeBlock);
    newMessageBlock.appendChild(avatarBlock);
    messageValue.appendChild(usernameBlock);
    messageValue.appendChild(contentBlock);
    newMessageBlock.appendChild(messageValue);
    list.appendChild(newMessageBlock);
}

function scrollMessages() {
    const messagesBlock = document.getElementById("chat-messages");
    messagesBlock.scrollTop = messagesBlock.scrollHeight;
}
