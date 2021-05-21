<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Chats</title>
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.4/sockjs.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="http://netdna.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
    <link href="/styles/chats_page_style.css" rel="stylesheet">
    <link rel="icon" href="/images/favicon.ico"/>
    <#assign username = user.username>
    <#assign id = user.id>
</head>
<body>
<main class="content">
    <div class="container p-0 page-content">

        <h1 class="h3 mb-3">Messages</h1>
        <div id="current-user-id" class="d-none">${user.id}</div>

        <div class="card">
            <div class="row g-0">
                <div class="col-12 col-lg-5 col-xl-3 border-right">

                    <div class="px-4 d-none d-md-block border-bottom" style="width: 100%">
                        <div class="d-flex align-items-center">
                            <div class="flex-grow-1">
                                <input type="text" class="form-control my-3" placeholder="Search...">
                            </div>
                        </div>
                    </div>

                    <div class="contact-list" style="overflow-y: auto; height: 80vh; margin-right: -15px">
                        <#if chats??>
                            <#list chats as contact>
                                <#if user.id == contact.senderId>
                                    <#assign userId = contact.recipientId>
                                <#else>
                                    <#assign userId = contact.senderId>
                                </#if>
                                <div href="#" id="contact-${userId}"
                                     class="list-group-item list-group-item-action border-0 contact-row">
                                    <#--                                <div class="badge bg-primary float-right text-white">5</div>-->
                                    <div class="d-flex align-items-start">
                                        <img src="https://bootdey.com/img/Content/avatar/avatar5.png"
                                             class="rounded-circle mr-1"
                                             alt="Vanessa Tucker" width="40" height="40">
                                        <div class="flex-grow-1 ml-3">
                                            <#if contact.senderId = id>${contact.recipientId}<#else>${contact.senderId}</#if>
                                            <div class="small"><span class="fas fa-circle chat-online"></span> Online
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </#list>
                        </#if>
                        <#--                        <a href="#" class="list-group-item list-group-item-action border-0">-->
                        <#--                            <div class="badge bg-primary float-right text-white">5</div>-->
                        <#--                            <div class="d-flex align-items-start">-->
                        <#--                                <img src="https://bootdey.com/img/Content/avatar/avatar5.png"-->
                        <#--                                     class="rounded-circle mr-1"-->
                        <#--                                     alt="Vanessa Tucker" width="40" height="40">-->
                        <#--                                <div class="flex-grow-1 ml-3">-->
                        <#--                                    Vanessa Tucker-->
                        <#--                                    <div class="small"><span class="fas fa-circle chat-online"></span> Online</div>-->
                        <#--                                </div>-->
                        <#--                            </div>-->
                        <#--                        </a>-->
                    </div>

                    <hr class="d-block d-lg-none mt-1 mb-0">
                </div>
                <div class="col-12 col-lg-7 col-xl-9">
                    <#--                    header-->
                    <div class="py-2 px-4 border-bottom d-none d-lg-block">
                        <div class="d-flex align-items-center py-1">
                            <div class="position-relative">
                                <img src="https://bootdey.com/img/Content/avatar/avatar3.png"
                                     class="rounded-circle mr-1" alt="Sharon Lessman" width="40" height="40">
                            </div>
                            <div class="flex-grow-1 pl-3">
                                <strong>Sharon Lessman</strong>
                                <div class="text-muted small"><em>Typing...</em></div>
                            </div>
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
