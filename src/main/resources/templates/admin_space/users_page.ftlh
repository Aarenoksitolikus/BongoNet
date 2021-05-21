<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Users</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" rel="script">
    <link href="http://netdna.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="/styles/users_page_style.css" rel="stylesheet">
    <link rel="icon" href="/images/favicon.ico"/>

    <script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <script src="/js/users.js"></script>
</head>
<body>
<div class="container">
    <div class="container-fluid p-0">
        <h1 class="h3 mb-3">Clients</h1>
        <div class="row">
            <div class="col-xl-8">
                <div class="card">
                    <div class="card-header pb-0">
                        <div class="card-actions float-right">
                            <a href="/profile/me" class="btn btn-sm btn-outline-info mb-2">Go to my profile</a>
                        </div>
                        <h5 class="card-title mb-0">Users</h5>
                    </div>
                    <div class="card-body">
                        <table class="table table-striped" style="width:100%">
                            <thead>
                            <tr>
                                <th>Avatar</th>
                                <th>Name</th>
                                <th>Username</th>
                                <th>Email</th>
                                <th>Status</th>
                            </tr>
                            </thead>
                            <#list usersList as user>
                                <tbody class="user-row" id="user-${user.id}">
                                <tr class="illuminated" <#--onclick="getUserProfile('/get/profile/${user.id}')"-->>
                                    <td><a href="/profile/${user.username}"><img src="${user.avatar}" width="32"
                                             height="32" class="rounded-circle my-n1 illuminated" alt="Avatar"></a></td>
                                    <td>${user.profile.firstName + " " + user.profile.lastName}</td>
                                    <td><#if user.username??>${user.username}<#else>username</#if></td>
                                    <td><#if user.email??>${user.email}<#else>email</#if></td>
                                    <td>
                                        <#if user.state??>
                                            <#if user.role == 'ADMIN'>
                                                <span class="badge bg-warning">Admin</span>
                                            <#elseIf user.state == 'ACTIVE'>
                                                <span class="badge bg-success">Active</span>
                                            <#elseIf user.state == 'BANNED'>
                                                <span class="badge bg-danger">Banned</span>
                                            <#elseIf user.state == 'DELETED'>
                                                <span class="badge bg-secondary">Deleted</span>
                                            </#if>
                                        </#if>
                                    </td>
                                </tbody>
                            </#list>
                        </table>
                    </div>
                </div>
            </div>
            <div id="user-partial" class="col-xl-4"></div>
        </div>
    </div>
</div>
</body>
</html>
