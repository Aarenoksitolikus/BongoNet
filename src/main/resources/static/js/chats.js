let stompClient;
const currentUserId = parseInt(document.getElementById("current-user-id").innerText);
const currentUserUsername = document.getElementById("current-user-username").innerText;

window.onload = async function connect() {
    SockJS = new SockJS("http://localhost/ws");
    stompClient = Stomp.over(SockJS);
    stompClient.connect({}, onConnected, onError);

    const contactRows = document.getElementsByClassName("contact-row");
    const userSearch = document.getElementById("user-search");
    const userSearchName = document.getElementById("user-search-name");
    userSearch.addEventListener("click", async function () {
        const url = "/get/chat/" + userSearchName.value;
        console.log(userSearchName.value);
        let response = await fetch(url);
        document.getElementById("chat-partial").innerHTML = await response.text();
    })
    for (let i = 0; i < contactRows.length; i++) {
        contactRows[i].addEventListener("click", async function () {
            const url = "/get/chat/" + contactRows.item(i).id.replace("contact-", "") + "/" + currentUserId;
            let response = await fetch(url);
            document.getElementById("chat-partial").innerHTML = await response.text();
        });
    }
}

function onError() {
    console.log("error during connection")
}

function onConnected() {
    const destination = "/user/" + currentUserId + "/queue/messages";
    stompClient.subscribe(destination, onMessageReceived)
}

function send(recipientId, recipientUsername) {
    let msg = document.getElementById("send-message").value;
    sendMessage(msg, recipientId, recipientUsername);
    document.getElementById("send-message").value = "";
}

const onMessageReceived = (msg) => {
        let list = document.getElementById("chat-messages");
    const receivedMessage = document.createElement("div");
    receivedMessage.classList.add("chat-message-left", "pb-4");

    const avatarDiv = document.createElement("div");
    const avatar = document.createElement("img");
    avatar.classList.add("rounded-circle", "mr-1");
    avatar.src = document.getElementById("other-user-avatar").innerText;
    avatar.alt = "avatar";
    avatar.height = 40;
    avatar.width = 40;
    avatarDiv.appendChild(avatar);

    const messageTime = JSON.parse(msg.body).sendDate;
    console.log(messageTime);
    const time = document.createElement("div");
    time.classList.add("text-muted", "small", "text-nowrap", "mt-2");
    let timeBlock = messageTime.getHours() + ":";
    if (messageTime.getMinutes() < 10) {
        timeBlock += "0";
    }
    timeBlock += messageTime.getMinutes();
    time.innerText = timeBlock;
    avatarDiv.appendChild(time);

    receivedMessage.appendChild(avatarDiv);

    const receivedMessageValue = document.createElement("div");
    receivedMessageValue.classList.add("flex-shrink-1", "bg-light", "rounded", "py-2", "px-3", "ml-3");
    const username = document.createElement("div");
    username.classList.add("font-weight-bold", "mb-1");
    username.innerText = JSON.parse(msg.body).senderUsername;
    receivedMessageValue.appendChild(username);
    const content = document.createElement("div");
    content.innerText = JSON.parse(msg.body).content;
    receivedMessageValue.appendChild(content);

    receivedMessage.appendChild(receivedMessageValue);
    list.appendChild(receivedMessage);
    // newMessage.appendChild(document.createTextNode(JSON.parse(msg.body).message));
}

const sendMessage = (msg, recipientId, recipientUsername) => {
    if (msg.trim() !== "") {
        const message = {
            senderId: currentUserId,
            recipientId: recipientId,
            senderUsername: currentUserUsername,
            recipientUsername: recipientUsername,
            content: msg.trim(),
            sendDate: new Date(),
        };

        stompClient.send("/app/chat", {}, JSON.stringify(message));

        let list = document.getElementById("chat-messages");
        const sentMessage = document.createElement("div");
        sentMessage.classList.add("chat-message-right", "pb-4");

        const avatarDiv = document.createElement("div");
        const avatar = document.createElement("img");
        avatar.src = document.getElementById("current-user-avatar").innerText;
        avatar.classList.add("rounded-circle", "mr-1");
        avatar.alt = "avatar";
        avatar.height = 40;
        avatar.width = 40;
        avatarDiv.appendChild(avatar);

        const time = document.createElement("div");
        time.classList.add("text-muted", "small", "text-nowrap", "mt-2");
        let timeBlock = message.sendDate.getHours() + ":";
        if (message.sendDate.getMinutes() < 10) {
            timeBlock += "0";
        }
        timeBlock += message.sendDate.getMinutes();
        time.innerText = timeBlock;
        avatarDiv.appendChild(time);

        sentMessage.appendChild(avatarDiv);

        const sentMessageValue = document.createElement("div");
        sentMessageValue.classList.add("flex-shrink-1", "bg-light", "rounded", "py-2", "px-3", "ml-3");
        const username = document.createElement("div");
        username.classList.add("font-weight-bold", "mb-1");
        username.innerText = "You";
        sentMessageValue.appendChild(username);
        const content = document.createElement("div");
        content.innerText = msg.trim();
        sentMessageValue.appendChild(content);

        sentMessage.appendChild(sentMessageValue);
        list.appendChild(sentMessage);
    }
};

