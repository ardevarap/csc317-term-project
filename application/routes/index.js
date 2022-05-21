var express = require('express');
const { rawListeners } = require('../config/database');
var router = express.Router();
var isLoggedIn = require('../middleware/routeprotectors').userIsLoggedIn;
const {getRecentPosts, getPostById, getCommentsByPostId} = require('../middleware/postsmiddleware');
var db = require("../config/database");

/* GET home page. */
router.get('/', getRecentPosts, function(req, res, next) {
  res.render('index', { title: 'CSC 317 App', name:"Aakanksha Devarapally" });
});

router.get('/login', (req, res, next) =>{
  res.render('login');
});

router.get('/register', (req, res, next) =>{
  res.render('registration', {title:"Register"});
});

router.use('/postImage', isLoggedIn);
router.get('/postimage', (req, res, next) =>{
  res.render('postimage');
});

router.get("/post/:id(\\d+)", getPostById, getCommentsByPostId, (req, res, next) => {
  res.render('viewpost', {title: `Post ${req.params.id}`});
}); 

module.exports = router;
