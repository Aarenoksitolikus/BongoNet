function clock() {
    const date = new Date(),
        hours = (date.getHours() < 10) ? '0' + date.getHours() : date.getHours(),
        minutes = (date.getMinutes() < 10) ? '0' + date.getMinutes() : date.getMinutes();
    document.getElementById('new-post-time').innerHTML = hours + ':' + minutes;
}

setInterval(clock, 1000);
