
const routeProtectors = {};

routeProtectors.userIsLoggedIn = function(req, res, next) {
    if(req.session.username) {
        console.log('User is logged in');
        next();
    }else {
        console.log('User is not logged in!');
        req.flash('error', 'You must be logged in to create a Post');
        res.redirect('/login'); 
    }
}
module.exports = routeProtectors;