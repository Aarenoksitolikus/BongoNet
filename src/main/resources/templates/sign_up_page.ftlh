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
<div class="container">
    <div class="sign-up">
        <@spring.bind "userForm"/>
        <form class="sign-up form" method="post" action="/signup">
            <h1>Sign Up</h1>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <p><label>Enter your nickname in BongoNet:</label></p>
            <p><@spring.formInput "userForm.username" "placeholder='Nickname'"/></p>
            <@spring.showErrors "<br>" "error"/>
            <p><label>Enter your email address:</label></p>
            <p><@spring.formInput "userForm.email" "placeholder='Email'"/></p>
            <@spring.showErrors "<br>" "error"/>
            <p><label>Сome up with and enter your password:</label></p>
            <p><@spring.formPasswordInput "userForm.password" "placeholder='Password'"/></p>
            <@spring.showErrors "<br>" "error"/>
            <p><input type="submit" value="Sign up!" class="ui-button"/></p>
            <p><a href="/auth">Already have account?</a></p>
        </form>
    </div>
</div>
</body>
</html>
