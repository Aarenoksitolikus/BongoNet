<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/main.css">
    <title>Chats</title>
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
                <h3>${user.username}</h3>
                <p><#if profile.firstName??>${profile.firstName}<#else>First name</#if> <#if profile.lastName??>${profile.lastName}<#else>Last name</#if></p>
                <p>ACTIVE: <#if profile.status??>${profile.status}</#if></p>
            </div>
            <div class="page-header-utils">
                <a href="/profile/settings">Edit profile</a>
                <a href="/logout">Logout</a>
            </div>
        </div>
        <ul class="page-header-tab nav nav-tabs">
            <li class="nav-item"><a href="/chats" class="nav-link  active show" data-toggle="tab">CHATS</a></li>
            <li class="nav-item"><a href="/profile" class="nav-link" data-toggle="tab">POSTS</a></li>
            <li class="nav-item"><a href="/profile" class="nav-link" data-toggle="tab">MEDIA</a></li>
            <li class="nav-item"><a href="/profile" class="nav-link" data-toggle="tab">FRIENDS</a></li>
        </ul>
    </div>
</div>
</body>
</html>
