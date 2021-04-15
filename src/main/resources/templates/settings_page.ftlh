<#ftl encoding="UTF-8"/>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/main.css">
    <title>Hello!</title>
</head>
<body>
<div class="container">
    <div class="hello">
        <form class="hello form" method="post" action="/profile/settings">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <p><label for="firstName">What's your first name?</label></p>
            <p><input type="text" id="firstName" name="firstName" placeholder="First Name"></p>
            <p><label for="secondName">What's your second name?</label></p>
            <p><input type="text" id="secondName" name="lastName" placeholder="Second Name"></p>
            <p><label for="birthday"></label>When is your birthday?</p>
            <p><input type="date" id="birthday" name="birthday"></p>
            <p><label for="sex">What is your gender</label></p>
            <p><input type="radio" id="sex" name="sex" value="MALE">Male</p>
            <p><input type="radio" id="sex" name="sex" value="FEMALE">Female</p>
            <p><input type="submit" value="Create profile!" class="ui-button"></p>
        </form>
    </div>
</div>
</body>
</html>
