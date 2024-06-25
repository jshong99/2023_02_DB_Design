import express from "express";
import cookieParser from "cookie-parser";
import { selectSql, createSql, deleteSql, updateSql } from '../database/sql';

const router = express.Router();
router.use(cookieParser());

router.use((req, res, next) => {
    if (req.cookies && req.cookies.role) {
        if (req.cookies.role === 'Doctor') { 
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
            doctorId: req.cookies.user,
        };

        const myExaminations = await selectSql.getMyExaminations(data);

        res.render('doctor', {
            user: req.cookies.user,
            title: "My Examinations",
            myExaminations,
        });
    } else {
        res.redirect('/')
    }

});

router.get('/search', async (req, res) => {
    const searchingName = req.query.search;
    const patients = await selectSql.searchPatients(searchingName);

    res.render('doctor', {
        user: req.cookies.user,
        title: "Search Results",
        patients: patients,
    });
});

router.post('/add', async(req, res) => {
    
    const data = {
        pID: req.body.Patient_id,
        dID: req.cookies.user,
        etime: req.body.examtime,
        edetails: req.body.examdetails
    };

    await createSql.addExamination(data);
    res.redirect('/doctor');

});

router.post('/delete', async(req, res) => {

    const data = {
        pID: req.body.Patient_id,
        dID: req.cookies.user,
        etime: req.body.examtime
    };

    await deleteSql.deleteExamination(data);
    res.redirect('/doctor');
});

router.post('/update', async (req, res) => {
    const data = {
        pID: req.body.Patient_id,
        dID: req.cookies.user,
        etime: req.body.examtime,
        edetails: req.body.edetails,
    };
    await updateSql.updateExamination(data);
    res.redirect('/doctor');
});

module.exports = router;