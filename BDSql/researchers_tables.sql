#CREATE DATABASE pfc;
use pfc;
CREATE TABLE university(
	uni_id INT(5) auto_increment NOT NULL PRIMARY KEY,
	uni_name VARCHAR(255)
);
CREATE TABLE carreer(
	carr_id INT(5) auto_increment NOT NULL PRIMARY KEY,
	carr_name VARCHAR(255)
);
CREATE TABLE academic_degree(
	academic_id INT(5) auto_increment NOT NULL PRIMARY KEY,
	academic_name varchar(255),
	aca_carr_id INT(5),
	FOREIGN KEY (aca_carr_id) REFERENCES carreer(carr_id)
);
CREATE TABLE work_experience(
	work_id INT(5) auto_increment NOT NULL PRIMARY KEY,
	work_position VARCHAR(255),
	work_date_start DATE,
	work_date_finish DATE,
	work_exp_place_id INT(5),
	FOREIGN KEY (work_exp_place_id) REFERENCES university(uni_id)
);
CREATE TABLE thesis_advisor_exp(
	thesis_id INT(5) auto_increment NOT NULL PRIMARY KEY,
	thesis_uni INT(5),
	th_stud_name VARCHAR(255),
	th_repository VARCHAR(255),
	th_date_accept DATE,
	FOREIGN KEY (thesis_uni) REFERENCES university(uni_id)
);
CREATE TABLE researchers(
	res_id INT auto_increment NOT NULL PRIMARY KEY,
	res_name varchar(255),
    res_work_uni INT(5),
    res_academic_id INT(5),
	res_work_exp INT(5),
	res_t_exp INT(5),
	FOREIGN KEY (res_academic_id) REFERENCES academic_degree(academic_id),
	FOREIGN KEY (res_work_exp) REFERENCES work_experience(work_id),
	FOREIGN KEY (res_t_exp) REFERENCES thesis_advisor_exp(thesis_id),
	FOREIGN KEY (res_work_uni) REFERENCES university(uni_id)
);
