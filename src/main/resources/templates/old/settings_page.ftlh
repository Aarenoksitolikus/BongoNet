<#ftl encoding="UTF-8"/>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/main.css">
    <title>Settings</title>
</head>
<body>
<div class="container">
    <div class="change">
        <form class="change form" method="post" action="/profile/settings">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <label for="firstName">First name</label>
            <input type="text" id="firstName" name="firstName" placeholder="First Name">
            <label for="secondName">Last name</label>
            <input type="text" id="secondName" name="lastName" placeholder="Second Name">
            <label for="birthday">Birthday date</label>
            <input type="date" id="birthday" name="birthday">
            <label for="sex">Gender</label>
            <input type="radio" id="sex" name="sex" value="MALE">Male
            <input type="radio" id="sex" name="sex" value="FEMALE">Female
            <input type="submit" value="Save changes" class="ui-button">
            <a href="/profile" class="ui-button">Cancel</a>
        </form>
    </div>
</div>
</body>
</html>
