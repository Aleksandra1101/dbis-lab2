
 
  
  create table if not exists Geolocation(
    Locationid Serial Primary Key,
    RegName Text,
    AreaName Text,
    TerName Text
  );
  
  create table if not exists Student(
    Outid Text Primary Key,
    Locationid integer,
    Birth Varchar,
    SexTypeName Text,
    Foreign Key (Locationid) References Geolocation (Locationid)
  );
  
  create table if not exists Discipline(
    DisciplineName Text Primary Key
  );
  
  create table if not exists EducationalEstablishment(
    Eduestid Serial Primary Key,
    Locationid integer,
    EOParent Text,
    EOName Text,
    EOTypeName Text,
    Foreign Key (Locationid) References Geolocation (Locationid),
    Foreign Key (EOParent) References EDEstablishmentParent (EOParent)
  );
  
  create table if not exists EduSpecification(
    Outid Text,
    Locationid Integer,
    RegTypeName Text,
    ClassProfileName Text,
    ClassLangName Text    
  );
  
  ALTER TABLE EduSpecification 
    ADD CONSTRAINT EduSpecification_PK PRIMARY KEY (Outid, Eduestid);

  ALTER TABLE EduSpecification
    ADD CONSTRAINT EduSpecification_STUDENT_FK FOREIGN KEY (Outid) 
        REFERENCES STUDENT(Outid);

  ALTER TABLE EduSpecification
    ADD CONSTRAINT EduSpecification_establishment_FK FOREIGN KEY (Eduestid)
        REFERENCES EducationalEstablishment (Eduestid);


Create table if not exists Exam(
  Outid text,
  DisciplineName text,
  Years Varchar,
  Eduestid Integer,
  TestStatus Text,
  Ball100 Varchar,
    Ball12 Varchar,
    Ball Varchar,
  Lang Text
);

ALTER TABLE Exam 
    ADD CONSTRAINT Exam_PK PRIMARY KEY (outid, DisciplineName, Years);

ALTER TABLE Exam  
    ADD CONSTRAINT Exam_Student_FK FOREIGN KEY (Outid)
        REFERENCES Student(Outid);

ALTER TABLE Exam
    ADD CONSTRAINT Exam_Discipline_FK FOREIGN KEY (DisciplineName)
        REFERENCES Discipline(DisciplineName);

ALTER TABLE Exam
    ADD CONSTRAINT Exam_EducationalEstablishment_FK FOREIGN KEY (Eduestid)
        REFERENCES EducationalEstablishment(Eduestid);
