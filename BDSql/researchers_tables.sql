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

CREATE TABLE researchers(
	res_id INT(5) auto_increment NOT NULL PRIMARY KEY,
	res_name varchar(255)
);
CREATE TABLE academic_degree(
	academic_id INT(5) auto_increment NOT NULL PRIMARY KEY,
	academic_rs INT(5),
	academic_name varchar(255),
	aca_carr_id INT(5),
	aca_uni_id INT(5),
	academic_count varchar(225),
	FOREIGN KEY (academic_rs) REFERENCES researchers(res_id),
	FOREIGN KEY (aca_carr_id) REFERENCES carreer(carr_id),
	FOREIGN KEY (aca_uni_id) REFERENCES university(uni_id)
);
CREATE TABLE work_experience(
	work_id INT(5) auto_increment NOT NULL PRIMARY KEY,
	work_exp_place_id INT(5),
	work_res_id INT(5),
	work_position VARCHAR(255),
	work_date_start DATE,
	work_date_finish DATE,
	FOREIGN KEY (work_exp_place_id) REFERENCES university(uni_id),
	FOREIGN KEY (work_res_id) REFERENCES researchers(res_id)
);
CREATE TABLE thesis_advisor_exp(
	thesis_id INT(5) auto_increment NOT NULL PRIMARY KEY,
	thesis_uni INT(5),
	thesis_rs INT(5),
	th_stud_name VARCHAR(255),
	th_date_accept VARCHAR(255),
	FOREIGN KEY (thesis_uni) REFERENCES university(uni_id),
	FOREIGN KEY (thesis_rs) REFERENCES researchers(res_id)
);
