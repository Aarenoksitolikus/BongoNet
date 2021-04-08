<!doctype html>
<html lang="en">
<#import "spring.ftl" as spring/>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/main.css">
    <title>Sign Up</title>
</head>
<body>
<div class="sign-up">
    <@spring.bind "userForm"/>
    <form class="sign-up form" method="post" action="/signup">
        <h1>Sign Up</h1>
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
        <p><label for="username">Enter your nickname in BongoNet:</label></p>
        <p><input type="text" id="username" name="username" placeholder="Nickname"></p>
        <p><label>Enter your email address:</label></p>
        <p><@spring.formInput "userForm.email" "placeholder='Email'"/></p>
        <@spring.showErrors "<br>" "error"/>
        <p><label for="password">Сome up with and enter your password:</label></p>
        <p><input type="password" id="password" name="password" placeholder="Password"></p>
<#--        <p><label for="check_password">Enter your password once again:</label></p>-->
<#--        <p><input type="password" id="check_password" name="check_password" placeholder="Password once again"></p>-->
        <p><button type="submit">Sign up!</button></p>
    </form>
</div>
</body>
</html>
