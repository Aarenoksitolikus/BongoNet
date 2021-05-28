let stompClient;
const currentUserId = parseInt(document.getElementById("current-user-id").innerText);
const currentUserUsername = document.getElementById("current-user-username").innerText;

window.onload = async function connect() {
    SockJS = new SockJS("http://localhost/ws");
    stompClient = Stomp.over(SockJS);
    stompClient.connect({}, onConnected, onError);

    const contactRows = document.getElementsByClassName("contact-row");
    for (let i = 0; i < contactRows.length; i++) {
        contactRows[i].addEventListener("click", async function () {
            const url = "/get/chat/" + contactRows.item(i).id.replace("contact-", "") + "/" + currentUserId;
            console.log(url);
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

function onMessageReceived(msg) {

    console.log(msg);

    let list = document.getElementById("chat-messages");
    const receivedMessage = document.createElement("div");
    receivedMessage.classList.add("chat-message-left", "pb-4");

    const avatarDiv = document.createElement("div");
    const avatar = document.createElement("img");
    avatar.classList.add("rounded-circle", "mr-1");
    const name = "contact-" + msg.senderId;
    avatar.src = "/images/default-avatar.jpg";
    avatar.alt = "avatar";
    avatar.height = 40;
    avatar.width = 40;
    avatarDiv.appendChild(avatar);

    // const time = document.createElement("div");
    // time.classList.add("text-muted", "small", "text-nowrap", "mt-2");
    // let timeBlock = msg.sendDate.getHours() + ":";
    // if (msg.sendDate.getMinutes() < 10) {
    //     timeBlock += "0";
    // }
    // timeBlock += msg.sendDate.getMinutes();
    // time.innerText = timeBlock;
    // avatarDiv.appendChild(time);

    receivedMessage.appendChild(avatarDiv);

    const receivedMessageValue = document.createElement("div");
    receivedMessageValue.classList.add("flex-shrink-1", "bg-light", "rounded", "py-2", "px-3", "ml-3");
    const username = document.createElement("div");
    username.classList.add("font-weight-bold", "mb-1");
    username.innerText = msg.recipientUsername;
    receivedMessageValue.appendChild(username);
    const content = document.createElement("div");
    content.innerText = JSON.parse(msg.body.message);
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

        // let a = "<div class=\"chat-message-left pb-4\">\n" +
        //     "                <div>\n" +
        //     "                    <img src=\"${otherUser.avatar}\"\n" +
        //     "                         class=\"rounded-circle mr-1\" alt=\"avatar\" width=\"40\" height=\"40\">\n" +
        //     "                    <div class=\"text-muted small text-nowrap mt-2\">${message.sendDate?time?string.short}</div>\n" +
        //     "                </div>\n" +
        //     "                <div class=\"flex-shrink-1 bg-light rounded py-2 px-3 ml-3\">\n" +
        //     "                    <div class=\"font-weight-bold mb-1\">${message.senderUsername}</div>\n" +
        //     "                    ${message.content}\n" +
        //     "                </div>\n" +
        //     "            </div>";
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

