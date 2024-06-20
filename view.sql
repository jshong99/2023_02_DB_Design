CREATE VIEW `DB_2023_Term_Proj`.`login` AS
SELECT id, password, 'Doctor' AS role FROM `DB_2023_Term_Proj`.`Doctor`
UNION ALL
SELECT id, password, 'Nurse' AS role FROM `DB_2023_Term_Proj`.`Nurse`
UNION ALL
SELECT id, password, 'Patient' AS role FROM `DB_2023_Term_Proj`.`Patient`
UNION ALL
SELECT id, password, 'Admin' AS role FROM `DB_2023_Term_Proj`.`Admin`;