<#ftl encoding="UTF-8"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Settings</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="http://netdna.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="icon" type="image/png" href="/favicon.ico"/>
    <link rel="stylesheet" href="/styles/settings_page_style.css">
    <style type="text/css">
        body {
            margin-top: 20px;
            background: #f8f8f8
        }

        .img-profile {
            width: 120px;
            height: 120px;
            margin-bottom: 15px
        }
    </style>
    <#assign username = (user.username??)?then(user.username, "")>
    <#assign firstName = (profile.firstName??)?then(profile.firstName, "")>
    <#assign lastName = (profile.lastName??)?then(profile.lastName, "")>
    <#assign status = (profile.status??)?then(profile.status, "")>
    <#assign about = (profile.about??)?then(profile.about, "")>
    <#assign birthday = (profile.birthday??)?then(profile.birthday?string["yyyy-MM-dd"], "")>
</head>
<body>
<div class="container">
    <div class="row flex-lg-nowrap">
        <div class="col-12 col-lg-auto mb-3" style="width: 200px;">
            <div class="card p-3">
                <div class="e-navlist e-navlist--active-bg">
                    <ul class="nav">
                        <li class="nav-item"><a class="nav-link px-2 active" href="./overview.html"><i
                                        class="fa fa-fw fa-bar-chart mr-1"></i><span>Overview</span></a></li>
                        <li class="nav-item"><a class="nav-link px-2" href="./users.html"><i
                                        class="fa fa-fw fa-th mr-1"></i><span>CRUD</span></a></li>
                        <li class="nav-item"><a class="nav-link px-2" href="./settings.html"><i
                                        class="fa fa-fw fa-cog mr-1"></i><span>Settings</span></a></li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="col">
            <div class="row">
                <div class="col mb-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="e-profile">
                                <div class="row">
                                    <div class="col-12 col-sm-auto mb-3">
                                        <div class="mx-auto" style="width: 140px;">
                                            <img class="img-profile img-responsive center-block"
                                                 src="https://shapka-youtube.ru/wp-content/uploads/2021/02/prikolnaya-avatarka-dlya-patsanov.jpg"
                                                 alt="">
                                        </div>
                                    </div>
                                    <div class="col d-flex flex-column flex-sm-row justify-content-between mb-3">
                                        <div class="text-center text-sm-left mb-2 mb-sm-0">
                                            <h4 class="pt-sm-2 pb-1 mb-0 text-nowrap">${firstName + " " + lastName}</h4>
                                            <p class="mb-0">${username}</p>
                                            <div class="text-muted"><small>Last seen 2 hours ago</small></div>
                                            <div class="mt-2">
                                                <button class="btn btn-outline-primary" type="button">
                                                    <i class="fa fa-fw fa-camera"></i>
                                                    <span>Change Photo</span>
                                                </button>
                                            </div>
                                        </div>
                                        <div class="text-center text-sm-right">
                                            <span class="badge badge-primary">${user.role}</span>
                                            <div class="text-muted"><small>Joined ${user.creationDate}</small></div>
                                        </div>
                                    </div>
                                </div>
                                <ul class="nav nav-tabs">
                                    <li class="nav-item"><a href="" class="active nav-link">Profile</a></li>
                                    <li class="nav-item"><a href="" class="nav-link">Settings (in developing)</a></li>
                                </ul>
                                <div class="tab-content pt-3">
                                    <div class="tab-pane active">
                                        <form class="form" method="post" action="/profile/settings">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                            <div class="row">
                                                <div class="col">
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label for="status">Status</label>
                                                                <input class="form-control" type="text" id="status" name="status" placeholder="Status" value="${status}">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label for="firstName">First Name</label>
                                                                <input class="form-control" type="text" id="firstName" name="firstName"
                                                                       placeholder="First name" value="${firstName}">
                                                            </div>
                                                        </div>
                                                        <div class="col">
                                                            <div class="form-group">
                                                                <label for="lastName">Last Name</label>
                                                                <input class="form-control" type="text" id="lastName" name="lastName"
                                                                       placeholder="Last name" value="${lastName}">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col mb-3">
                                                            <label for="birthday">Birthday date</label>
                                                            <input class="form-control" type="date" id="birthday" name="birthday" min="1900-01-01" value="${birthday}">
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col mb-3">
                                                            <div class="form-group">
                                                                <label for="about">About</label>
                                                                <textarea class="form-control" rows="5" id="about" name="about"
                                                                          placeholder="My Bio">${about}</textarea>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col d-flex justify-content-end">
                                                    <input class="btn btn-outline-primary" type="submit" value="Save Changes" style="margin-right: 10px">
                                                    <a class="btn btn-outline-danger" href="/profile/me">Cancel</a>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-12 col-md-3 mb-3">
                    <div class="card mb-3">
                        <div class="card-body">
                            <div class="px-xl-3">
                                <a href="/logout" class="btn btn-outline-block btn-outline-secondary">
                                    <i class="fa fa-sign-out"></i>
                                    <span>Logout</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</body>
</html>
