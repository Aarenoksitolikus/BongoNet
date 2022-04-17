<div class="card">
    <div class="card-header">
        <div class="card-actions d-flex justify-content-between">
            <a href="/profile/${user.username}" style="color: black"><h5
                        class="card-title mb-0">${user.username}</h5>
            </a>
            <form method="post" action="/ban/${user.id}">
                <input type="hidden" name="${_csrf.parameterName}"
                       value="${_csrf.token}">
                <#if user.role != 'ADMIN'>
                    <#if user.state == 'ACTIVE'>
                        <input class="btn btn-outline-success btn-sm" type="submit"
                               value="${user.state}">
                    <#else>
                        <input class="btn btn-outline-danger btn-sm" type="submit"
                               value="${user.state}">
                    </#if>
                <#else>
                    <span class="btn btn-sm btn-outline-warning disabled">UNBLOCKABLE</span>
                </#if>
            </form>
        </div>
    </div>
    <div class="card-body">
        <div class="row g-0">
            <div class="col-sm-3 col-xl-12 col-xxl-3 text-center">
                <img src="${user.avatar}" width="64" height="64"
                     class="rounded-circle mt-2" alt="Avatar">
            </div>
            <div class="col-sm-9 col-xl-12 col-xxl-9">
                <strong>About me</strong>
                <p>Birthday
                    date: ${profile.birthday + " (" + ((.now?long - profile.birthday?long) / (60 * 60 * 24 * 365 * 1000))?int + ")"}</p>
                <p>Gender: ${profile.sex?string?lowerCase}</p>
                <p>${profile.about}</p>
            </div>
        </div>

        <table class="table table-sm mt-2 mb-4">
            <tbody>
            <tr>
                <th>Name</th>
                <td><#if profile.firstName?? && profile.lastName??>${profile.firstName + " " + profile.lastName}</#if></td>
            </tr>
            <tr>
                <th>Email</th>
                <td><#if user.email??>${user.email}</#if></td>
            </tr>
            <tr>
                <th>Signed up</th>
                <td>${user.creationDate}</td>
            </tr>
            <tr>
                <th>Status</th>
                <td>
                    <#if user.role == 'ADMIN'>
                        <span class="badge bg-warning">Admin</span>
                    <#elseIf user.state == 'BANNED'>
                        <span class="badge bg-danger">Banned</span>
                    <#elseIf user.state == 'ACTIVE'>
                        <span class="badge bg-success">Active</span>
                    </#if>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
</div>
