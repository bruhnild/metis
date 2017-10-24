/*
-------------------------------------------------------------------------------------
Auteur : Marine FAUCHER (METIS)
Date de création : 16/03/2017
Objet : Structuration des tables de cables et chambres/optimisation de production diagnostique réseaux
Modification : 
Nom : Faucher Marine - Date : 25/04/2017 - Motif/nature : Remise à plat du script après mise en base (localhost) de toutes les données ADN
Nom : Faucher Marine - Date : 31/07/2017 - Motif/nature : Mise en pratique des scripts (export/import tables sources/resultats)
-------------------------------------------------------------------------------------
*/


--************* Export de tables sources vers le schema "chantier" **************

drop table if exists chantier.ft_arciti ; 
create table chantier.ft_arciti as 
SELECT ogc_fid as id, statut, mode_pose, aut_passag, aut_pass_1, nature_con, 
       type_longu, longueur, note, compositio, id_proprie, shape_len, 
       source_fil, wkb_geometry as geom 
  FROM orange_ms7.ft_arciti_villeuneuve_de_berg
  WHERE mode_pose = '7';

drop table if exists chantier.ft_chambre ; 
create table chantier.ft_chambre as 
SELECT ogc_fid as id , statut, implant, nature_cha, ref_chambr, ref_note, code_com, 
       code_voie, num_voie, id_proprie, code_ch1, code_ch2, note, securisee, 
       cle_mkt1, cle_mkt2, code_ch1_c, code_ch2_p, wkb_geometry as geom, source_file
  FROM orange_ms7.ft_chambre_villeuneuve_de_berg;

--************* Formatage des tables ep **************

create table ep_ms7.chb_villeuneuve_de_berg as 
SELECT ogc_fid, classement, statut, implant, nature_cha, ref_chambr, 
       ref_note, code_com, code_voie, num_voie, id_proprie, code_ch1, 
       code_ch2, note, securisee, cle_mkt1, cle_mkt2, code_ch1_c, code_ch2_p, 
       source_file, wkb_geometry
  FROM chantier.chb;

CREATE INDEX idx_ep_ms7_chb_villeuneuve_de_berg ON ep_ms7.chb_villeuneuve_de_berg (classement) ; --- index attributaire
CREATE INDEX idx_ep_ms7_chb_villeuneuve_de_berg_geom ON ep_ms7.chb_villeuneuve_de_berg (wkb_geometry) ; --- index spatial
ALTER TABLE ep_ms7.chb_villeuneuve_de_berg ADD PRIMARY KEY (ogc_fid);
ALTER TABLE ep_ms7.chb_villeuneuve_de_berg ADD COLUMN choix_un smallint;
UPDATE ep_ms7.chb_villeuneuve_de_berg as a SET choix_un = 1;
ALTER TABLE ep_ms7.chb_villeuneuve_de_berg ADD COLUMN choix_deux smallint;
ALTER TABLE ep_ms7.chb_villeuneuve_de_berg ADD COLUMN choix_trois smallint;
ALTER TABLE ep_ms7.chb_villeuneuve_de_berg DROP COLUMN ogc_fid ;
ALTER TABLE ep_ms7.chb_villeuneuve_de_berg ADD COLUMN ogc_fid SERIAL PRIMARY KEY;

create table ep_ms7.infra_villeuneuve_de_berg as 
SELECT ogc_fid, statut, mode_pose, aut_passag, aut_pass_1, nature_con, 
       type_longu, longueur, note, compositio, id_proprie, shape_len, 
       source_fil, wkb_geometry
  FROM chantier.infra;

CREATE INDEX idx_ep_ms7_infra_villeuneuve_de_berg ON ep_ms7.infra_villeuneuve_de_berg (mode_pose) ; --- index attributaire
CREATE INDEX idx_ep_ms7_infra_villeuneuve_de_berg_geom ON ep_ms7.infra_meyras (wkb_geometry) ; --- index spatial
ALTER TABLE ep_ms7.infra_villeuneuve_de_berg ADD PRIMARY KEY (ogc_fid);
ALTER TABLE ep_ms7.infra_villeuneuve_de_berg ADD COLUMN choix_un smallint;
UPDATE ep_ms7.infra_villeuneuve_de_berg as a SET choix_un = 1;
ALTER TABLE ep_ms7.infra_villeuneuve_de_berg ADD COLUMN choix_deux smallint;
ALTER TABLE ep_ms7.infra_villeuneuve_de_berg ADD COLUMN choix_trois smallint;
ALTER TABLE ep_ms7.infra_villeuneuve_de_berg DROP COLUMN ogc_fid ;
ALTER TABLE ep_ms7.infra_villeuneuve_de_berg ADD COLUMN ogc_fid SERIAL PRIMARY KEY;

--************* Insertion des choix 2 et 3 **************

INSERT INTO ep_ms7.infra_villeuneuve_de_berg (
 statut, mode_pose, aut_passag, aut_pass_1, nature_con, 
       type_longu, longueur, note, compositio, id_proprie, shape_len, 
       source_fil, wkb_geometry
)
SELECT
statut, mode_pose, aut_passag, aut_pass_1, nature_con, 
       type_longu, longueur, note, compositio, id_proprie, shape_len, 
       source_fil, wkb_geometry
FROM chantier.infra
;



INSERT INTO ep_ms7.chb_villeuneuve_de_berg (
 classement, statut, implant, nature_cha, ref_chambr, 
       ref_note, code_com, code_voie, num_voie, id_proprie, code_ch1, 
       code_ch2, note, securisee, cle_mkt1, cle_mkt2, code_ch1_c, code_ch2_p, 
       source_file, wkb_geometry


)
SELECT
 classement, statut, implant, nature_cha, ref_chambr, 
       ref_note, code_com, code_voie, num_voie, id_proprie, code_ch1, 
       code_ch2, note, securisee, cle_mkt1, cle_mkt2, code_ch1_c, code_ch2_p, 
       source_file, wkb_geometry
FROM chantier.chb
;





--********************* Structuration des tables ***************************


/*
--- Schema : chantier
--- Table : ft_chambre

---- Caractériser le type de conduite 

ALTER TABLE chantier.ft_arciti
ADD type_reseau varchar  --- ajout champ "type_reseau"
;

UPDATE chantier.ft_arciti
SET type_reseau = 'autre'  
WHERE compositio is null 
;

UPDATE chantier.ft_arciti 
SET type_reseau = 'distribution'  
WHERE compositio like '%Ø2%' --- diamètre ~ 20 
OR compositio like '%Ø3%' --- diamètre ~ 30 
OR compositio like '%Ø4%' --- diamètre ~ 40 
OR compositio like '%Ø5%' --- diamètre ~ 50 
AND mode_pose = '7' --- selection des conduites uniquement
;

UPDATE chantier.ft_arciti
SET type_reseau = 'transport'  
WHERE compositio like '%Ø6%' --- diamètre ~ 60 
OR compositio like '%Ø7%' --- diamètre ~ 70 
OR compositio like '%Ø8%' --- diamètre ~ 80 
OR compositio like '%Ø9%' --- diamètre ~ 90 
OR compositio like '%Ø1%' --- diamètre ~ 100 
AND mode_pose = '7' --- selection des conduites uniquement 
;

UPDATE chantier.ft_arciti
SET type_reseau = 'autre' --- Reste des cables de réseaux non caractérisés
WHERE type_reseau is null 
;

--- Schema : chantier
--- Table : ft_chambre

ALTER TABLE chantier.ft_chambre
ADD ref_chambr_valid varchar  --- ajout champ "ref_chambr_valid"
;

--- Caractériser les chambres d'après leur références en percutable/non percutable 

UPDATE chantier.ft_chambre
SET ref_chambr_valid = 'non percutable' 
WHERE 

NON PERCUTABLES


ref_chambr = 'L0T'
OR ref_chambr ='LOT' 
OR ref_chambr ='L0P'
OR ref_chambr ='LOP' 
OR ref_chambr ='LIP'   
OR ref_chambr = 'L1T'
OR ref_chambr ='L1C'
OR ref_chambr = 'L1P'
OR ref_chambr ='L2P'  
OR ref_chambr = 'L2C'
OR ref_chambr = 'L2P'
OR ref_chambr = 'L2T'
OR ref_chambr = 'A1'
OR ref_chambr = 'A/2'
OR ref_chambr = 'A/1'
OR ref_chambr ='1/2' 
OR ref_chambr ='1/2 A1' 
OR ref_chambr ='1/2A1'
OR ref_chambr ='A1a'
OR ref_chambr ='1/2a1'  
OR ref_chambr = 'A2'
OR ref_chambr ='A2a' 
OR ref_chambr ='A2A'
OR ref_chambr = 'A3'
OR ref_chambr ='A3a' 
OR ref_chambr ='A3A' 
OR ref_chambr = 'REG' 
OR ref_chambr ='regard' 
OR ref_chambr ='REGARD' 
OR ref_chambr = '30X'
OR ref_chambr = 'TB'
OR ref_chambr = 'TBT'
OR ref_chambr ='K1C'   
OR ref_chambr ='INT'    
OR ref_chambr ='30X'  
OR ref_chambr ='B3' 
OR ref_chambr ='SPE'  
OR ref_chambr ='SPÉ'  
OR ref_chambr ='01A'  
OR ref_chambr ='INC'  
OR ref_chambr ='CH' 
OR ref_chambr ='CH privee'  
OR ref_chambr ='ch privee'  
OR ref_chambr ='S'    
OR ref_chambr ='SNCF' 
OR ref_chambr ='PAX111' 
OR ref_chambr ='R'  
OR ref_chambr ='60x60'  
OR ref_chambr ='90x90'
OR ref_chambr ='60x50'  
OR ref_chambr ='CANIVEAU TRN' 
OR ref_chambr ='CANIVEAU' 
OR ref_chambr ='RDD7' 
OR ref_chambr ='TA' 
OR ref_chambr ='PAX'  
OR ref_chambr ='DR5'  
OR ref_chambr ='Sp' 
OR ref_chambr ='TB.'  
OR ref_chambr ='LGD'    
OR ref_chambr ='TM' 
OR ref_chambr ='DIAS'   
OR ref_chambr ='TA' 
OR ref_chambr ='RG' 
OR ref_chambr ='TB' 
OR ref_chambr ='CH' 
OR ref_chambr ='DR3' 
OR ref_chambr = 'TAB'  
;

PERCUTABLES

ref_chambr ='OHN' 
OR ref_chambr ='A4' 
OR ref_chambr ='A4a'  
OR ref_chambr ='A4A'
OR ref_chambr ='A10' 
OR ref_chambr ='POA10'  
OR ref_chambr ='B1' 
OR ref_chambr ='B2' 
OR ref_chambr ='C1' 
OR ref_chambr ='C2' 
OR ref_chambr ='C3'
OR ref_chambr ='D1' 
OR ref_chambr ='1/2 D1A'  
OR ref_chambr ='D1A' 
OR ref_chambr ='D1a'
OR ref_chambr ='D1as'
OR ref_chambr ='D1AS'
OR ref_chambr ='D1b'  
OR ref_chambr ='D1B'    
OR ref_chambr ='D2' 
OR ref_chambr ='D2s' 
OR ref_chambr ='D2SP' 
OR ref_chambr ='D3' 
OR ref_chambr ='D4' 
OR ref_chambr ='D4T'
OR ref_chambr ='D4C'  
OR ref_chambr ='D12'  
OR ref_chambr ='E1' 
OR ref_chambr ='E2' 
OR ref_chambr ='E3' 
OR ref_chambr = 'E4'
OR ref_chambr ='K2C'  
OR ref_chambr ='K3C'
OR ref_chambr ='L3T' 
OR ref_chambr ='L3P'  
OR ref_chambr ='L3C'
OR ref_chambr ='L4T'  
OR ref_chambr ='L4C'    
OR ref_chambr ='1/2L4T'   
OR ref_chambr ='L4T' 
OR ref_chambr ='1/2L4P'
OR ref_chambr ='L4P' 
OR ref_chambr ='L5T'
OR ref_chambr ='L5P'
OR ref_chambr ='L6T'  
OR ref_chambr ='L6P'  
OR ref_chambr ='M1'   
OR ref_chambr ='M1C' 
OR ref_chambr ='M2'  
OR ref_chambr ='M3'
OR ref_chambr ='M3C'  
OR ref_chambr ='P1' 
OR ref_chambr ='P1C'  
OR ref_chambr ='P2' 
OR ref_chambr ='P2C'  
OR ref_chambr ='P3' 
OR ref_chambr ='P4' 
OR ref_chambr ='P5' 
OR ref_chambr ='P6' 


*/


--- Controle topologique : on ne traite que les chambres raccrochées aux cables


DROP TABLE IF EXISTS chantier.topo_chambre; --- On stocke les chambres à supprimer dans une table
CREATE TABLE chantier.topo_chambre AS 
SELECT 
 ch.id, 
 ch.code_ch1,
 ch.cle_mkt2,
 ch.ref_chambr,
 ch.geom
FROM chantier.ft_chambre AS ch
WHERE
ch.id NOT IN 
  (
    SELECT 
      chambre.id
    FROM 
     chantier.ft_arciti as cable,
     chantier.ft_chambre as chambre
    WHERE 
      ST_Intersects(chambre.geom,cable.geom)
  ) 
 ;

DROP TABLE IF EXISTS chantier.ft_chambre_clean; --- Par différentiation on ne garde que les chambres sur cables
CREATE TABLE  chantier.ft_chambre_clean as 
SELECT 
 DISTINCT ON (geom)geom,  
 id,
 code_ch1,
 cle_mkt2,
 ref_chambr,
 implant
FROM chantier.ft_chambre AS ch
WHERE ch.id NOT IN
  (
    SELECT 
     chambre.id
    FROM
     chantier.topo_chambre AS topo,
     chantier.ft_chambre AS chambre
    WHERE ST_Equals(chambre.geom,topo.geom))
;


--- Cast du type du champ "code_ch1"

ALTER TABLE chantier.ft_chambre_clean ALTER COLUMN code_ch1 TYPE integer USING (code_ch1::integer);

--********************* Requête récursive ***************************

/*
-------------------------------------------------------------------------------------
I. La premiere partie de la requete trouve tous les cables partant de la chambre de départ 
et connectés a des chambres (geomroom)
-------------------------------------------------------------------------------------
*/
 
DROP TABLE IF EXISTS chantier.analyse_chambre;
CREATE TABLE chantier.analyse_chambre as 

WITH RECURSIVE tmp AS (
SELECT 
 r.id AS id_chambre_src, 
 c.id AS id_cable, 
 1::INT AS step, 
 ARRAY[r2.id] AS idrooms,
 r2.geom AS geomroom
FROM chantier.ft_chambre_clean r JOIN chantier.ft_arciti c ON st_dwithin(st_boundary(c.geom), r.geom, 0.001) --- lien entre la chambre de départ et un câble
JOIN chantier.ft_chambre_clean r2 ON st_dwithin(st_boundary(c.geom), r2.geom, 0.001) --- lien entre un cable et sa chambre d'arrivée
WHERE r.id = 97 AND r2.id <> 97  --- id chambre de départ

/*
-------------------------------------------------------------------------------------
II. La deuxieme partie, récursive, cherche tous les cables connectés aux chambres 
trouvées à l'étape précédente.
-------------------------------------------------------------------------------------
*/

UNION ALL --- selection des cables connectés aux chambres courantes,
SELECT 
 t.id_chambre_src, 
 c.id, 
 step+1, 
 t.idrooms||r.id, 
 r.geom
FROM chantier.ft_arciti c JOIN tmp t ON st_dwithin(st_boundary(c.geom), t.geomroom, 0.001)
JOIN chantier.ft_chambre_clean r ON st_dwithin(st_boundary(c.geom), r.geom, 0.001)
WHERE c.id <> t.id_cable AND NOT (r.id = ANY(t.idrooms)) --- on ne prend pas les câbles et les chambres déjà traitées (condition de stop de la récursion)
AND step <=2 --- on s'arrête à N+5
) 
SELECT * FROM tmp
ORDER BY id_cable
;
CREATE INDEX idx_analyse_chambre_id ON chantier.analyse_chambre (id_chambre_src) ; --- index attributaire
CREATE INDEX idx_analyse_chambre_geom ON chantier.analyse_chambre (geomroom) ; --- index spatial

--- Cast du champ array "idrooms" en text

ALTER TABLE chantier.analyse_chambre ALTER COLUMN idrooms TYPE varchar USING (idrooms::varchar);

--- On retire les accolades 

UPDATE chantier.analyse_chambre
SET idrooms = REPLACE(idrooms, '{' , '');
UPDATE chantier.analyse_chambre
SET idrooms = REPLACE(idrooms, '}' , '');

--- Chambres traversées stockées dans un tableau
--- On split le tableau en autant de colonnes qu'il y a de valeurs séparées par une virgule 

DROP TABLE IF EXISTS chantier.analyse_chambre_reformat;
CREATE TABLE chantier.analyse_chambre_reformat AS 
SELECT 
 geomroom,
 step, 
 id_cable,
 id_chambre_src AS "N+2",
 split_part(idrooms, ',', 1) AS "N+3",
 split_part(idrooms, ',', 2) AS "N+4",
 split_part(idrooms, ',', 3) AS "N+5"
FROM  chantier.analyse_chambre;
;

--- Remplace les valeurs non numériques par des null

UPDATE chantier.analyse_chambre_reformat
SET "N+3" = null where "N+3" !~ '[0-9]'
;
UPDATE chantier.analyse_chambre_reformat
SET "N+4" = null where "N+4" !~ '[0-9]'
;
UPDATE chantier.analyse_chambre_reformat
SET "N+5" = null where "N+5" !~ '[0-9]'
;

--- Cast des champs N+3, N+4, N+5 en integer


ALTER TABLE chantier.analyse_chambre_reformat ALTER COLUMN "N+2" TYPE integer USING ("N+2"::integer);
ALTER TABLE chantier.analyse_chambre_reformat ALTER COLUMN "N+3" TYPE integer USING ("N+3"::integer);
ALTER TABLE chantier.analyse_chambre_reformat ALTER COLUMN "N+4" TYPE integer USING ("N+4"::integer);
ALTER TABLE chantier.analyse_chambre_reformat ALTER COLUMN "N+5" TYPE integer USING ("N+5"::integer);

--- Cast du champ code_ch1 de ft_chambre en integer

ALTER TABLE chantier.ft_chambre ALTER COLUMN code_ch1 TYPE integer USING (code_ch1::integer);


--- Remplace les id par les code_ch1 des chambres percutables

UPDATE chantier.analyse_chambre_reformat as a 
SET "N+2" = b.code_ch1
FROM chantier.ft_chambre AS b 
WHERE a."N+2" = b.id;
UPDATE chantier.analyse_chambre_reformat as a 
SET "N+3" = b.code_ch1
FROM chantier.ft_chambre AS b 
WHERE a."N+3"=b.id;
UPDATE chantier.analyse_chambre_reformat as a 
SET "N+4" = b.code_ch1
FROM chantier.ft_chambre AS b 
WHERE a."N+4"=b.id;
UPDATE chantier.analyse_chambre_reformat as a 
SET "N+5" = b.code_ch1
FROM chantier.ft_chambre AS b 
WHERE a."N+5"=b.id;

--- Gid 

ALTER TABLE chantier.analyse_chambre_reformat ADD COLUMN gid SERIAL PRIMARY KEY;
--- Classement des chambres

DROP TABLE IF EXISTS chantier.analyse_chambre_reformat_order;
CREATE TABLE chantier.analyse_chambre_reformat_order AS 
SELECT 
 geomroom, 
 step, 
 id_cable, 
 "N+2",
 1::int AS one, 
 "N+3", 
 2::int AS two, 
 "N+4", 
 3::int AS three, 
 "N+5", 
 4::int AS four, 
 gid
 FROM chantier.analyse_chambre_reformat;

--- Structuration de la table en chambre a (origine) ==> chambre b (destination)

DROP TABLE IF EXISTS chantier.analyse_chambre_reformat_order_rows;
CREATE TABLE chantier.analyse_chambre_reformat_order_rows AS 
SELECT * FROM
(
    SELECT "N+2" AS chambre_a, "N+3" AS chambre_b, gid, one AS id, id_cable FROM chantier.analyse_chambre_reformat_order
    UNION ALL
    SELECT "N+3" as chambre_a, "N+4" as chambre_b, gid,  two as id, id_cable  from chantier.analyse_chambre_reformat_order
    UNION ALL
    SELECT "N+4" as chambre_a, "N+5" as chambre_b, gid,  three as id, id_cable  from chantier.analyse_chambre_reformat_order
) AS a
WHERE chambre_a IS NOT NULL AND chambre_b IS NOT NULL
ORDER BY gid, id;

/*
-------------------------------------------------------------------------------------
with tmp as (
  select *
  from chantier.analyse_chambre_reformat
), tmp1 as (
    SELECT gid, unnest(ARRAY ["N+2","N+3","N+4","N+5"]) AS ch
    FROM tmp
    ORDER BY gid
), tmp2 as (
    SELECT
      t.*,
      row_number()
      OVER () AS rn
    FROM tmp1 t
) select t1.ch as chambre_a, t2.ch as chambre_b
from tmp2 t1, tmp2 t2
where t2.rn = t1.rn + 1 and t1.gid = t2.gid and t1 IS NOT NULL AND t2 IS NOT NULL
-------------------------------------------------------------------------------------
*/

--********************* Table pour diagnostique implantation NRO ***************************

--- Serial chambre

ALTER TABLE chantier.analyse_chambre_reformat_order_rows ADD COLUMN serial SERIAL PRIMARY KEY;

--- Formatage table chambre_a

DROP TABLE IF EXISTS chantier.analyse_chambre_reformat_order_rows_a;
CREATE TABLE chantier.analyse_chambre_reformat_order_rows_a AS 
SELECT 
 chambre_a, 
 ref_chambr AS type_chb_a, 
 implant as implant_a,
 serial
FROM chantier.analyse_chambre_reformat_order_rows AS a
LEFT JOIN chantier.ft_chambre_clean AS b ON a.chambre_a=b.code_ch1;

--- Formatage table chambre_b

DROP TABLE IF EXISTS chantier.analyse_chambre_reformat_order_rows_b;
CREATE TABLE chantier.analyse_chambre_reformat_order_rows_b AS
SELECT 
 chambre_b, 
 ref_chambr as type_chb_b, 
 implant as implant_b,
 id_cable, 
 null::varchar as composition, 
 null::varchar as type_reseau, 
 null::float as longueur, 
 serial
FROM chantier.analyse_chambre_reformat_order_rows AS a
LEFT JOIN chantier.ft_chambre_clean AS b ON a.chambre_b=b.code_ch1;

--- Jointure des tables chambre_a & chambre_b

DROP TABLE IF EXISTS chantier.diag_nro;
CREATE TABLE chantier.diag_nro AS 
SELECT 
 chambre_a, 
 type_chb_a, 
 implant_a,
 chambre_b, 
 type_chb_b, 
 implant_b,
 id_cable, 
 composition, 
 type_reseau,
 longueur::int,
 'Orange'::varchar as proprietaire,
 'Non'::varchar as percement_a,
 'Non'::varchar as percement_b,
 '-'::varchar as  diam_alveole,
 '-'::varchar as  occup_alv,
 '-'::varchar as  perc_occup

FROM chantier.analyse_chambre_reformat_order_rows_a AS a
LEFT JOIN chantier.analyse_chambre_reformat_order_rows_b AS b ON a.serial=b.serial
ORDER BY a.serial;

ALTER TABLE chantier.diag_nro ADD COLUMN classement SERIAL PRIMARY KEY;
CREATE INDEX idx_diag_nro_id ON chantier.diag_nro (classement) ; --- index attributaire

--- Update composition infra
UPDATE chantier.diag_nro AS a 
SET composition = b.compositio
FROM chantier.ft_arciti AS b 
WHERE a.id_cable=b.id
;


--- Update longueur infra

UPDATE chantier.diag_nro AS a 
SET longueur = b.longueur
FROM chantier.ft_arciti AS b 
WHERE a.id_cable=b.id
;

--- Update Percement CHB A

UPDATE chantier.diag_nro AS a 
SET percement_a = 'Oui'
WHERE classement = 1
;

--- Classer le diag par ordre de chambre

UPDATE chantier.diag_nro SET classement = sort
FROM (select classement, rank() over (ORDER BY classement) sort
FROM chantier.diag_nro) o
WHERE chantier.diag_nro.classement = o.classement


;

--- Supprimer doublons 

DELETE FROM chantier.diag_nro
WHERE classement IN (
  SELECT 
   classement
    FROM (
      SELECT 
       classement,
       ROW_NUMBER() OVER (partition BY chambre_a, chambre_b ORDER BY classement) AS rnum
        FROM chantier.diag_nro) t
        WHERE t.rnum > 1);

--- Export en CSV

SET CLIENT_ENCODING TO 'LATIN1';
COPY chantier.diag_nro
TO 'C:\csv\myfile1.csv' WITH DELIMITER  ';' CSV HEADER ;

--********************* Tables export ***************************

--- Table CHB

DROP TABLE IF EXISTS chantier.chb;
CREATE TABLE chantier.chb AS
SELECT 
 distinct on(id) id as ogc_fid, 
 classement,
 statut, 
 implant,
 nature_cha, 
 ref_chambr, 
 ref_note, 
 code_com, 
 code_voie, 
 num_voie, 
 id_proprie, 
 code_ch1, 
 code_ch2, 
 note, 
 securisee, 
cle_mkt1, 
cle_mkt2, 
code_ch1_c, 
code_ch2_p, 
a.source_file, 
geom as wkb_geometry
FROM chantier.ft_chambre as a, chantier.diag_nro AS b
WHERE a.code_ch1=b.chambre_a OR a.code_ch1=b.chambre_b
;

ALTER TABLE chantier.chb ADD PRIMARY KEY (ogc_fid);
CREATE INDEX idx_chb_id ON chantier.chb (classement) ; --- index attributaire
CREATE INDEX idx_chb_geom ON chantier.chb (wkb_geometry) ; --- index spatial


--- TABLE INFRA

DROP TABLE IF EXISTS chantier.infra;
CREATE TABLE chantier.infra AS 
SELECT 
 distinct(id) ogc_fid,
 statut, 
 mode_pose, 
 aut_passag, 
 aut_pass_1, 
 nature_con, 
 type_longu, 
 a.longueur, 
 note, 
 compositio, 
 id_proprie, 
 shape_len,
 a.source_fil,
 geom as wkb_geometry
 
FROM chantier.ft_arciti AS a, chantier.diag_nro AS b
WHERE a.id = b.id_cable
;

ALTER TABLE chantier.infra ADD PRIMARY KEY (ogc_fid);


--- Sppression tables intermédiaires

DROP TABLE IF EXISTS chantier.topo_chambre;
DROP TABLE IF EXISTS chantier.ft_chambre_clean;
DROP TABLE IF EXISTS chantier.analyse_chambre;
DROP TABLE IF EXISTS chantier.analyse_chambre_reformat;
DROP TABLE IF EXISTS chantier.analyse_chambre_reformat_order;
DROP TABLE IF EXISTS chantier.analyse_chambre_reformat_order_rows;
DROP TABLE IF EXISTS chantier.analyse_chambre_reformat_order_rows_a;
DROP TABLE IF EXISTS chantier.analyse_chambre_reformat_order_rows_b;

