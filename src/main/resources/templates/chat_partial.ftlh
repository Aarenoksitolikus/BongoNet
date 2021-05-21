<div class="chat-messages p-4">

    <#list messages as message>
        <#if message.senderId == currentUserId>
            <div id="messages-list" class="chat-message-right pb-4">
                <div>
                    <img src="https://bootdey.com/img/Content/avatar/avatar1.png"
                         class="rounded-circle mr-1" alt="Chris Wood" width="40" height="40">
                    <div class="text-muted small text-nowrap mt-2">${message.sendDate?time?string.short}</div>
                </div>
                <div class="flex-shrink-1 bg-light rounded py-2 px-3 mr-3">
                    <div class="font-weight-bold mb-1">You</div>
                    ${message.content}
                </div>
            </div>
        <#else>
            <div class="chat-message-left pb-4">
                <div>
                    <img src="https://bootdey.com/img/Content/avatar/avatar3.png"
                         class="rounded-circle mr-1" alt="Sharon Lessman" width="40" height="40">
                    <div class="text-muted small text-nowrap mt-2">2:34 am</div>
                </div>
                <div class="flex-shrink-1 bg-light rounded py-2 px-3 ml-3">
                    <div class="font-weight-bold mb-1">Sharon Lessman</div>
                    ${message.content}
                </div>
            </div>
        </#if>
    </#list>
</div>

<#--                    send message-->
<div class="flex-grow-0 py-3 px-4 border-top">
    <div class="input-group">
        <input type="text" id="send-message" class="form-control rounded-corner"
               placeholder="Type your message">
        <div class="input-group-append p-l-10">
            <button id="send-button" class="btn btn-outline-primary rounded-corner" onclick="send(${otherUserId})">
                Send
            </button>
        </div>
    </div>
</div>
