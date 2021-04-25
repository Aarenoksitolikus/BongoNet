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
    <#assign avatar = (profile.avatar?? && profile.avatar != "")?then(profile.avatar, "https://shapka-youtube.ru/wp-content/uploads/2021/02/prikolnaya-avatarka-dlya-patsanov.jpg")>
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
                                    <a href="/profile/settings" class="btn btn-sm btn-info mb-2">Edit Profile</a>
                                <#else>
                                    <a href="/profile/friends" class="btn btn-sm btn-group mb-2">Add as Friend</a>
                                </#if>
                            </div>
                        </div>
                        <ul class="profile-header-tab nav nav-tabs">
                            <li class="nav-item"><a href="/chats" class="nav-link">CHATS</a></li>
                            <li class="nav-item"><a href="/profile/${username}" class="nav-link active show">POSTS</a>
                            </li>
                            <li class="nav-item"><a href="/media" class="nav-link">MEDIA</a></li>
                            <li class="nav-item"><a href="/friends" class="nav-link">FRIENDS</a></li>
                            <#if admin??>
                                <li class="nav-item"><a href="/users" class="nav-link">USERS</a></li>
                            </#if>
                        </ul>
                    </div>
                </div>
                <div class="profile-content">
                    <div class="tab-content p-0">
                        <div class="tab-pane fade active show" id="profile-post">
                            <ul class="timeline">
                                <li class="new-post">
                                    <div class="timeline-icon">
                                        <a href="javascript:">&nbsp;</a>
                                    </div>
                                    <div class="timeline-body" id="new-post">
                                        <form method="post" action="/profile/add/post" id="post-form">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                            <textarea class="form-control" id="content" name="content"
                                                      placeholder="What's new?"></textarea>
                                            <div class="col d-flex justify-content-end" style="margin-top: 5px">
                                                <input class="btn btn-primary btn-sm" type="submit" value="Post"
                                                       style="margin-right: 8px">
                                                <input class="btn btn-danger btn-sm" type="reset" value="Cancel">
                                            </div>
                                        </form>
                                    </div>
                                </li>
                                <#list posts as post>
                                    <#if post??>
                                        <li>
                                            <div class="timeline-time">
                                                <#assign isToday = .now?date?string.short>
                                                <#assign isYesterday = .now?date?string.short>
                                                <#assign postTime = post.publicationTime?date?string.short>
                                                <span class="date"><#if postTime == isToday>today<#elseif postTime == isYesterday>yesterday<#else>${post.publicationTime?date}</#if></span>
                                                <span class="time">${post.publicationTime?time?string.short}</span>
                                            </div>
                                            <div class="timeline-icon">
                                                <a href="javascript:">&nbsp;</a>
                                            </div>
                                            <div class="timeline-body">
                                                <div class="timeline-header">
                                                    <span class="userimage"><img
                                                                src="${avatar}"
                                                                alt=""></span>
                                                    <span class="username"><a
                                                                href="javascript:">${user.username}</a> <small></small></span>
                                                    <span class="pull-right text-muted">18 Views</span>
                                                </div>
                                                <div class="timeline-content">
                                                    <p>
                                                        ${post.content}
                                                    </p>
                                                </div>
                                                <div class="timeline-likes">
                                                    <div class="stats-right">
                                                        <span class="stats-text">259 Shares</span>
                                                        <span class="stats-text">21 Comments</span>
                                                    </div>
                                                    <div class="stats">
                                    <span class="fa-stack fa-fw stats-icon">
                                    <i class="fa fa-circle fa-stack-2x text-danger"></i>
                                    <i class="fa fa-heart fa-stack-1x fa-inverse t-plus-1"></i>
                                    </span>
                                                        <span class="fa-stack fa-fw stats-icon">
                                    <i class="fa fa-circle fa-stack-2x text-primary"></i>
                                    <i class="fa fa-thumbs-up fa-stack-1x fa-inverse"></i>
                                    </span>
                                                        <span class="stats-total">4.3k</span>
                                                    </div>
                                                </div>
                                                <div class="timeline-footer">
                                                    <a href="javascript:" class="m-r-15 text-inverse-lighter"><i
                                                                class="fa fa-thumbs-up fa-fw fa-lg m-r-3"></i> Like</a>
                                                    <a href="javascript:" class="m-r-15 text-inverse-lighter"><i
                                                                class="fa fa-comments fa-fw fa-lg m-r-3"></i>
                                                        Comment</a>
                                                    <a href="javascript:" class="m-r-15 text-inverse-lighter"><i
                                                                class="fa fa-share fa-fw fa-lg m-r-3"></i> Share</a>
                                                </div>
                                                <#--                                                <#if post.comments??>-->
                                                <#--                                                    <div>-->
                                                <#--                                                        ${post.comments}-->
                                                <#--                                                    </div>-->
                                                <#--                                                </#if>-->
                                                <div class="timeline-comment-box">
                                                    <div class="user"><img src="${avatar}">
                                                    </div>
                                                    <div class="input">
                                                        <form method="post" action="/profile/${username}/add/comment/${post.id}">
                                                            <input type="hidden" name="${_csrf.parameterName}"
                                                                   value="${_csrf.token}">
                                                            <div class="input-group">
                                                                <input type="text" class="form-control rounded-corner" id="content" name="content"
                                                                       placeholder="Write a comment...">
                                                                <span class="input-group-btn p-l-10">
                                          <input class="btn btn-primary f-s-12 rounded-corner" type="submit"
                                                 value="Comment">
                                          </span>
                                                            </div>
                                                        </form>
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
</body>
</html>
