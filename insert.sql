-- -----------------------------------------------------
-- Admin --
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO `Admin` VALUES('admin', 'admin1234');

COMMIT;

-- -----------------------------------------------------
-- Medical Specialty --
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO `MedicalSpecialty` VALUES (11, 'Thoracic Surgery', '02-1234-5678'),
                                      (12, 'Pediatrics', '02-2345-6789'),
                                      (13, 'Internal Medicine', '02-3456-7890'),
                                      (14, 'Otorhinolaryngology', '02-4567-8901'),
                                      (15, 'Orthopedics', '02-5678-9012'),
                                      (16, 'Dermatology', '02-6789-0123'),
                                      (17, 'Dentistry', '02-7890-1234'),
                                      (18, 'Neurology', '02-8901-2345'),
                                      (19, 'Obstetrics and Gynecology', '02-9012-3456'),
                                      (20, 'Ophthalmology', '02-0123-4567');

COMMIT;

-- -----------------------------------------------------
-- Doctor --
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO `Doctor` VALUES (10000001, 'Kim Minsu', 'aBc123', 'Jegi-dong, Dongdaemun-gu, Seoul', '010-1111-1111', 11),
                            (10000002, 'Lee Jisoo', 'xYz456', 'Yeoksam-dong, Gangnam-gu, Seoul', '010-2222-2222', 12),
                            (10000003, 'Hong Taeri', 'mNo789', 'Mangwon-dong, Mapo-gu, Seoul', '010-3333-3333', 13),
                            (10000004, 'Kwon Jin', 'pQr123', 'Itaewon-dong, Yongsan-gu, Seoul', '010-4444-4444', 14),
                            (10000005, 'Kim Soyeon', 'sTu456', 'Banpo-dong, Seocho-gu, Seoul', '010-5555-5555', 15),
                            (10000006, 'Kang Minho', 'dEf789', 'Sinrim-dong, Gwanak-gu, Seoul', '010-6666-6666', 16),
                            (10000007, 'Bae Suzy', 'gHi123', 'Cheonho-dong, Gangdong-gu, Seoul', '010-7777-7777', 17),
                            (10000008, 'Kim Minji', 'jKl456', 'Guro-dong, Guro-gu, Seoul', '010-8888-8888', 18),
                            (10000009, 'Ruben Loftus-Cheek', 'nOp789', 'Chang-dong, Dobong-gu, Seoul', '010-9999-9999', 19),
                            (10000010, 'Song Eunji', 'qRs123', 'Suyu-dong, Gangbuk-gu, Seoul', '010-0000-0000', 20),
                            (10000011, 'Seong Haeeun', 'tUv456', 'Jegi-dong, Dongdaemun-gu, Seoul', '010-1212-1212', 11),
                            (10000012, 'Levi Colwill', 'wXy789', 'Yeoksam-dong, Gangnam-gu, Seoul', '010-2323-2323', 12),
                            (10000013, 'Jang Seojin', 'zAb123', 'Mangwon-dong, Mapo-gu, Seoul', '010-3434-3434', 13),
                            (10000014, 'Lee Jaehyun', 'cDe456', 'Itaewon-dong, Yongsan-gu, Seoul', '010-4545-4545', 14),
                            (10000015, 'Lim Saemi', 'fGh789', 'Banpo-dong, Seocho-gu, Seoul', '010-5656-5656', 15),
                            (10000016, 'Nakamura Hiroki', 'iJk123', 'Sinrim-dong, Gwanak-gu, Seoul', '010-6767-6767', 16),
                            (10000017, 'Seo Jiwoo', 'lMn456', 'Cheonho-dong, Gangdong-gu, Seoul', '010-7878-7878', 17),
                            (10000018, 'Lee Hyunwoo', 'oPq789', 'Guro-dong, Guro-gu, Seoul', '010-8989-8989', 18),
                            (10000019, 'Park Jiwon', 'rSt123', 'Chang-dong, Dobong-gu, Seoul', '010-9090-9090', 19),
                            (10000020, 'Choi Jinyoung', 'uVw456', 'Suyu-dong, Gangbuk-gu, Seoul', '010-0101-0101', 20);

COMMIT;

-- -----------------------------------------------------
-- Nurse --
-- -----------------------------------------------------
START TRANSACTION;

INSERT INTO `Nurse` VALUES (20000001, 'Jung Wonjae', 'aBc12x3', 'Jegi-dong, Dongdaemun-gu, Seoul', '010-1313-1313', 11),
                           (20000002, 'Lee Jihye', 'xYz4u56', 'Yeoksam-dong, Gangnam-gu, Seoul', '010-2424-2424', 12),
                           (20000003, 'Kim Seoyeon', 'mNo7389', 'Mangwon-dong, Mapo-gu, Seoul', '010-3535-3535', 13),
                           (20000004, 'Choi Jaemin', 'pQr12u3', 'Itaewon-dong, Yongsan-gu, Seoul', '010-4646-4646', 14),
                           (20000005, 'Han Soomin', 'sTu4536', 'Banpo-dong, Seocho-gu, Seoul', '010-5757-5757', 15),
                           (20000006, 'Yoon Minji', 'dEf7k89', 'Sinrim-dong, Gwanak-gu, Seoul', '010-6868-6868', 16),
                           (20000007, 'Kang Nam', 'gHi12h3', 'Cheonho-dong, Gangdong-gu, Seoul', '010-7979-7979', 17),
                           (20000008, 'Roh Hyemin', 'jKl45u6', 'Sindorim-dong, Guro-gu, Seoul', '010-8080-8080', 18),
                           (20000009, 'Park Jiyeon', 'nOfp789', 'Chang-dong, Dobong-gu, Seoul', '010-9191-9191', 19),
                           (20000010, 'Lee Eunha', 'qRs12k3', 'Suyu-dong, Gangbuk-gu, Seoul', '010-0202-0202', 20),
                           (20000011, 'Jung Soojin', 'tUfqv456', 'Yeongdeungpo-dong, Yeongdeungpo-gu, Seoul', '010-1010-1010', 11),
                           (20000012, 'Kim Minkyo', 'wXy7j89', 'Seongsu-dong, Seongdong-gu, Seoul', '010-2121-2121', 12),
                           (20000013, 'Park Jiyoung', 'zAb1k23', 'Nowon-dong, Nowon-gu, Seoul', '010-3232-3232', 13),
                           (20000014, 'Baek Jiheon', 'cDe45j6', 'Gangseo-dong, Gangseo-gu, Seoul', '010-4343-4343', 14),
                           (20000015, 'Choi Minsoo', 'fGh789j', 'Jamsil-dong, Songpa-gu, Seoul', '010-5454-5454', 15),
                           (20000016, 'Andreas Christensen', '3iJk123', 'Dangsan-dong, Yeongdeungpo-gu, Seoul', '010-6565-6565', 16),
                           (20000017, 'Lee Soyeon', 'lMn4569', 'Yeonnam-dong, Mapo-gu, Seoul', '010-7676-7676', 17),
                           (20000018, 'Sin Yoohyung', 'oPq7389', 'Noryangjin-dong, Dongjak-gu, Seoul', '010-8787-8787', 18),
                           (20000019, 'Park Seoyeon', 'rS2t123', 'Godeok-dong, Gwangjin-gu, Seoul', '010-9898-9898', 19),
                           (20000020, 'Wong Faye', 'uVw4j56', 'Hapjeong-dong, Mapo-gu, Seoul', '010-0909-0909', 20),
                           (20000021, 'Song Hojin', 'aBc1123', 'Yangjae-dong, Seocho-gu, Seoul', '010-1313-1313', 11),
                           (20000022, 'Kim Hyewon', 'xYz4556', 'Seongsu-dong, Seongdong-gu, Seoul', '010-2424-2424', 12),
                           (20000023, 'Park Jiyoung', 'mNo7489', 'Nowon-dong, Nowon-gu, Seoul', '010-3535-3535', 13),
                           (20000024, 'Julie Delpy', 'pQr1233', 'Gangseo-dong, Gangseo-gu, Seoul', '010-4646-4646', 14),
                           (20000025, 'Choi Minseo', 'sTu4566', 'Jamsil-dong, Songpa-gu, Seoul', '010-5757-5757', 15),
                           (20000026, 'Jeon Eunyoung', 'dEf7289', 'Dangsan-dong, Yeongdeungpo-gu, Seoul', '010-6868-6868', 16),
                           (20000027, 'Hong Panpyo', 'gH2i123', 'Yeonnam-dong, Mapo-gu, Seoul', '010-7979-7979', 17),
                           (20000028, 'Kang Yuna', 'j6Kl456', 'Noryangjin-dong, Dongjak-gu, Seoul', '010-8080-8080', 18),
                           (20000029, 'Cha Youngjin', 'nOp7j89', 'Godeok-dong, Gwangjin-gu, Seoul', '010-9191-9191', 19),
                           (20000030, 'Jung Haewon', 'qRs12b3', 'Hapjeong-dong, Mapo-gu, Seoul', '010-0202-0202', 20);

COMMIT;

-- -----------------------------------------------------
-- Patient --
-- -----------------------------------------------------

START TRANSACTION;

INSERT INTO `Patient` VALUES (1000001, 'Na Minhee', '1a2b3c', '123-45-6789', 'F', 'Jegi-dong, Dongdaemun-gu, Seoul', 'Rh+AB', 175.5, 68.3, '010-1234-5678', 10000001, 20000001),
                             (1000002, 'Lee Hojin', '4d5e6f', '987-65-4321', 'M', 'Dogok-dong, Gangnam-gu, Seoul', 'Rh+O', 192.7, 95.1, '010-2345-6789', 10000002, 20000012),
                             (1000003, 'Park Seungho', '7g8h9i', '246-80-1357', 'M', 'Seogyo-dong, Mapo-gu, Seoul', 'Rh+B', 180.2, 75.9, '010-3456-7890', 10000013, 20000003),
                             (1000004, 'Yoo Soyeon', 'jklmno', '864-20-7531', 'F', 'Bangbae-dong, Seocho-gu, Seoul', 'Rh-A', 163.9, 51.6, '010-4567-8901', 10000014, 20000024),
                             (1000005, 'Do Joonhyuk', 'pqrstu', '975-31-8642', 'M', 'Huan-dong, Yongsan-gu, Seoul', 'Rh+AB', 182.3, 70.2, '010-5678-9012', 10000005, 20000025),
                             (1000006, 'Reece James', 'vwxyz1', '531-86-2975', 'M', 'Ssangmun-dong, Dobong-gu, Seoul', 'Rh+O', 179.2, 82.4, '010-6789-0123', 10000016, 20000006),
                             (1000007, 'Kwon Sungmin', '234567', '297-53-1864', 'F', 'Sillim-dong, Gwanak-gu, Seoul', 'Rh+A', 158.6, 52.5, '010-7890-1234', 10000007, 20000017),
                             (1000008, 'Hwang Yuna', '890123', '186-42-9753', 'F', 'Majang-dong, Seongdong-gu, Seoul', 'Rh+A', 161.2, 45.9, '010-8901-2345', 10000018, 20000008),
                             (1000009, 'Huh Taeho', '456789', '753-19-8642', 'M', 'Sindorim-dong, Guro-gu, Seoul', 'Rh+B', 180.9, 78.4, '010-9012-3456', 10000009, 20000019),
                             (1000010, 'Jang Kyuho', '012345', '642-42-9753', 'M', 'Sangdo-dong, Dongjak-gu, Seoul', 'Rh+O', 175.5, 72.1, '010-0123-4567', 10000010, 20000030);

COMMIT;

-- -----------------------------------------------------
-- Reservation --
-- -----------------------------------------------------

START TRANSACTION;

INSERT INTO `Reservation` VALUES (100000001, 1000003, 13, '2023-12-18 10:30:00'),
                                 (100000002, 1000006, 16, '2023-12-19 14:00:00'),
                                 (100000003, 1000002, 12, '2023-12-27 11:00:00'),
                                 (100000004, 1000008, 18, '2023-12-22 10:30:00'),
                                 (100000005, 1000009, 19, '2023-12-20 17:00:00');

COMMIT;

-- -----------------------------------------------------
-- Inpatient --
-- -----------------------------------------------------

START TRANSACTION;

INSERT INTO `Inpatient` VALUES (1000001, '2023-11-29 15:00:00', '2023-12-01 14:00:00', 201),
                               (1000003, '2023-12-14 11:30:00', NULL, 201),
                               (1000004, '2023-11-30 11:00:00', '2023-12-14 12:30:00', 202),
                               (1000006, '2023-12-10 10:00:00', NULL, 304);

COMMIT;

-- -----------------------------------------------------
-- Examination --
-- -----------------------------------------------------

START TRANSACTION;

INSERT INTO `Examination` VALUES (1000001, 10000001, '2023-11-29 14:30:00', 'COVID-19'),
                                 (1000002, 10000002, '2023-11-29 14:42:00', 'flu'),  
                                 (1000003, 10000013, '2023-11-29 14:45:00', 'left leg broken'),
                                 (1000004, 10000014, '2023-11-29 15:00:00', 'stomachache'),
                                 (1000005, 10000005, '2023-11-29 15:10:00', 'headache'),
                                 (1000006, 10000016, '2023-11-29 15:25:00', 'right hamstring injury'),
                                 (1000007, 10000007, '2023-11-29 16:00:00', 'Delayed Onset Muscle Soreness'),
                                 (1000008, 10000018, '2023-11-29 16:05:00', 'sciatica'),
                                 (1000009, 10000009, '2023-11-30 09:55:00', 'runny nose'),
                                 (1000010, 10000010, '2023-11-30 10:03:00', 'sore throat'),
                                 (1000004, 10000014, '2023-11-30 10:52:00', 'finger cut');

COMMIT;

-- -----------------------------------------------------
-- Treatment --
-- -----------------------------------------------------

START TRANSACTION;

INSERT INTO `Treatment` VALUES (1000001, 20000001, '2023-11-29 15:05:00', 'Tylenol 500mg * 2'),
                               (1000002, 20000012, '2023-11-29 14:42:00', 'Tamiflu'),  
                               (1000003, 20000003, '2023-11-29 14:45:00', 'pain killer 300mg'),
                               (1000004, 20000024, '2023-11-29 15:00:00', 'digestive medic.'),
                               (1000005, 20000025, '2023-11-29 15:10:00', 'pk 100mg'),
                               (1000006, 20000006, '2023-11-29 15:25:00', 'ice pack app.'),
                               (1000007, 20000017, '2023-11-29 16:00:00', 'hot pack app.'),
                               (1000008, 20000018, '2023-11-29 16:05:00', 'pain killer 200mg'),
                               (1000009, 20000019, '2023-11-30 09:55:00', 'antihistamine'),
                               (1000010, 20000030, '2023-11-30 10:03:00', 'Strepsils 1 package'),
                               (1000004, 20000024, '2023-11-30 10:52:00', 'first aid with bandage');

COMMIT;