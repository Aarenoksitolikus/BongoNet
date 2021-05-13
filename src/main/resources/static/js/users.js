async function getUserProfile(url) {
    let response = await fetch(url);
    let profile = await response.json();
    console.log(profile);
}
