<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
<#--    <link rel="stylesheet" href="/authorization/auth_page_style.css">-->
    <link rel="stylesheet" href="/main.css">
    <title>Sign In</title>
</head>
<body>
<#--onclick="onclick"-->
<div class="container" >
<#--    <div class="top"></div>-->
<#--    <div class="bottom"></div>-->
<#--    <div class="center">-->

        <form class="sign-in form" method="post" action="/auth">
            <h2>Sign In</h2>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
            <p><label><input type="text" id="username" name="username" placeholder="nickname"/></label></p>
            <p><label><input type="password" id="password" name="password" placeholder="password"/></label></p>
            <p><label>remember me<input type="checkbox" id="remember_me" name="remember_me"/></label></p>
            <input type="submit" value="sign in">
        </form>
    </div>
</div>

</body>
</html>
