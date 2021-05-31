<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Chats</title>
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="http://netdna.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="/styles/chats_page_style.css" rel="stylesheet">
    <link rel="icon" href="/images/favicon.ico"/>
    <#assign username = user.username>
    <#assign id = user.id>
</head>
<body>
<main class="content">
    <div class="container p-0 page-content">

        <h1 class="h3 mb-3">Messages</h1>
        <div id="current-user-id" class="d-none">${id}</div>
        <div id="current-user-username" class="d-none">${username}</div>
        <div id="current-user-avatar" class="d-none">${user.avatar}</div>

        <div class="card">
            <div class="row g-0">
                <div class="col-12 col-lg-5 col-xl-3 border-right">

                    <div class="px-4 border-bottom input-group">
                        <#--                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">-->
                        <input type="text" id="user-search-name" name="username"
                               class="form-control rounded-corner my-3"
                               placeholder="Search"/>
                        <div class="input-group-append p-l-10" id="user-search">
                            <button type="button" class="btn btn-outline-primary fa fa-search rounded-corner my-3"></button>
                        </div>
                    </div>

                    <div class="contact-list">
                        <#if chats??>
                            <#list chats as contact>
                                <#if user.id == contact.senderId>
                                    <#assign userId = contact.recipientId>
                                    <#assign userUsername = contact.recipientUsername>
                                    <#if contact.recipientAvatar??>
                                        <#assign userAvatar = contact.recipientAvatar>
                                    <#else>
                                        <#assign userAvatar = "/images/default-avatar.jpg">
                                    </#if>
                                <#else>
                                    <#assign userId = contact.senderId>
                                    <#assign userUsername = contact.senderUsername>
                                    <#if contact.senderAvatar??>
                                        <#assign userAvatar = contact.senderAvatar>
                                    <#else>
                                        <#assign userAvatar = "/images/default-avatar.jpg">
                                    </#if>
                                </#if>
                                <div href="#" id="contact-${userId}"
                                     class="list-group-item list-group-item-action border-0 contact-row">
                                    <div class="d-flex align-items-start">
                                        <a href="/profile/${userUsername}">
                                            <img src="${userAvatar}"
                                                 class="rounded-circle mr-1 illuminated"
                                                 alt="avatar" width="40" height="40">
                                        </a>
                                        <div class="flex-grow-1 ml-3">
                                            <#if contact.senderId = id>${contact.recipientUsername}<#else>${contact.senderUsername}</#if>
                                        </div>
                                    </div>
                                </div>
                            </#list>
                        </#if>
                    </div>

                    <hr class="d-block d-lg-none mt-1 mb-0">
                </div>
                <div class="col-12 col-lg-7 col-xl-9">
                    <div class="py-2 px-4 border-bottom d-none d-lg-block">
                        <div class="d-flex align-items-center justify-content-end py-1">
                            <div>
                                <a href="/profile/me" class="btn btn-outline-info">Go to my profile</a>
                            </div>
                        </div>
                    </div>

                    <div class="position-relative" id="chat-partial"></div>
                </div>
            </div>
        </div>
    </div>
</main>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src="/js/chats.js"></script>
</body>
</html>
