var express = require('express');
var router = express.Router();
const{ create } = require('../models/comments');

router.post('/create', (req, res, next) => { 
    if(!req.session.username) {
        console.log("must be logged in to comment");
        res.json({
            code: -1,
            status:"danger",
            message: "Must be logged in to create a comment"
        });
    } else {
        let {comment, postId} = req.body;
        let username = req.session.username;
        let userId = req.session.userId;

        create(userId, postId, comment)
        .then((wasSuccessful) => {
            if(wasSuccessful !== -1) {
                console.log(`comment was created for ${username}`);
                res.json({
                    code: 1,
                    status:"success",
                    message:"comment created",
                    comment:comment,
                    username:username
                })
            } else {
                    console.log('comment was not saved');
                    res.json({
                        code: -1,
                        status:"danger",
                        message:"comment was not created"
                })
            }
        }).catch((err) => next(err));  
    }
})

module.exports = router; 