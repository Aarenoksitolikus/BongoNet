$('body').on('click', '#password-control', function () {
    const password = $('#password');
    if (password.attr('type') === 'password') {
        $(this).removeClass('fa-eye');
        $(this).addClass('fa-eye-slash');
        password.attr('type', 'text');
    } else {
        $(this).removeClass('fa-eye-slash');
        $(this).addClass('fa-eye');
        password.attr('type', 'password');
    }
    return false;
});
