Александра Анфилова, [20.04.21 21:55]
CREATE TABLE if not exists odata(
  OUTID  TEXT,
  Birth  VARCHAR,
  SEXTYPENAME  TEXT,
  REGNAME  TEXT,
  AREANAME  TEXT,
  TERNAME  TEXT,
  REGTYPENAME  TEXT,
  TerTypeName  TEXT,
  ClassProfileNAME  TEXT,
  ClassLangName  TEXT,
  EONAME  TEXT,
  EOTYPENAME  TEXT,
  EORegName  TEXT,
  EOAreaName  TEXT,
  EOTerName  TEXT,
  EOParent  TEXT,
  UkrTest  TEXT,
  UkrTestStatus  TEXT,
  UkrBall100  VARCHAR,
  UkrBall12  VARCHAR,
  UkrBall  VARCHAR,
  UkrAdaptScale  VARCHAR,
  UkrPTName  TEXT,
  UkrPTRegName  TEXT,
  UkrPTAreaName  TEXT,
  UkrPTTerName  TEXT,
  histTest  TEXT,
  HistLang  TEXT,
  histTestStatus  TEXT,
  histBall100  VARCHAR,
  histBall12  VARCHAR,
  histBall  VARCHAR,
  histPTName  TEXT,
  histPTRegName  TEXT,
  histPTAreaName  TEXT,
  histPTTerName  TEXT,
  mathTest  TEXT,
  mathLang  TEXT,
  mathTestStatus  TEXT,
  mathBall100  VARCHAR,
  mathBall12  VARCHAR,
  mathBall  VARCHAR,
  mathPTName  TEXT,
  mathPTRegName  TEXT,
  mathPTAreaName  TEXT,
  mathPTTerName  TEXT,
  physTest  TEXT,
  physLang  TEXT,
  physTestStatus  TEXT,
  physBall100  VARCHAR,
  physBall12  VARCHAR,
  physBall  VARCHAR,
  physPTName  TEXT,
  physPTRegName  TEXT,
  physPTAreaName  TEXT,
  physPTTerName  TEXT,
  chemTest  TEXT,
  chemLang  TEXT,
  chemTestStatus  TEXT,
  chemBall100  VARCHAR,
  chemBall12 VARCHAR,
  chemBall  VARCHAR,
  chemPTName  TEXT,
  chemPTRegName  TEXT,
  chemPTAreaName  TEXT,
  chemPTTerName  TEXT,
  bioTest  TEXT,
  bioLang  TEXT,
  bioTestStatus  TEXT,
  bioBall100  VARCHAR,
  bioBall12  VARCHAR,
  bioBall  VARCHAR,
  bioPTName  TEXT,
  bioPTRegName  TEXT,
  bioPTAreaName  TEXT,
  bioPTTerName  TEXT,
  geoTest  TEXT,
  geoLang  TEXT,
  geoTestStatus  TEXT,
  geoBall100  VARCHAR,
  geoBall12  VARCHAR,
  geoBall  VARCHAR,
  geoPTName  TEXT,
  geoPTRegName  TEXT,
  geoPTAreaName  TEXT,
  geoPTTerName  TEXT,
  engTest  TEXT,
  engTestStatus  TEXT,
  engBall100  VARCHAR,
  engBall12  VARCHAR,
  engDPALevel  TEXT,
  engBall  VARCHAR,
  engPTName  TEXT,
  engPTRegName  TEXT,
  engPTAreaName  TEXT,
  engPTTerName  TEXT,
  fraTest  TEXT,
  fraTestStatus  TEXT,
  fraBall100  VARCHAR,
  fraBall12  VARCHAR,
  fraDPALevel  TEXT,
  fraBall  VARCHAR,
  fraPTName  TEXT,
  fraPTRegName  TEXT,
  fraPTAreaName  TEXT,
  fraPTTerName  TEXT,
  deuTest  TEXT,
  deuTestStatus  TEXT,
  deuBall100  VARCHAR,
  deuBall12  VARCHAR,
  deuDPALevel  TEXT,
  deuBall  VARCHAR,
  deuPTName  TEXT,
  deuPTRegName  TEXT,
  deuPTAreaName  TEXT,
  deuPTTerName  TEXT,
  spaTest  TEXT,
  spaTestStatus  TEXT,
  spaBall100  VARCHAR,
  spaBall12  VARCHAR,
  spaDPALevel  TEXT,
  spaBall  VARCHAR,
  spaPTName  TEXT,
  spaPTRegName  TEXT,
  spaPTAreaName  TEXT,
  spaPTTerName  TEXT,
  Years varchar
  );
  
  create table if not exists EDEstablishmentParent(
    EOParent TEXT Primary Key 
  );
  
  create table if not exists Geolocation(
    Locationid Serial Primary Key,
    RegName Text,
    AreaName Text,
    TerName Text
  );
  
  create table if not exists Discipline(
    DisciplineName Text Primary Key
  );
  
  create table if not exists Student(
    Outid Text Primary Key,
    Locationid integer,
    Birth Varchar,
    SexTypeName Text,
    Foreign Key (Locationid) References Geolocation (Locationid)
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
