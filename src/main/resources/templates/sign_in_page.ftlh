<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Sign in</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://netdna.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://netdna.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/styles/sign_in_page_style.css">
    <link rel="icon" href="/images/favicon.ico"/>
</head>
<body>
<br>
<br>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card-group mb-0">
                <div class="card p-4">
                    <div class="card-body">
                        <h1>Login</h1>
                        <p class="text-muted">Sign In to your account</p>
                        <form method="post" action="/auth">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                            <div class="input-group mb-3">
                                <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                <input type="text" class="form-control" id="username" name="username"
                                       placeholder="Username">
                            </div>
                            <div class="input-group mb-3">
                                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                <input type="password" class="form-control" id="password" name="password"
                                       placeholder="Password">
                                <span class="input-group-append"><button id="password-control"
                                                                         class="btn btn-light fa fa-eye"
                                                                         style="border: 1px solid #ced4da; border-left: none"></button></span>
                            </div>
                            <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="remember_me"
                                       name="remember_me"/>
                                <label class="custom-control-label" for="remember_me">Remember me</label>
                            </div>
                            <div class="row mt-2">
                                <div class="col-6">
                                    <input type="submit" class="btn btn-outline-primary px-4" value="Login">
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="card text-white bg-primary py-5 d-md-down-none" style="width:44%">
                    <div class="card-body text-center">
                        <div>
                            <h2>Sign up</h2>
                            <p>BongoNet is a small, cozy social network for those who like to be aware of all the new
                                interesting thoughts of their friends. Join us!</p>
                            <a href="/signup" type="button" class="btn btn-primary active mt-3">Register Now!</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<script src="/js/show_password.js"></script>
</body>
</html>
