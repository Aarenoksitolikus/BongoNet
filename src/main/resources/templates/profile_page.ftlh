<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>${user.username}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="http://netdna.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles/profile_page_style.css">
    <link rel="icon" type="image/png" href="/favicon.ico"/>
    <#assign avatar = (user.avatar?? && user.avatar != "")?then(user.avatar, "https://shapka-youtube.ru/wp-content/uploads/2021/02/prikolnaya-avatarka-dlya-patsanov.jpg")>
    <#assign username = (user.username??)?then(user.username, "")>
    <#assign firstName = (profile.firstName??)?then(profile.firstName, "")>
    <#assign lastName = (profile.lastName??)?then(profile.lastName, "")>
    <#assign status = (profile.status??)?then(profile.status, "")>
    <#assign about = (profile.about??)?then(profile.about, "")>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div id="content" class="content content-full-width">
                <div class="profile">
                    <div class="profile-header">
                        <div class="profile-header-cover"></div>
                        <div class="profile-header-content">
                            <div class="profile-header-img">
                                <img src="${avatar}" alt="avatar">
                            </div>
                            <div class="profile-header-info">
                                <h4 class="m-t-10 m-b-5">${username + " (" + firstName + " " + lastName + ")"}</h4>
                                <p class="m-b-10"><#if status?? && status != "">${status}<#else>Status</#if></p>
                                <#if me??>
                                    <a href="/profile/settings" class="btn btn-sm btn-outline-info mb-2">Edit
                                        Profile</a>
                                <#else>
                                    <div class="d-flex">
                                        <#if areFriends>
                                            <form method="post" action="/add/friend/${user.id}">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                       value="${_csrf.token}">
                                                <input type="hidden" name="recipient" id="recipient" value="${user.id}">
                                                <input type="submit" class="btn btn-sm btn-outline-warning mb-2"
                                                       value="Add as Friend" style="width: 115px">
                                            </form>
                                        <#else>
                                            <span class="btn btn-sm btn-outline-warning mb-2 disabled"
                                                  style="width: 115px">Already Friends</span>
                                        </#if>
                                        <a href="/profile/me" class="btn btn-sm btn-outline-info mb-2"
                                           style="margin-left: 4px">Go to my profile</a>
                                    </div>
                                </#if>
                            </div>
                        </div>
                        <ul class="profile-header-tab nav nav-tabs">
                            <#if me??>
                                <li class="nav-item"><a href="/chats" class="nav-link">CHATS</a></li>
                            <#else>
                                <li class="naw-item"><a href="#profile-about" class="nav-link"
                                                        data-toggle="tab">ABOUT</a></li>
                            </#if>
                            <li class="nav-item">
                                <a href="#profile-friends" class="nav-link" data-toggle="tab">FRIENDS</a>
                            </li>
                            <li class="nav-item"><a href="#profile-post" class="nav-link active show"
                                                    data-toggle="tab">POSTS</a>
                            </li>
                            <#if me??>
                                <li class="nav-item"><a href="#profile-news" class="nav-link"
                                                        data-toggle="tab">NEWS</a>
                                </li>
                            </#if>
                            <#if admin??>
                                <li class="nav-item"><a href="/users" class="nav-link">USERS</a></li>
                            </#if>
                        </ul>
                    </div>
                </div>
                <div class="profile-content">
                    <div class="tab-content p-0">
                        <div class="tab-pane fade" id="profile-about">
                            <div class="row justify-content-center">
                                <div class="col-8 bg-white m-md-2 h-50 p-3">
                                    <h5>Birthday date: <#if profile.birthday??>${profile.birthday}</#if></h5>
                                    ${profile.about}
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade active show" id="profile-post">
                            <ul class="timeline">
                                <#if me??>
                                    <li class="new-post">
                                        <div class="timeline-icon">
                                            <a href="javascript:">&nbsp;</a>
                                        </div>
                                        <div class="timeline-body illuminated" id="new-post">
                                            <form method="post" action="/profile/add/post" id="post-form">
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                       value="${_csrf.token}">
                                                <textarea class="form-control" id="new-post-content" name="content"
                                                          placeholder="What's new?" rows="1"></textarea>
                                                <div class="col justify-content-end d-none" id="submit-new-post-row"
                                                     style="margin-top: 8px;">
                                                    <input class="btn btn-outline-primary btn-sm" type="submit"
                                                           value="Post"
                                                           style="margin-right: 8px">
                                                    <input class="btn btn-outline-danger btn-sm" type="reset"
                                                           value="Cancel">
                                                </div>
                                            </form>
                                        </div>
                                    </li>
                                </#if>
                                <#list posts as post>
                                    <#if post??>
                                        <li>
                                            <div class="timeline-time">
                                                <#assign isToday = .now?date?string.short>
                                                <#assign isYesterday = (.now?long - 86400000)?number_to_date?string.short>
                                                <#assign postTime = post.publicationTime?date?string.short>
                                                <span class="date"><#if postTime == isToday>today<#elseif postTime == isYesterday>yesterday<#else>${post.publicationTime?date}</#if></span>
                                                <span class="time">${post.publicationTime?time?string.short}</span>
                                            </div>
                                            <div class="timeline-icon">
                                                <a href="javascript:">&nbsp;</a>
                                            </div>
                                            <div class="timeline-body">
                                                <div class="timeline-header">
                                                    <span class="userimage illuminated"><a
                                                                href="/profile/${username}"><img
                                                                    src="${avatar}"
                                                                    alt=""></a></span>
                                                    <span class="username"><a
                                                                href="/profile/${username}">${user.username}</a></span>
                                                    <#if me??>
                                                        <div class="pull-right">
                                                            <form method="post"
                                                                  action="/profile/delete/post/${post.id}">
                                                                <input type="hidden" name="${_csrf.parameterName}"
                                                                       value="${_csrf.token}">
                                                                <input type="submit"
                                                                       class="btn btn-outline-danger btn-sm"
                                                                       value="Delete">
                                                            </form>
                                                        </div>
                                                    </#if>
                                                </div>
                                                <div class="timeline-content">
                                                    <p>
                                                        ${post.content}
                                                    </p>
                                                </div>
                                                <div class="timeline-comment-box">
                                                    <div>
                                                        <#--                                                            <#if (post.comments?size > 0)>-->
                                                        <div id="${post.id}-comments" class="comments">
                                                            <#--                                                                    ${post.comments}-->
                                                        </div>
                                                        <#--                                                            </#if>-->
                                                    </div>
                                                    <div class="new-comment">
                                                        <div class="user"><img src="${avatar}" alt="">
                                                        </div>
                                                        <div class="input">
                                                            <form method="post"
                                                                  action="/profile/${username}/add/comment/${post.id}">
                                                                <input type="hidden" name="${_csrf.parameterName}"
                                                                       value="${_csrf.token}">
                                                                <div class="input-group">
                                                                    <input type="text"
                                                                           class="form-control rounded-corner"
                                                                           id="content" name="content"
                                                                           placeholder="Write a comment..."
                                                                           autocomplete="off">
                                                                    <span class="input-group-append p-l-10">
                                          <input class="btn btn-outline-primary f-s-12 rounded-corner" type="submit"
                                                 value="Send">
                                          </span>
                                                                </div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    <#else>
                                        No posts
                                    </#if>
                                </#list>
                                <li>
                                    <div class="timeline-icon">
                                        <a href="javascript:">&nbsp;</a>
                                    </div>
                                    <div class="timeline-body">
                                        Loading...
                                    </div>
                                </li>
                            </ul>
                        </div>
                        <#if me??>
                            <div class="tab-pane fade" id="profile-news">
                                <ul class="timeline">
                                    <#list news as post>
                                        <#if post??>
                                            <li>
                                                <div class="timeline-time">
                                                    <#assign isToday = .now?date?string.short>
                                                    <#assign isYesterday = (.now?long - 86400000)?number_to_date?string.short>
                                                    <#assign postTime = post.publicationTime?date?string.short>
                                                    <span class="date"><#if postTime == isToday>today<#elseif postTime == isYesterday>yesterday<#else>${post.publicationTime?date}</#if></span>
                                                    <span class="time">${post.publicationTime?time?string.short}</span>
                                                </div>
                                                <div class="timeline-icon">
                                                    <a href="javascript:">&nbsp;</a>
                                                </div>
                                                <div class="timeline-body">
                                                    <div class="timeline-header">
                                                    <span class="userimage illuminated"><a
                                                                href="/profile/${post.author.username}"><img
                                                                    src="${avatar}"
                                                                    alt=""></a></span>
                                                        <span class="username"><a
                                                                    href="/profile/${post.author.username}">${post.author.username}</a></span>
                                                        <#--                                                    <#if me??>-->
                                                        <#--                                                        <div class="pull-right">-->
                                                        <#--                                                            <form method="post"-->
                                                        <#--                                                                  action="/profile/delete/post/${post.id}">-->
                                                        <#--                                                                <input type="hidden" name="${_csrf.parameterName}"-->
                                                        <#--                                                                       value="${_csrf.token}">-->
                                                        <#--                                                                <input type="submit"-->
                                                        <#--                                                                       class="btn btn-outline-danger btn-sm"-->
                                                        <#--                                                                       value="Delete">-->
                                                        <#--                                                            </form>-->
                                                        <#--                                                        </div>-->
                                                        <#--                                                    </#if>-->
                                                    </div>
                                                    <div class="timeline-content">
                                                        <p>
                                                            ${post.content}
                                                        </p>
                                                    </div>
                                                    <div class="timeline-comment-box">
                                                        <div>
                                                            <#--                                                            <#if (post.comments?size > 0)>-->
                                                            <div id="${post.id}-comments" class="comments">
                                                                <#--                                                                    ${post.comments}-->
                                                            </div>
                                                            <#--                                                            </#if>-->
                                                        </div>
                                                        <div class="new-comment">
                                                            <div class="user"><img src="${avatar}" alt="">
                                                            </div>
                                                            <div class="input">
                                                                <form method="post"
                                                                      action="/profile/${username}/add/comment/${post.id}">
                                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                                           value="${_csrf.token}">
                                                                    <div class="input-group">
                                                                        <input type="text"
                                                                               class="form-control rounded-corner"
                                                                               id="content" name="content"
                                                                               placeholder="Write a comment..."
                                                                               autocomplete="off">
                                                                        <span class="input-group-append p-l-10">
                                          <input class="btn btn-outline-primary f-s-12 rounded-corner" type="submit"
                                                 value="Send">
                                          </span>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        <#else>
                                            No posts
                                        </#if>
                                    </#list>
                                    <li>
                                        <div class="timeline-icon">
                                            <a href="javascript:">&nbsp;</a>
                                        </div>
                                        <div class="timeline-body">
                                            Loading...
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </#if>
                        <div class="tab-pane fade" id="profile-friends">
                            <#if me??>
                                <div class="row row-space-3">
                                    <div class="col">
                                        <h4 class="m-t-0 m-b-20">Sent Requests</h4>
                                        <#if sentRequests??>
                                            <#if sentRequests?size < 1>
                                                No requests
                                            <#else>
                                                <div>
                                                    <#list sentRequests as request>
                                                        <div class="m-b-2">
                                                            <div class="p-10 bg-white">
                                                                <div class="col">
                                                                    <div class="media media-xs overflow-visible">
                                                                        <a class="media-left"
                                                                           href="/profile/${request.recipient.username}">
                                                                            <img src="https://bootdey.com/img/Content/avatar/avatar1.png"
                                                                                 alt=""
                                                                                 class="media-object rounded-circle illuminated">
                                                                        </a>
                                                                        <div class="media-body valign-middle">
                                                                            <a style="color: black"
                                                                               href="/profile/${request.recipient.username}">
                                                                                <b class="text-inverse">${request.recipient.username}</b>
                                                                            </a>
                                                                        </div>
                                                                        <div class="media-body valign-middle text-right overflow-visible">
                                                                            <form action="/cancel/request/${request.id}"
                                                                                  method="post">
                                                                                <input type="hidden"
                                                                                       name="${_csrf.parameterName}"
                                                                                       value="${_csrf.token}">
                                                                                <input type="submit"
                                                                                       class="btn btn-sm btn-outline-danger"
                                                                                       value="Cancel">
                                                                            </form>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </#list>
                                                </div>
                                            </#if>
                                        </#if>
                                    </div>
                                    <div class="col">
                                        <h4 class="m-t-0 m-b-20">Received Requests</h4>
                                        <#if receivedRequests??>
                                            <#if receivedRequests?size < 1>
                                                No requests
                                            <#else>
                                                <div>
                                                    <#list receivedRequests as request>
                                                        <div class="m-b-2">
                                                            <div class="p-10 bg-white">
                                                                <div class="col">
                                                                    <div class="media media-xs overflow-visible">
                                                                        <a class="media-left"
                                                                           href="/profile/${request.sender.username}">
                                                                            <img src="https://bootdey.com/img/Content/avatar/avatar1.png"
                                                                                 alt=""
                                                                                 class="media-object rounded-circle illuminated">
                                                                        </a>
                                                                        <div class="media-body valign-middle">
                                                                            <a style="color: black"
                                                                               href="/profile/${request.sender.username}">
                                                                                <b class="text-inverse">${request.sender.username}</b>
                                                                            </a>
                                                                        </div>
                                                                        <div class="media-body valign-middle text-right overflow-visible d-flex justify-content-end">
                                                                            <form action="/confirm/request/${request.id}"
                                                                                  method="post">
                                                                                <input type="hidden"
                                                                                       name="${_csrf.parameterName}"
                                                                                       value="${_csrf.token}">
                                                                                <input type="submit"
                                                                                       class="btn btn-sm btn-outline-success"
                                                                                       value="Accept">
                                                                            </form>
                                                                            <form action="/reject/request/${request.id}"
                                                                                  method="post"
                                                                                  style="margin-left: 4px">
                                                                                <input type="hidden"
                                                                                       name="${_csrf.parameterName}"
                                                                                       value="${_csrf.token}">
                                                                                <input type="submit"
                                                                                       class="btn btn-sm btn-outline-danger"
                                                                                       value="Reject">
                                                                            </form>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </#list>
                                                </div>
                                            </#if>
                                        </#if>
                                    </div>
                                    <div class="col">
                                        <h4 class="m-t-0 m-b-20">Find Users</h4>
                                        <div class="input-group">
                                            <input type="search" id="form1" class="form-control" placeholder="Search"/>
                                            <span class="input-group-append">
                                            <button type="button" class="btn btn-outline-primary fa fa-search"></button>
                                        </span>
                                        </div>
                                    </div>
                                </div>
                            </#if>
                            <h4 class="mt-md-2 m-b-5">Friend List<#if friends?size != 0> (${friends?size})</#if></h4>
                            <div class="row row-space-2">
                                <#if friends??>
                                    <#if friends?size < 1>
                                        <div class="col-md-6 m-b-2">
                                            No friends
                                        </div>
                                    <#else>
                                        <#list friends as friend>
                                            <#assign friendName = friend.sender.username>
                                            <#if friendName == username>
                                                <#assign friendName = friend.recipient.username>
                                            </#if>
                                            <div class="col-md-6 m-b-2">
                                                <div class="p-10 bg-white">
                                                    <div class="col">
                                                        <div class="media media-xs overflow-visible">
                                                            <a class="media-left" href="/profile/${friendName}">
                                                                <img src="https://bootdey.com/img/Content/avatar/avatar1.png"
                                                                     alt="avatar"
                                                                     class="media-object rounded-circle illuminated">
                                                            </a>
                                                            <div class="media-body valign-middle">
                                                                <a style="color: black" href="/profile/${friendName}"><b
                                                                            class="text-inverse">${friendName}</b></a>
                                                            </div>
                                                            <div class="media-body valign-middle text-right overflow-visible">
                                                                <#if me??>
                                                                    <form action="/delete/request/${friend.id}"
                                                                          method="post">
                                                                        <input type="hidden"
                                                                               name="${_csrf.parameterName}"
                                                                               value="${_csrf.token}">
                                                                        <input type="submit"
                                                                               class="btn btn-sm btn-outline-danger"
                                                                               value="Delete">
                                                                    </form>
                                                                </#if>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </#list>
                                    </#if>
                                </#if>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="https://bootstrap-ru.com/203/assets/js/bootstrap-tab.js"></script>
<script src="/js/new_post.js"></script>
<script src="/js/comments.js"></script>
</body>
</html>
