let stompClient;
const currentUserId = parseInt(document.getElementById("current-user-id").innerText);

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
    stompClient.subscribe("/user/" + currentUserId + "/queue/messages", function () {
        alert("your message was sent, please, refresh the page to see the changes")
    });
}

function send(recipientId) {
    let msg = document.getElementById("send-message").value;
    sendMessage(msg, recipientId);
    document.getElementById("send-message").value = "";
}

const onMessageReceived = (msg) => {
    const notification = JSON.parse(msg.body);
    const active = JSON.parse(sessionStorage.getItem("recoil-persist"))
        .chatActiveContact;

    if (active.id === notification.senderId) {
        findChatMessage(notification.id).then((message) => {
            const newMessages = JSON.parse(sessionStorage.getItem("recoil-persist"))
                .chatMessages;
            newMessages.push(message);
            setMessages(newMessages);
        });
    } else {
        message.info("Received a new message from " + notification.senderName);
    }
    loadContacts();
};

const sendMessage = (msg, recipientId) => {
    if (msg.trim() !== "") {
        const message = {
            senderId: currentUserId,
            recipientId: recipientId,
            content: msg.trim(),
            sendDate: new Date(),
        };

        stompClient.send("/app/chat", {}, JSON.stringify(message));
    }
};

const loadContacts = () => {
    const promise = getUsers().then((users) =>
        users.map((contact) =>
            countNewMessages(contact.id, currentUser.id).then((count) => {
                contact.newMessages = count;
                return contact;
            })
        )
    );

    promise.then((promises) =>
        Promise.all(promises).then((users) => {
            setContacts(users);
            if (activeContact === undefined && users.length > 0) {
                setActiveContact(users[0]);
            }
        })
    );
};

