<div class="chat-messages p-4" id="chat-messages">
    <#list messages as message>
        <#if message.senderId == currentUser.id>
            <div class="chat-message-right pb-4">
                <div>
                    <img src="${currentUser.avatar}"                         class="rounded-circle mr-1" alt="Sharon Lessman" width="40" height="40">
                    <div class="text-muted small text-nowrap mt-2">${message.sendDate?time?string.short}</div>
                </div>
                <div class="flex-shrink-1 bg-light rounded py-2 px-3 mr-3">
                    <div class="font-weight-bold mb-1">You</div>${message.content}</div>
            </div>
        <#else>
            <div class="chat-message-left pb-4">
                <div>
                    <img src="${otherUser.avatar}"
                         class="rounded-circle mr-1" alt="Sharon Lessman" width="40" height="40">
                    <div class="text-muted small text-nowrap mt-2">${message.sendDate?time?string.short}</div>
                </div>
                <div class="flex-shrink-1 bg-light rounded py-2 px-3 ml-3">
                    <div class="font-weight-bold mb-1">${message.senderUsername}</div>${message.content}</div>
            </div>
        </#if>
    </#list>
</div>
<div class="flex-grow-0 py-3 px-4 border-top">
    <div class="input-group">
        <input type="text" id="send-message" class="form-control rounded-corner"
               placeholder="Type your message">
        <div class="input-group-append p-l-10">
            <button id="send-button" class="btn btn-outline-primary rounded-corner" onclick="send(${otherUserId + ", \"" + otherUser.username + "\""})">
                Send
            </button>
        </div>
    </div>
</div>

<script src="/js/chats.js"></script>
