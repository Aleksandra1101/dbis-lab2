INSERT INTO Geolocation (RegName, AreaName, TerName)
SELECT DISTINCT       RegName,       AreaName,       TerName       FROM odata
UNION SELECT DISTINCT ukrPTRegName,  ukrPTAreaName,  ukrPTTerName  FROM odata
UNION SELECT DISTINCT mathPTRegName, mathPTAreaName, mathPTTerName FROM odata
UNION SELECT DISTINCT histPTRegName, histPTAreaName, histPTTerName FROM odata
UNION SELECT DISTINCT physPTRegName, physPTAreaName, physPTTerName FROM odata
UNION SELECT DISTINCT chemPTRegName, chemPTAreaName, chemPTTerName FROM odata
UNION SELECT DISTINCT bioPTRegName,  bioPTAreaName,  bioPTTerName  FROM odata
UNION SELECT DISTINCT geoPTRegName,  geoPTAreaName,  geoPTTerName  FROM odata
UNION SELECT DISTINCT engPTRegName,  engPTAreaName,  engPTTerName  FROM odata
UNION SELECT DISTINCT fraPTRegName,  fraPTAreaName,  fraPTTerName  FROM odata
UNION SELECT DISTINCT deuPTRegName,  deuPTAreaName,  deuPTTerName  FROM odata
UNION SELECT DISTINCT spaPTRegName,  spaPTAreaName,  spaPTTerName  FROM odata;

UPDATE Geolocation
DELETE FROM Geolocation WHERE TerName IS NULL;


INSERT INTO Discipline(DisciplineName)
SELECT DISTINCT ukrtest
FROM odata
WHERE ukrtest IS NOT NULL;

INSERT INTO Discipline(DisciplineName)
SELECT DISTINCT histtest
FROM  odata
WHERE histtest IS NOT NULL;

INSERT INTO Discipline(DisciplineName)
SELECT DISTINCT mathtest
FROM  odata
WHERE mathtest IS NOT NULL;

INSERT INTO Discipline(DisciplineName)
SELECT DISTINCT phystest
FROM  odata
WHERE phystest IS NOT NULL;

INSERT INTO Discipline(DisciplineName)
SELECT DISTINCT chemtest
FROM  odata
WHERE chemtest IS NOT NULL;

INSERT INTO Discipline(DisciplineName)
SELECT DISTINCT biotest
FROM  odata
WHERE biotest IS NOT NULL;

INSERT INTO Discipline(DisciplineName)
SELECT DISTINCT geotest
FROM  odata
WHERE geotest IS NOT NULL;

INSERT INTO Discipline(DisciplineName)
SELECT DISTINCT engtest
FROM  odata
WHERE engtest IS NOT NULL;

INSERT INTO Discipline(DisciplineName)
SELECT DISTINCT fratest
FROM  odata
WHERE fratest IS NOT NULL;

INSERT INTO Discipline(DisciplineName)
SELECT DISTINCT deutest
FROM  odata
WHERE deutest IS NOT NULL;

INSERT INTO Discipline(DisciplineName)
SELECT DISTINCT spatest
FROM  odata
WHERE spatest IS NOT NULL;

INSERT INTO STUDENT(outid, Locationid, birth, SexTypeName)
SELECT od.outid, gl.locationid, od.birth, od.sextypename
FROM odata od
LEFT JOIN GEOLOCATION gl
ON od.areaname = gl.areaname AND od.regname = gl.regname AND od.tername = gl.tername;


INSERT INTO EducationalEstablishment(Locationid, EOParent, EOName, EOTypeName)
SELECT DISTINCT gl.Locationid, od.EOParent, od.EONAME, od.EOTYPENAME
FROM odata od
LEFT JOIN geolocation gl
ON od.EORegName = gl.regname AND od.EOTerName = gl.tername AND od.EOAreaName = gl.areaname
WHERE od.EONAME IS NOT NULL;

INSERT INTO EducationalEstablishment(Locationid, EOParent, EOName, EOTypeName)
SELECT DISTINCT gl.locationid, NULL, od.ukrptname, NULL
FROM odata od
LEFT JOIN GEOLOCATION gl
ON od.ukrptregname = gl.regname AND od.ukrpttername = gl.tername AND od.ukrptareaname = gl.areaname
WHERE
    od.ukrptname IS NOT NULL
AND 
    gl.locationid IS NOT NULL
AND
NOT EXISTS(
    SELECT 1
    FROM EducationalEstablishment es
    WHERE es.locationId = gl.locationid
    AND es.eoname = od.ukrptname);


INSERT INTO EducationalEstablishment(locationId, EOParent, EOName, EOTypeName)
SELECT DISTINCT gl.locationId, NULL, od.histptname, NULL
FROM odata od
LEFT JOIN GEOLOCATION gl
ON od.histptregname = gl.regname AND od.histpttername = gl.tername AND od.histptareaname = gl.areaname
WHERE
    od.histptname IS NOT NULL
AND 
    gl.locationid IS NOT NULL
AND
NOT EXISTS(
    SELECT 1
    FROM EducationalEstablishment es
    WHERE es.locationid = gl.locationid
    AND es.eoname = od.histptname);


INSERT INTO EducationalEstablishment(locationid, EOParent, EOName, EOTypeName)
SELECT DISTINCT gl.locationid, NULL, od.mathptname, NULL
FROM odata od
LEFT JOIN GEOLOCATION gl
ON od.mathptregname = gl.regname AND od.mathpttername = gl.tername AND od.mathptareaname = gl.areaname
WHERE
    od.mathptname IS NOT NULL
AND 
    gl.locationId IS NOT NULL
AND
NOT EXISTS(
    SELECT 1
    FROM EducationalEstablishment es
    WHERE es.locationid = gl.locationid
    AND es.eoname = od.mathptname);


INSERT INTO EducationalEstablishment(locationId, EOParent, EOName, EOTypeName)
SELECT DISTINCT gl.locationId, NULL, od.physptname, NULL
FROM odata od
LEFT JOIN GEOLOCATION gl
ON od.physptregname = gl.regname AND od.physpttername = gl.tername AND od.physptareaname = gl.areaname
WHERE
    od.physptname IS NOT NULL
AND 
    gl.locationId IS NOT NULL
AND
NOT EXISTS(
    SELECT 1
    FROM EducationalEstablishment es
    WHERE es.locationId = gl.locationid
    AND es.eoname = od.physptname);


INSERT INTO EducationalEstablishment(locationId, EOParent, EOName, EOTypeName)
SELECT DISTINCT gl.locationId, NULL, od.chemptname, NULL
FROM odata od
LEFT JOIN GEOLOCATION gl
ON od.chemptregname = gl.regname AND od.chempttername = gl.tername AND od.chemptareaname = gl.areaname
WHERE
    od.chemptname IS NOT NULL
AND 
    gl.locationId IS NOT NULL
AND
NOT EXISTS(
    SELECT 1
    FROM EducationalEstablishment es
    WHERE es.locationId = gl.locationid
    AND es.eoname = od.chemptname);


INSERT INTO EducationalEstablishment(locationId, EOParent, EOName, EOTypeName)
SELECT DISTINCT gl.locationId, NULL, od.engptname, NULL
FROM odata od
LEFT JOIN GEOLOCATION gl
ON od.engPTRegName = gl.regname AND od.engPTTerName = gl.tername AND od.engPTAreaName = gl.areaname
WHERE
    od.engptname IS NOT NULL
AND
NOT EXISTS(
    SELECT 1
    FROM EducationalEstablishment es
    WHERE es.locationId = gl.locationId
    AND es.eoname = od.engptname);
    
   INSERT INTO EducationalEstablishment(locationId, EOParent, EOName, EOTypeName)
SELECT DISTINCT gl.locationId, NULL, od.engptname, NULL
FROM odata od
LEFT JOIN GEOLOCATION gl
ON od.fraPTRegName = gl.regname AND od.fraPTTerName  = gl.tername AND od.fraPTAreaName = gl.areaname
WHERE
    od.fraptname IS NOT NULL
AND
NOT EXISTS(
    SELECT 1
    FROM EducationalEstablishment es
    WHERE es.locationId = gl.locationId
    AND es.eoname = od.fraptname);
    
    
     INSERT INTO EducationalEstablishment(locationId, EOParent, EOName, EOTypeName)
SELECT DISTINCT gl.locationId, NULL, od.engptname, NULL
FROM odata od
LEFT JOIN GEOLOCATION gl
ON od.deuPTRegName = gl.regname AND od.deuPTTerName  = gl.tername AND od.deuPTAreaName = gl.areaname
WHERE
    od.deuptname IS NOT NULL
AND
NOT EXISTS(
    SELECT 1
    FROM EducationalEstablishment es
    WHERE es.locationId = gl.locationId
    AND es.eoname = od.deuptname);

 INSERT INTO EducationalEstablishment(locationId, EOParent, EOName, EOTypeName)
SELECT DISTINCT gl.locationId, NULL, od.engptname, NULL
FROM odata od
LEFT JOIN GEOLOCATION gl
ON od.spaPTRegName = gl.regname AND od.spaPTTerName  = gl.tername AND od.spaPTAreaName = gl.areaname
WHERE
    od.spaptname IS NOT NULL
AND
NOT EXISTS(
    SELECT 1
    FROM EducationalEstablishment es
    WHERE es.locationId = gl.locationId
    AND es.eoname = od.spaptname);
INSERT INTO EduSpecification(outid, eduestId, ClassProfileNAME, ClassLangName, REGTYPENAME)
SELECT od.outid, eds.eduestId, od.ClassProfileNAME, od.ClassLangName, od.REGTYPENAME
FROM odata od
LEFT JOIN EducationalEstablishment eds
ON od.EOParent = eds.EOParent AND od.EONAME = eds.EONAME
WHERE eds.eduestId IS NOT NULL;

Александра Анфилова, [25.04.21 11:55]
INSERT INTO EXAM(outid, disciplineName, Years, eduestId, TestStatus,
        Ball100, Ball12, Ball, Lang)
    SELECT
        od.outid, od.ukrtest, od.Years, ze.eduestId, od.ukrTestStatus,
        od.ukrBall100, od.ukrBall12, od.ukrBall, NULL
    FROM odata od
    LEFT JOIN
        (SELECT DISTINCT es.eduestId, es.EOName, gl.regname, gl.tername, gl.areaname
        FROM EducationalEstablishment es
        LEFT JOIN GEOLOCATION gl
        ON es.locationId = gl.locationId) ze
        ON od.ukrptregname = ze.regname
        AND od.ukrptareaname = ze.areaname
        AND od.ukrpttername = ze.tername
    WHERE
        ukrtest IS NOT NULL;

INSERT INTO ZNOEXAM(outid, DisciplineName, Years, EduestId, TestStatus,
        Ball100, Ball12, Ball, Lang)
    SELECT
        od.outid, od.histtest, od.Years, ze.institutionId, od.histTestStatus,
        od.histBall100, od.histBall12, od.histBall, od.histlang
    FROM odata od
    LEFT JOIN
        (SELECT DISTINCT es.eduestId, ei.EOName, gl.regname, gl.tername, gl.areaname
        FROM EducationalEstablishment es
        LEFT JOIN GEOLOCATION gl
        ON es.locationId = gl.terId) ze
        ON od.histptregname = ze.regname
        AND od.histptareaname = ze.areaname
        AND od.histpttername = ze.tername
    WHERE
        histtest IS NOT NULL;

INSERT INTO EXAM(outid, DisciplineName, Years, EduestId, TestStatus,
        Ball100, Ball12, Ball, Lang)
    SELECT
        od.outid, od.mathtest, od.Years, ze.eduestId, od.mathTestStatus,
        od.mathBall100, od.mathBall12, od.mathBall, od.mathlang
    FROM odata od
    LEFT JOIN
        (SELECT DISTINCT es.EduestId, es.EOName, gl.regname, gl.tername, gl.areaname
        FROM EducationalEstablishment es
        LEFT JOIN GEOLOCATION gl
        ON es.locationId = gl.locationId) ze
        ON od.mathptregname = ze.regname
        AND od.mathptareaname = ze.areaname
        AND od.mathpttername = ze.tername
    WHERE
        mathtest IS NOT NULL;

INSERT INTO EXAM(outid, DisciplineName, Years, EduestId, TestStatus,
        Ball100, Ball12, Ball, examLanguage)
    SELECT
        od.outid, od.phystest, od.Years, od.institutionId, od.physTestStatus,
        od.physBall100, od.physBall12, od.physBall, od.physlang
    FROM odata od
    LEFT JOIN
        (SELECT DISTINCT es.eduestId, es.EOName, gl.regname, gl.tername, gl.areaname
        FROM EducationalEstablishment es
        LEFT JOIN GEOLOCATION gl
        ON es.locationId = gl.locationidId) ze
        ON od.physptregname = ze.regname
        AND od.physptareaname = ze.areaname
        AND od.physpttername = ze.tername
    WHERE
        phystest IS NOT NULL;

INSERT INTO EXAM(outid, DisciplineName, Years, EduestidId, TestStatus,
        Ball100, Ball12, Ball, Lang)
    SELECT
        od.outid, od.chemtest, od.Years, ze.EduestId, od.chemTestStatus,
        od.chemBall100, od.chemBall12, od.chemBall, od.chemlang
    FROM odata od
    LEFT JOIN
        (SELECT DISTINCT es.EduestId, es.EOName, gl.regname, gl.tername, gl.areaname
        FROM EducationalEstablishment es
        LEFT JOIN GEOLOCATION gl
        ON es.locationId = gl.locationId) ze
        ON od.chemptregname = ze.regname
        AND od.chemptareaname = ze.areaname
        AND od.chempttername = ze.tername
    WHERE
        chemtest IS NOT NULL;

INSERT INTO EXAM(outid, DisciplineName, Years, EduEstId, TestStatus,
        Ball100, Ball12, Ball, examLanguage)
    SELECT
        od.outid, od.biotest, od.Years, ze.EduestId, od.bioTestStatus,
        od.bioBall100, od.bioBall12, od.bioBall, od.biolang
    FROM Odata od
    LEFT JOIN
        (SELECT DISTINCT es.EduestId, es.EOName, gl.regname, gl.tername, gl.areaname
        FROM EducationalEstablishment es
        LEFT JOIN GEOLOCATION gl
        ON es.locationId = gl.locationId ) ze
        ON od.bioptregname = ze.regname
        AND od.bioptareaname = ze.areaname
        AND od.biopttername = ze.tername
    WHERE
        biotest IS NOT NULL;

Александра Анфилова, [25.04.21 11:55]
INSERT INTO EXAM(outid, DisciplineName, Years, EduestId, TestStatus,
        Ball100, Ball12, Ball, Lang)
    SELECT
        od.outid, od.geotest, od.Years, ze.EduestId, od.geoTestStatus,
        od.geoBall100, od.geoBall12, od.geoBall, od.geolang
       
    FROM odata od
    LEFT JOIN
        (SELECT DISTINCT es.EduestId, es.EOName, gl.regname, gl.tername, gl.areaname
        FROM EducationalEstablishment es
        LEFT JOIN GEOLOCATION gl
        ON es.locationId = gl.locationId) ze
        ON od.geoptregname = ze.regname
        AND od.geoptareaname = ze.areaname
        AND od.geopttername = ze.tername
    WHERE
        geotest IS NOT NULL;

INSERT INTO EXAM(outid, DisciplineName, Years, EduestId, TestStatus,
        Ball100, Ball12, Ball, Lang)
    SELECT
        od.outid, od.engtest, od.Years, ze.EduestId, od.engTestStatus,
        od.engBall100, od.engBall12, od.engBall, NULL
    FROM odata od
    LEFT JOIN
        (SELECT DISTINCT es.EduestId, es.EOName, gl.regname, gl.tername, gl.areaname
        FROM EducationalEstablishment es
        LEFT JOIN GEOLOCATION gl
        ON es.locationId = gl.locationId) ze
        ON od.engptregname = ze.regname
        AND od.engptareaname = ze.areaname
        AND od.engpttername = ze.tername
    WHERE
        engtest IS NOT NULL;

INSERT INTO EXAM(outid, DisciplineName, Years, EduestId, TestStatus,
        Ball100, Ball12, Ball, Lang)
    SELECT
        od.outid, od.fratest, od.Years, ze.institutionId, od.fraTestStatus,
        od.fraBall100, od.fraBall12, od.fraBall, NULL
    FROM odata od
    LEFT JOIN
        (SELECT DISTINCT es.EduestId, es.EOName, gl.regname, gl.tername, gl.areaname
        FROM EducationalEstablishment es
        LEFT JOIN GEOLOCATION gl
        ON es.locationid = gl.locationid) ze
        ON es.fraptregname = ze.regname
        AND es.fraptareaname = ze.areaname
        AND es.frapttername = ze.tername
    WHERE
        fratest IS NOT NULL;

INSERT INTO EXAM(outid, DisciplineName, Years, EduestId, TestStatus,
        Ball100, Ball12, Ball, Lang)
    SELECT
        od.outid, od.deutest, od.Years, ze.EduestId, zd.deuTestStatus,
        zd.deuBall100, zd.deuBall12, zd.deuBall, NULL
    FROM odata od
    LEFT JOIN
        (SELECT DISTINCT es.EduestId, es.EOName, gl.regname, gl.tername, gl.areaname
        FROM EducationalEstablishment es
        LEFT JOIN GEOLOCATION gl
        ON es.locationId = gl.locationId) ze
        ON od.deuptregname = ze.regname
        AND od.deuptareaname = ze.areaname
        AND od.deupttername = ze.tername
    WHERE
        deutest IS NOT NULL;

INSERT INTO EXAM(outid, DisciplineName, Years, EduestId, TestStatus,
        Ball100, Ball12, Ball, Lang)
    SELECT
        od.outid, od.spatest, od.Years, ze.EduestId, od.spaTestStatus,
        od.spaBall100, od.spaBall12, od.spaBall, NULL
    FROM odata od
    LEFT JOIN
        (SELECT DISTINCT es.EduestId, es.EOName, gl.regname, gl.tername, gl.areaname
        FROM EducationalEstablishment es
        LEFT JOIN GEOLOCATION gl
        ON es.locationId = gl.locationId) ze
        ON od.spaptregname = ze.regname
        AND od.spaptareaname = ze.areaname
        AND od.spapttername = ze.tername
    WHERE
        spatest IS NOT NULL;



