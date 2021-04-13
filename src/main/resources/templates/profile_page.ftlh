<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link rel="stylesheet" href="/main.css">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
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
                <h3 class="m-t-10 m-b-5">${user.username}</h3>
                <p class="m-b-10">${profile.firstName} ${profile.lastName}</p>
                <p>ACTIVE: ${profile.status}</p>
            </div>
            <div class="page-header-utils">
                <#--                    <button class="notifications">Notif</button>-->
                <#--                    <button class="settings">Sett</button>-->
                <#--                    <form action="/logout">-->
                <#--                        <button class="logout" onclick="">Logout</button>-->
                <#--                    </form>-->
                <a href="/logout" class="ui-button">LOGOUT</a>
            </div>
        </div>
        <ul class="page-header-tab nav nav-tabs">
            <li class="nav-item"><a href="/profile" class="nav-link active show" data-toggle="tab">CHATS</a></li>
            <li class="nav-item"><a href="/profile" class="nav-link" data-toggle="tab">POSTS</a></li>
            <li class="nav-item"><a href="/profile" class="nav-link" data-toggle="tab">MEDIA</a></li>
            <li class="nav-item"><a href="/profile" class="nav-link" data-toggle="tab">FRIENDS</a></li>
        </ul>
    </div>
    <div class="page-content">
        Here will be some content
    </div>
</div>
</body>
</html>
