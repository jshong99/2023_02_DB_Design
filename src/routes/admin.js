import express from "express";
import cookieParser from "cookie-parser";
import { selectSql, createSql, deleteSql, updateSql } from '../database/sql';

const router = express.Router();
router.use(cookieParser());

router.use((req, res, next) => {
    if (req.cookies && req.cookies.role) {
        if (req.cookies.role === 'Admin') { 
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

        const doctors = await selectSql.getDoctors();
        const nurses = await selectSql.getNurses();

        res.render('admin', {
            user: req.cookies.user,
            title1: "Doctors",
            doctors,
            title2: "Nurses",
            nurses
        });
    } else {
        res.redirect('/')
    }

});

router.post('/adddoc', async(req, res) => {
    
    const data = {
        dname: req.body.name,
        dpw: req.body.password,
        daddress: req.body.address,
        dphonenum: req.body.phonenum,
        ddeptid: req.body.MedicalSpecialty_deptid        
    };

    await createSql.addDoctor(data);
    res.redirect('/admin');

});

router.post('/deletedoc', async(req, res) => {

    const data = {
        dID: req.body.id,
    };

    await deleteSql.deleteDoctor(data);
    res.redirect('/admin');
});

router.post('/updatedoc', async (req, res) => {
    
    const data = {
        dID: req.body.id,
        dname: req.body.name,
        dpw: req.body.password,
        daddress: req.body.address,
        dphonenum: req.body.phonenum,
        ddeptid: req.body.MedicalSpecialty_deptid        
    };

    await updateSql.updateDoctor(data);
    res.redirect('/admin');
});

router.post('/addnur', async(req, res) => {
    
    const data = {
        nname: req.body.name,
        npw: req.body.password,
        naddress: req.body.address,
        nphonenum: req.body.phonenum,
        ndeptid: req.body.MedicalSpecialty_deptid        
    };

    await createSql.addNurse(data);
    res.redirect('/admin');

});

router.post('/deletenur', async(req, res) => {

    const data = {
        nID: req.body.id,
    };

    await deleteSql.deleteNurse(data);
    res.redirect('/admin');
});

router.post('/updatenur', async (req, res) => {
    
    const data = {
        nID: req.body.id,
        nname: req.body.name,
        npw: req.body.password,
        naddress: req.body.address,
        nphonenum: req.body.phonenum,
        ndeptid: req.body.MedicalSpecialty_deptid        
    };

    await updateSql.updateNurse(data);
    res.redirect('/admin');
});

module.exports = router;