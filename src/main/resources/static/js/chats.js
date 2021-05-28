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
    let list = document.getElementById("chat-messages");
    console.log(list);
    let newMessage = document.createElement("div");
    newMessage.classList.add("pb-4");
    newMessage.appendChild(document.createTextNode(JSON.parse(msg.body).message));
    list.appendChild(newMessage);
    // scrollMessages();
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
        avatar.classList.add("rounded-circle", "mr-1");
        avatar.src = document.getElementById("current-user-avatar").innerText;
        avatar.height = 40;
        avatar.width = 40;

        const time = document.createElement("div");
        time.classList.add("text-muted", "small", "text-nowrap", "mt-2");
        time.innerText = message.sendDate.getHours() + ":" + message.sendDate.getMinutes();
        avatarDiv.appendChild(avatar)
        avatarDiv.appendChild(time);

        const sentMessageValue = document.createElement("div");
        sentMessageValue.classList.add("flex-shrink-1", "bg-light", "rounded", "py-2", "px-3", "ml-3");
        const username = document.createElement("div");
        username.classList.add("font-weight-bold", "mb-1");
        username.innerText = currentUserUsername;

        sentMessageValue.appendChild(username);
        sentMessageValue.innerText = msg.trim();
        sentMessage.appendChild(avatarDiv);
        sentMessage.appendChild(sentMessageValue);

        list.appendChild(sentMessage);
    }
};

// function scrollMessages() {
//     $('message-list').stop().animate({
//         scrollTop: $('message-list')[0].scrollHeight
//     }, 800);
// }

