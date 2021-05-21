<!DOCTYPE html>
<html lang="en">
<#import "spring.ftl" as spring/>
<head>
    <meta charset="utf-8">
    <title>Sign up</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="http://netdna.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles/sign_up_page_style.css">
    <link rel="icon" href="/images/favicon.ico"/>
</head>
<body>
<div class="container h-100">
    <div class="row h-100">
        <div class="col-sm-10 col-md-8 col-lg-6 mx-auto d-table h-100">
            <div class="d-table-cell align-middle">
                <div class="text-center mt-4">
                    <h1 class="h2">Get started</h1>
                    <p class="lead">

                    </p>
                </div>
                <div class="card">
                    <div class="card-body">
                        <div class="m-sm-4">
                            <@spring.bind "userForm"/>
                            <form method="post" action="/signup">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                <@spring.showErrors "<br>" "error"/>
                                <div class="input-group mb-3">
                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                    <@spring.formInput "userForm.username" "class='form-control' placeholder='Nickname' required"/>
                                </div>
                                <@spring.showErrors "<br>" "error"/>
                                <div class="input-group mb-3">
                                    <span class="input-group-addon"><i class="fa fa-envelope-square"></i></span>
                                    <@spring.formInput "userForm.email" "class='form-control' placeholder='Email' required"/>
                                </div>
                                <div id="passwordMessage" class="message">
                                    Password must contain the following:
                                    <p id="letter" class="invalid">A <b>lowercase</b> letter</p>
                                    <p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
                                    <p id="number" class="invalid">A <b>number</b></p>
                                    <p id="special" class="invalid">A <b>special symbol</b> (!@#$%^&*)</p>
                                    <p id="length" class="invalid">Minimum <b>6 characters</b></p>
                                </div>
                                <@spring.showErrors "<br>" "error"/>
                                <div class="input-group mb-3">
                                    <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                    <@spring.formPasswordInput "userForm.password" "class='form-control' placeholder='Password' reqiured"/>
                                </div>
<#--                                <@spring.showErrors "<br>" "error"/>-->
                                <div id="passwordCheckMessage" class="message">
                                    <p id="check" class="invalid">Passwords must match</p>
                                </div>
                                <div class="input-group mb-3">
                                    <span class="input-group-addon"><i class="fa fa-check"></i></span>
                                    <@spring.formPasswordInput "userForm.passwordCheck" "class='form-control' placeholder='Password again' required"/>
                                </div>
                                <div class="text-center mt-3">
                                    <input type="submit" class="btn btn-lg btn-outline-primary" value="Sign up">
                                    <p><a href="/auth">Already have account?</a></p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="/js/password_is_valid.js"></script>
</body>
</html>
