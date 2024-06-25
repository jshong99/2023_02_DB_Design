/*import mysql from "mysql2";

const pool = mysql.createPool(
  process.env.JAWSDB_URL ?? {
    host: 'localhost',
    user: 'root',
    database: 'DB_2023_Term_Proj',
    password: 'pgmaster028',
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
  }
);

// async / await 사용
const promisePool = pool.promise();

// selec query
export const selectSql = {
  getUsers: async () => {
    const [rows] = await promisePool.query(`select * from student`);
    return rows;
  },
  getallClass: async () => {
    const [rows] = await promisePool.query(`select c.ID, c.Name, c.Professor, d.Dname, c.Number_of_participant,
      c.Number_of_participant - IFNULL(cnt, 0) as Remaining_participants
      from Class as c join Department as d on c.Did = d.ID
      left join (select Class_id, count(Class_id) as cnt from class_student group by Class_Id) cs on cs.class_Id = c.ID
      where d.ID = c.Did order by c.ID ASC`);
    return rows;
  },
  getclasses: async (data) => {
    const uid = await promisePool.query(`select Id from Student where StudentId=${data.sId}`);
    const [rows] = await promisePool.query(`select c.ID, c.Name, c.Professor, d.Dname, c.Number_of_participant
      from Class as c, class_student as cs, Department as d
      where cs.Student_Id = ${uid[0][0].Id} and cs.Class_Id = c.ID and d.ID = c.Did order by c.ID ASC`);
    return rows;
  },
  getMyClass: async (data) => {
    const [rows] = await promisePool.query(
        `select * from class_student where student_id in (select id from student where studentid=${data.sId})`
    );
    return rows;
  },
}

export const createSql = {
  addClass: async (data) => {
    const uid = await promisePool.query(`select Id from Student where StudentId=${data.sId}`);
    console.log(uid);
    const results = await promisePool.query (
      `insert into class_student values (${uid[0][0].Id}, ${data.cId});`
    )
    return results[0];
  }
}
*/

import mysql from "mysql2";

const pool = mysql.createPool(
  process.env.JAWSDB_URL ?? {
    host: 'localhost',
    user: 'root',
    database: 'DB_2023_Term_Proj',
    password: 'pgmaster028',
    waitForConnections: true,
    connectionLimit: 10,
    queueLimit: 0
  }
);

// async / await 사용
const promisePool = pool.promise();

export const selectSql = {
  getUsers: async () => {
        const [rows] = await promisePool.query(`SELECT * FROM login`);
        return rows;
  },
  getDoctors: async () => {
        const [rows] = await promisePool.query(`SELECT * FROM Doctor`);
        return rows;
  },
  getNurses: async () => {
    const [rows] = await promisePool.query(`SELECT * FROM Nurse`);
    return rows;
  },        
  getPatients: async () => {
    const [rows] = await promisePool.query(`SELECT * FROM Patient`);
    return rows;
  },
  searchPatients: async (data) => {
    const [rows] = await promisePool.query(`SELECT * FROM Patient WHERE name LIKE '%${data}%'`);
    return rows;
  },
  getReservations: async () => {
    const [rows] = await promisePool.query(`SELECT * FROM Reservation`);
    return rows;
  },
  getMyReservations: async (data) => {
    const [rows] = await promisePool.query(
      `SELECT reservnum, MedicalSpecialty_deptid, reservtime FROM Reservation WHERE Patient_id=${data.patientId}`
    );
    return rows;
  },
  getInpatients: async () => {
    const [rows] = await promisePool.query(`SELECT * FROM Inpatient`);
    return rows;
  },
  getExaminations: async () => {
    const [rows] = await promisePool.query(`SELECT * FROM Examination`);
    return rows;
  },
  getMyExaminations: async (data) => {
    const [rows] = await promisePool.query(
      `SELECT Patient_id, examtime, examdetails FROM Examination WHERE Doctor_id=${data.doctorId}`
    );
    return rows;
  },
  getTreatments: async () => {
    const [rows] = await promisePool.query(`SELECT * FROM Treatment`);
    return rows;
  },
  getMyTreatments: async (data) => {
    const [rows] = await promisePool.query(
      `SELECT Patient_id, treatmenttime, treatmentdetails FROM Treatment WHERE Nurse_id=${data.nurseId}`
    );
    return rows;
  }
};

export const createSql = {
  addDoctor: async (data) => {
    const result = await promisePool.query(
      `INSERT INTO Doctor (id, name, password, address, phonenum, MedicalSpecialty_deptid)
      VALUES (NULL, '${data.dname}', '${data.dpw}', '${data.daddress}', '${data.dphonenum}', ${data.ddeptid})`
    );

    return result[0];
  },
  addNurse: async (data) => {
    const result = await promisePool.query(
      `INSERT INTO Nurse (id, name, password, address, phonenum, MedicalSpecialty_deptid)
      VALUES (NULL, '${data.nname}', '${data.npw}', '${data.naddress}', '${data.nphonenum}', ${data.ndeptid})`
    );
    
    return result[0];
  },
  addReservation: async (data) => {
    const result = await promisePool.query(
      `INSERT INTO Reservation (reservnum, Patient_id, MedicalSpecialty_deptid, reservtime)
      VALUES (NULL, ${data.pID}, ${data.dID}, '${data.rtime}')`
    );
  
    return result[0];
  },
  addExamination: async (data) => {
    const result = await promisePool.query(
      `INSERT INTO Examination (Patient_id, Doctor_id, examtime, examdetails)
      VALUES (${data.pID}, ${data.dID}, '${data.etime}', '${data.edetails}')`
    );
  
    return result[0];
  },
  addTreatment: async (data) => {
    const result = await promisePool.query(
      `INSERT INTO Treatment (Patient_id, Nurse_id, treatmenttime, treatmentdetails)
      VALUES (${data.pID}, ${data.nID}, '${data.ttime}', '${data.tdetails}')`
    );
  
    return result[0];
  }
};

export const deleteSql = {
  deleteDoctor: async (data) => {
    const result = await promisePool.query(
      `DELETE FROM Doctor WHERE id = ${data.dID}`
    );

    return result[0];
  },
  deleteNurse: async (data) => {
    const result = await promisePool.query(
      `DELETE FROM Nurse WHERE id = ${data.nID}`
    );

    return result[0];
  },
  cancelReservation: async (data) => {
    const result = await promisePool.query(
      `DELETE FROM Reservation WHERE reservnum = ${data.rID}`
    );

    return result[0];
  },
  deleteExamination: async (data) => {
    const etime = new Date(new Date(data.etime).getTime() + 9 * 60 * 60 * 1000).toISOString().slice(0, 19).replace('T', ' ');
    const result = await promisePool.query(
      `DELETE FROM Examination WHERE Patient_id = ${data.pID} AND Doctor_id = ${data.dID} AND examtime = '${etime}'`
    );

    return result[0];
  },
  deleteTreatment: async (data) => {
    const ttime = new Date(new Date(data.ttime).getTime() + 9 * 60 * 60 * 1000).toISOString().slice(0, 19).replace('T', ' ');
    const result = await promisePool.query(
      `DELETE FROM Treatment WHERE Patient_id = ${data.pID} AND Nurse_id = ${data.nID} AND treatmenttime = '${ttime}'`
    );

    return result[0];
  }
};

export const updateSql = {
  updateDoctor: async(data) => {
    const result = await promisePool.query(
      `UPDATE Doctor SET name = '${data.dname}', password = '${data.dpw}', address = '${data.daddress}', phonenum = '${data.dphonenum}', MedicalSpecialty_deptid = ${data.ddeptid}
        WHERE id = ${data.dID}`
    );

    return result[0];
  },
  updateNurse: async(data) => {
    const result = await promisePool.query(
      `UPDATE Nurse SET name = '${data.nname}', password = '${data.npw}', address = '${data.naddress}', phonenum = '${data.nphonenum}', MedicalSpecialty_deptid = ${data.ndeptid}
        WHERE id = ${data.nID}`
    );

    return result[0];
  },
  updateExamination: async (data) => {
    const etime = new Date(new Date(data.etime).getTime() + 9 * 60 * 60 * 1000).toISOString().slice(0, 19).replace('T', ' ');

    const query = `UPDATE Examination SET examdetails = '${data.edetails}' WHERE Patient_id = ${data.pID} AND Doctor_id = ${data.dID} AND examtime = '${etime}'`;
    console.log(query);
    const result = await promisePool.query(query);

    return result[0];
  },
  updateTreatment: async (data) => {
    const ttime = new Date(new Date(data.ttime).getTime() + 9 * 60 * 60 * 1000).toISOString().slice(0, 19).replace('T', ' ');

    const query = `UPDATE Treatment SET treatmentdetails = '${data.tdetails}' WHERE Patient_id = ${data.pID} AND Nurse_id = ${data.nID} AND treatmenttime = '${ttime}'`;
    console.log(query);
    const result = await promisePool.query(query);

    return result[0];
  }
};