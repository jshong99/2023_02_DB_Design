import express from "express";
import cookieParser from "cookie-parser";
import { selectSql, createSql, deleteSql } from '../database/sql';

const router = express.Router();
router.use(cookieParser());

router.use((req, res, next) => {
    if (req.cookies && req.cookies.role) {
        if (req.cookies.role === 'Patient') { 
            next(); 
        } else {
            res.redirect('/' + req.cookies.role.toLowerCase());
        }
    } else {
        res.redirect('/');
    }
});

router.get('/', async function (req, res) {
    
    if (req.cookies.user) {

        const data = {
            patientId: req.cookies.user,
        };

        const myReservations = await selectSql.getMyReservations(data);

        res.render('patient', {
            user: req.cookies.user,
            title: "My Reservations",
            myReservations,
        });
    } else {
        res.redirect('/')
    }

});

router.post('/add', async(req, res) => {
    
    const data = {
        pID: req.cookies.user,
        dID: req.body.MedicalSpecialty_deptID,
        rtime: req.body.reservtime,
    };

    await createSql.addReservation(data);
    res.redirect('/patient');

});

router.post('/cancel', async(req, res) => {

    const reservnum = Object.keys(req.body)[0];
    const data = {
        rID: reservnum,
    };

    await deleteSql.cancelReservation(data);
    res.redirect('/patient');
});

module.exports = router;