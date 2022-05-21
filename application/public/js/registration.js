function validation() {
    var userName = document.getElementById("username");
    var passWord = document.getElementById("password");
    var c_passWord = document.getElementById("c_password");

    let username_status = false;
    let password_status = false;
    let passConfirm_status = false;

    var userName_chars = /^[a-zA-Z][a-zA-Z0-9]{3,18}/;
    var passWord_chars=  /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,15}$/;

    if(!userName.value.match(userName_chars)) {
        alert("Username must satisfy the criteria: Begins with alphabetic character, must have alphanumeric characters only, and must be 3+ characters");
    }
    else {
        username_status = true;
    }

    if(!passWord.value.match(passWord_chars)) {
        alert("Password must contain the following: 1 upper case letter, 1 number, 1 of the following special characters ( / * - + ! @# $ ^ & * ), and must be 8+ characters");
    } else {
        password_status = true;
    }

    if(passWord.value != c_passWord.value) {
        alert("Passwords do not match");
    } else {
        passConfirm_status = true;
    }
    
    if(username_status && password_status && passConfirm_status){
        alert("Page submitted");
    }
}