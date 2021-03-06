CREATE TABLE CITIZEN(
  CITIZEN_ID INT PRIMARY KEY AUTO_INCREMENT,
  CITIZEN_NAME VARCHAR(25) NOT NULL,
  CITIZEN_SURNAME VARCHAR(25) NOT NULL,
  CITIZEN_PREFFERED_COMMUNICATION_LANGUAGE VARCHAR(25) NOT NULL,
  CITIZEN_PHONE_NO VARCHAR(10) UNIQUE NOT NULL,
  CITIZEN_EMAIL_ADDRESS VARCHAR(80) UNIQUE,
  CITIZEN_COMMUNITY_ROLE VARCHAR(40) NOT NULL,
  CITIZEN_PASSWORD VARCHAR(50) NOT NULL
);

CREATE TABLE COMPANY(
  COMPANY_REGISTRATION_NUMBER INT PRIMARY KEY ,
  COMPANY_DESCRIPTION TEXT NOT NULL,
  COMPANY_NAME VARCHAR(50) NOT NULL,
  COMPANY_PHONE_NO VARCHAR(10) UNIQUE NOT NULL,
  COMPANY_EMAIL_ADDRESS VARCHAR(80) UNIQUE NOT NULL,
  COMPANY_NUMBER_OF_EMPLOYEES INT NOT NULL,
  COMPANY_WEBSITE VARCHAR(80) UNIQUE,
  COMPANY_HIRING_ELIGIBIITY TINYINT NOT NULL,
  COMPANY_PASSWORD VARCHAR(50) NOT NULL
);

CREATE TABLE REQUEST(
  REQUEST_ID INT PRIMARY KEY AUTO_INCREMENT,
  CITIZEN_ID INT NOT NULL,
  FOREIGN KEY(CITIZEN_ID) REFERENCES CITIZEN(CITIZEN_ID),
  REQUEST_LOCATION TEXT NOT NULL,
  REQUEST_DESCRIPTION TEXT NOT NULL,
  REQUEST_STATUS TINYINT NOT NULL,
  REQUEST_POST_DATE DATETIME NOT NULL
);

CREATE TABLE ACCEPTED_REQUEST(
  ACCEPTED_REQUEST_ID INT PRIMARY KEY AUTO_INCREMENT,
  REQUEST_ID INT NOT NULL,
  COMPANY_REGISTRATION_NUMBER INT NOT NULL,
  FOREIGN KEY(REQUEST_ID) REFERENCES REQUEST(REQUEST_ID),
  FOREIGN KEY(COMPANY_REGISTRATION_NUMBER) REFERENCES COMPANY(COMPANY_REGISTRATION_NUMBER),
  ACCEPTED_REQUEST_COMPANY_TESTIMONIAL TEXT ,
  ACCEPTED_REQUEST_PROJECT_PICTURES TEXT ,
  ACCEPTED_REQUEST_ACCEPTANCE_DATE DATETIME NOT NULL
);

CREATE TABLE ACCEPTED_REQUEST_REVIEWS(
  ACCEPTED_REQUEST_REVIEWS_ID INT PRIMARY KEY AUTO_INCREMENT,
  ACCEPTED_REQUEST_ID INT NOT NULL,
  FOREIGN KEY(ACCEPTED_REQUEST_ID) REFERENCES ACCEPTED_REQUEST(ACCEPTED_REQUEST_ID),
  ACCEPTED_REQUEST_REVIEWS_REVIEW TEXT NOT NULL,
  ACCEPTED_REQUEST_REVIEWS_DATE DATETIME NOT NULL
);
