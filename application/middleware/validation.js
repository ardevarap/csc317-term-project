var db = require('../config/database');
var bcrypt = require('bcrypt');

const checkUsername = (username) => {
    let usernameChecker = /^\D\w{2,}$/;
    return usernameChecker.test(username);
}

const checkPassword = (password) => {
    let passwordChecker = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9])(?!.*\s).{8,}$/;
    return passwordChecker.test(password);
}

const checkEmail = (email) => {
    let emailChecker = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    return emailChecker.test(email);
}

const checkC_Password = (password, c_password) => {
    if (password == c_password) {
        return true;
    } else {
        return false;
    }
}

const registerValidator = (req, res, next) => {
    let username = req.body.username;
    let password = req.body.password;
    let email = req.body.email;
    let c_password = req.body.c_password;

    if (!checkUsername(username)) {
        req.flash('error', "invalid username!!!");
        req.session.save(err => {
            res.redirect("/register");
        });
    } else if (!checkPassword(password)) {
        req.flash('error', "invalid password!!!");
        req.session.save(err => {
            res.redirect("/register");
        });
    } else if (!checkEmail(email)) {
        req.flash('error', "invalid email!!!");
        req.session.save(err => {
            res.redirect("/register");
        });
    } else if (!checkC_Password(password, c_password)) {
        req.flash('error', "passwords do not match!!!");
        req.session.save(err => {
            res.redirect("/register");
        });
    } else {
        next();
    }
}

const loginValidator = (req, res, next) => {
    let username = req.body.username;
    let password = req.body.password;

    if(!checkUsername(username)){
        req.flash('error', "Invalid username!")
        req.session.save(err => {
            res.redirect("/login");
        });
    }
    if(!checkPassword(password)){
        req.flash('error', "Invalid password!")
        req.session.save(err => {
            res.redirect("/login");
        });
    }
    else{
        next();
    } 
}

module.exports = { registerValidator, loginValidator }