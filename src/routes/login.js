import cookieParser from "cookie-parser";
import express from "express";
import expressSession from 'express-session';
import { selectSql } from "../database/sql";

const router = express.Router();

router.use(cookieParser());
router.use(expressSession({
    secret: 'dilab',
    resave: true,
    saveUninitialized: true,
}))

router.get('/', (req, res) => {
    if (req.cookies.user) {
        res.render('/main', { 
            'user': req.cookies.user,
        });
    } else {
        res.render('login');
    }
});

router.get('/logout', (req, res) => {
    if (req.cookies.user) {
        res.clearCookie('user')
        res.redirect("/");
    } else {
        res.redirect("/");
    }
})

router.post('/', async (req, res) => {
    const vars = req.body;
    const users = await selectSql.getUsers();
    var whoAmI = 1;
    var loginType = 1;
    let checkLogin = false;

    users.map((user) => {
        if (vars.id == user.id && vars.password === user.password) {
            checkLogin = true;
            whoAmI = user.id;
            if (user.role === 'Admin') loginType = 99;
            if (user.role === 'Doctor') loginType = 51;
            if (user.role === 'Nurse') loginType = 61;
            if (user.role === 'Patient') loginType = 25;
    
            res.cookie('user', whoAmI, {
                expires: new Date(Date.now() + 3600000), // ms 단위 (3600000: 1시간 유효)
                httpOnly: true
            });
            res.cookie('role', user.role, {
                expires: new Date(Date.now() + 3600000),
                httpOnly: true
            });
    
            res.role = user.role;
        }
    });
    

    if (checkLogin) {
        console.log('Login successful for user:', whoAmI);

        if (loginType == 99) {
            res.redirect('/admin');
        } else if (loginType == 51) {
            res.redirect('/doctor');
        } else if (loginType == 61) {
            res.redirect('/nurse');
        } else if (loginType == 25) {
            res.redirect('/patient');
        }

    } else {
        res.redirect('/');
    }
})

module.exports = router;