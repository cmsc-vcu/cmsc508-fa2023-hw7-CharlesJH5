# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleroles;
# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills(
    id int NOT NULL,
    name varchar (255) NOT NULL,
    description varchar(4096) NOT NULL,
    tag varchar (255) NOT NULL,
    url varchar (255),
    time_committment varchar (255),
    PRIMARY KEY (id)
);


# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills (id, name, description, tag, time_committment)
VALUES 
(1, 'Python Programming', 'High-level programming language for application development', 'Skill 1', '8 hours'),
(2, 'Public Speaking', 'Comfortably addressing high volumes of people and engaging audiences', 'Skill 2', '3 Months'),
(3, 'Database Management', 'SQL programming to create and manage databases', 'Skill 3', '4 Months'),
(4, 'Risk Management', 'Understanding of network analysis and use of the NIST security framework', 'Skill 4', '1.5 Years'),
(5, 'Scrum Master', 'Understanding of Agile software development to lead dev teams through sprints', 'Skill 5', '3 Years'),
(6, 'Brazilian Jiu Jitsu', 'self-defence martial art and combat sport based on grappling, ground fighting, and submission holds', 'Skill 6', '10 years'),
(7, 'Object Oriented Design', 'Software Design approach where datatypes are treated as classes with defineable characteristics and functions', 'Skill 7', '6 Months'),
(8, 'Immortality', 'Perfect replication of DNA without error prevents development of chronic diseases, reducing mortality risk to 0', 'Skill 8', '7 Years (Time it takes to find the lost city of Atlantis)');


# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    id int NOT NULL,
    first_name varchar(255),
    last_name varchar(255) NOT NULL,
    email varchar(255),
    linkedin_url varchar (255),
    headshot_url varchar (255),
    discord_handle varchar (255),
    brief_bio varchar (255),
    date_joined varchar (255),
    PRIMARY KEY (id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people (id, last_name) 
VALUES 
(1, 'Person 1'),
(2, 'Person 2'),
(3, 'Person 3'),
(4, 'Person 4'),
(5, 'Person 5'),
(6, 'Person 6'),
(7, 'Person 7'),
(8, 'Person 8'),
(9, 'Person 9'),
(10, 'Person 10');


# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills(
    id int NOT NULL AUTO_INCREMENT,
    skills_id int,
    people_id int NOT NULL,
    date_acquired varchar(255) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (skills_id) REFERENCES skills(id),
    FOREIGN KEY (people_id) REFERENCES people(id)
);

# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.

INSERT INTO peopleskills(people_id, skills_id, date_acquired)
VALUES
(1, 1, '5-7-2016'),
(1, 3, '4-18-2019'),
(1, 6, '4-20-2020'),
(2, 3, '9-17-2018'),
(2, 4, '7-11-2019'),
(2, 5, '8-13-2020'),
(3, 1, '4-23-2016'),
(3, 5, '7-19-2015'),
(5, 3, '6-4-2017'),
(5, 6, '7-4-2019'),
(6, 2, '2-24-2013'),
(6, 3, '1-6-2015'),
(6, 4, '11-24-2016'),
(7, 3, '8-13-2019'),
(7, 5, '10-31-2017'),
(7, 6, '4-13-2019'),
(8, 1, '9-27-2019'),
(8, 3, '2-15-2011'),
(8, 5, '1-1-2000'),
(8, 6, '9-10-2017'),
(9, 2, '4-11-2021'),
(9, 5, '9-22-2019'),
(9, 6, '11-6-2017'),
(10, 1, '5-14-2022'),
(10, 4, '9-13-2016'),
(10, 5, '1-6-2021'); 

# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles(
    id INT,
    name VARCHAR(255),
    sort_priority int,
    PRIMARY KEY (id)
);

# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles(id, name, sort_priority)
VALUES
(1, 'Designer', 10),
(2, 'Developer', 20),
(3, 'Recruit', 30),
(4, 'Team Lead', 40),
(5, 'Boss', 50),
(6, 'Mentor', 60);

# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles(
    id int NOT NULL AUTO_INCREMENT,
    people_id int NOT NULL,
    role_id int NOT NULL,
    date_assigned varchar(255),
    PRIMARY KEY (id),
    FOREIGN KEY (people_id) REFERENCES people(id),
    FOREIGN KEY (role_id) REFERENCES roles(id)
);

# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO peopleroles (people_id, role_id, date_assigned)
VALUES
(1, 2, '5-7-1997'),
(2, 5, '7-8-1990'),
(2, 6, '7-8-1990'),
(3, 2, '5-6-1993'),
(3, 3, '4-12-1997'),
(4, 3, '6-2-2022'),
(5, 3, '5-17-2022'),
(6, 1, '3-7-2011'),
(6, 2, '4-19-2013'),
(7, 1, '6-2-2015'),
(8, 1, '6-4-2005'),
(8, 4, '9-11-2010'),
(9, 2, '2-27-2017'),
(10, 1, '8-4-2013'),
(10, 2, '8-4-2013');
