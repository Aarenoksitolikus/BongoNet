<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="/main.css">
    <link rel="stylesheet" href="/users_page_style.css">
    <title>Users</title>
</head>
<body>
<div class="users_view">
    <a href="/profile" class="ui-button">GO TO PROFILE</a>
    <table>
        <tr>
            <th>id</th>
            <th>username</th>
            <th>role</th>
            <th>state</th>
        </tr>
        <#list usersList as user>
            <tr>
                <td><#if user.id??>${user.id}<#else>id</#if></td>
                <td><#if user.username??>${user.username}<#else>username</#if></td>
                <td><#if user.role??>${user.role}<#else>role</#if></td>
                <td>
                    <#if user.state??>
                        <#if user.role == 'ADMIN'>
                            UNBLOCKABLE
                        <#else>
                            <form method="post" action="/ban/${user.id}">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                <input type="submit" value="${user.state}">
                            </form>
                        </#if>
                    </#if>
                </td>
            </tr>
        </#list>
    </table>
</div>
</body>
</html>
