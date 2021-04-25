<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <link rel="stylesheet" href="/main.css">
    <link rel="stylesheet" href="/posts.css">
    <#--    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">-->
    <#--    <link href="http://netdna.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">-->
    <title>Profile</title>
</head>
<body>
<div class="container">
    <div class="page-header">
        <div class="page-header-cover"></div>
        <div class="page-header-content">
            <div class="page-header-avatar">
                <img id="avatar" alt="avatar"
                     src="https://shapka-youtube.ru/wp-content/uploads/2021/02/prikolnaya-avatarka-dlya-patsanov.jpg">
            </div>
            <div class="page-header-info">
                <h2>${user.username}</h2>
                <p><#if profile.firstName??>${profile.firstName}<#else>First name</#if> <#if profile.lastName??>${profile.lastName}<#else>Last name</#if></p>
                <p><#if profile.status??>${profile.status}</#if></p>
            </div>
        </div>
        <ul class="page-header-tab nav nav-tabs">
            <li class="nav-item"><a href="/chats" class="nav-link" data-toggle="tab">CHATS</a></li>
            <li class="nav-item"><a href="/profile" class="nav-link active show" data-toggle="tab">POSTS</a></li>
            <li class="nav-item"><a href="/profile" class="nav-link" data-toggle="tab">MEDIA</a></li>
            <li class="nav-item"><a href="/profile" class="nav-link" data-toggle="tab">FRIENDS</a></li>
        </ul>
    </div>
    <div class="page-content">
        <div class="add-post">

        </div>
        <#list posts as post>
            <#if post??>
                <div class="tab-content">
                    <div class="tab-pane fade active show" id="profile-post">
                        <ul class="timeline">
                            <li>
                                <div class="timeline-time">
                                    <span class="date">${post.publicationDate}</span>
                                    <span class="time">${post.publicationTime}</span>
                                </div>
                                <div class="timeline-icon">
                                    <a href="javascript:;">&nbsp;</a>
                                </div>
                                <div class="timeline-body">
                                    <div class="timeline-header">

                                <span class="userimage"><img
                                            src="https://shapka-youtube.ru/wp-content/uploads/2021/02/prikolnaya-avatarka-dlya-patsanov.jpg"
                                            alt=""></span>
                                        <span class="username"><a
                                                    href="/profile">${user.username}</a> <small></small></span>
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
                                        <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i
                                                    class="fa fa-thumbs-up fa-fw fa-lg m-r-3"></i> Like</a>
                                        <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i
                                                    class="fa fa-comments fa-fw fa-lg m-r-3"></i> Comment</a>
                                        <a href="javascript:;" class="m-r-15 text-inverse-lighter"><i
                                                    class="fa fa-share fa-fw fa-lg m-r-3"></i> Share</a>
                                    </div>
                                    <div class="timeline-comment-box">
                                        <div class="user"><img
                                                    src="https://shapka-youtube.ru/wp-content/uploads/2021/02/prikolnaya-avatarka-dlya-patsanov.jpg">
                                        </div>
                                        <div class="input">
                                            <form action="">
                                                <div class="input-group">
                                                    <input type="text" class="form-control rounded-corner"
                                                           placeholder="Write a comment...">
                                                    <span class="input-group-btn p-l-10">
                                          <button class="btn btn-primary f-s-12 rounded-corner"
                                                  type="button">Comment</button>
                                          </span>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </li>
                        </ul>

                    </div>
                </div>
            <#else>
                No posts
            </#if>
        </#list>
    </div>
</div>
</body>
</html>
