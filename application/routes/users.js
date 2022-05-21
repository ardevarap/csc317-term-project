var express = require('express');
var router = express.Router();
const UserModel = require('../models/Users');
const UserError = require('../helpers/error/UserError');
var bcrypt = require("bcrypt");
const { rawListeners } = require('../app');
const {registerValidator, loginValidator} = require('../middleware/validation');
/*
 GET users listing. 
*/

router.post('/register', registerValidator, (req, res, next) => {
  let username = req.body.username;
  let email = req.body.email;
  let password = req.body.password;
  let c_password = req.body.password;

  UserModel.usernameExists(username)
  .then((userDoesNameExist) => {
    if(userDoesNameExist) {
      throw new UserError(
        "Registration Failed: Username already exists",
        "/register",
        200
      );
    } else {
      UserModel.emailExists(email);
    }
  })
  .then((emailDoesExist) => {
    if(emailDoesExist) {
      throw new UserError(
        "Registration Failed: Email already exists",
        "/register",
        200
      );
    } else {
      return UserModel.create(username, password, email);
    }
  })
  .then((createdUserId) => {
    if(createdUserId < 0) {
      throw new UserError(
        "Server Error, user could not be created",
        "/register",
        500
      );
    } else {
      console.log("User.js --> user was created!");
      req.flash('success', 'User account has been made!');
      res.redirect('/login')
    }
  })
  .catch((err) => {
    console.log("user could not be made", err);
    if (err instanceof UserError) {
      console.log(err.getMessage());
      req.flash('error', err.getMessage());
      res.status(err.getStatus());
      res.redirect(err.getRedirectURL());
    } else {
      next(err);
    }
  });
});

router.post('/login', loginValidator, (req, res, next) => {
  let username = req.body.username;
  let password = req.body.password;

    UserModel.authenticate(username, password)
    .then((loggedUserId) => {
      if (loggedUserId > 0) {
        console.log(`User ${username} is logged in`);
        req.session.username = username;
        req.session.userId = loggedUserId;
        res.locals.logged = true;
        req.flash('success', 'You have been successfully logged in!');
        res.redirect("/");
      } else {
        throw new UserError("Invalid username and/or password!", "/login", 200);
      }
    })
    .catch((err) => {
      console.log("user login failed");
      if (err instanceof UserError) {
        console.log(err.getMessage());
        req.flash('error', err.getMessage());
        res.status(err.getStatus());
        res.redirect('/login');
      } else {
        next(err);
      }
    });
});

router.post('/logout', (req, res, next) => {
  req.session.destroy((err) => {
    if (err) {
      console.log('session could not be destroyed');
      next(err);
    } else {
      console.log('Session was destroyed');
      res.clearCookie('csid');
      res.json({ status: "OK", message: "user is logged out" });
    }
  })
});
module.exports = router;
