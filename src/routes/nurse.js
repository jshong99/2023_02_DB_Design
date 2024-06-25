import express from "express";
import cookieParser from "cookie-parser";
import { selectSql, createSql, deleteSql, updateSql } from '../database/sql';

const router = express.Router();
router.use(cookieParser());

router.use((req, res, next) => {
    if (req.cookies && req.cookies.role) {
        if (req.cookies.role === 'Nurse') { 
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
            nurseId: req.cookies.user,
        };

        const myTreatments = await selectSql.getMyTreatments(data);

        res.render('nurse', {
            user: req.cookies.user,
            title: "My Treatments",
            myTreatments,
        });
    } else {
        res.redirect('/')
    }

});

router.get('/search', async (req, res) => {
    const searchingName = req.query.search;
    const patients = await selectSql.searchPatients(searchingName);

    res.render('nurse', {
        user: req.cookies.user,
        title: "Search Results",
        patients: patients,
    });
});

router.post('/add', async(req, res) => {
    
    const data = {
        pID: req.body.Patient_id,
        nID: req.cookies.user,
        ttime: req.body.treatmenttime,
        tdetails: req.body.treatmentdetails
    };

    await createSql.addTreatment(data);
    res.redirect('/nurse');

});

router.post('/delete', async(req, res) => {

    const data = {
        pID: req.body.Patient_id,
        nID: req.cookies.user,
        ttime: req.body.treatmenttime
    };

    await deleteSql.deleteTreatment(data);
    res.redirect('/nurse');
});

router.post('/update', async (req, res) => {
    const data = {
        pID: req.body.Patient_id,
        nID: req.cookies.user,
        ttime: req.body.treatmenttime,
        tdetails: req.body.tdetails,
    };
    await updateSql.updateTreatment(data);
    res.redirect('/nurse');
});

module.exports = router;