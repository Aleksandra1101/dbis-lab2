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
