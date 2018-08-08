--- Schema : gracethd_metis
--- Table : t_ltech_patch201
--- Traitement : Initialise la table t_ltech_patch201 à partir de ??

TRUNCATE gracethd_metis.t_ltech_patch201 CASCADE;

INSERT INTO gracethd_metis.t_ltech_patch201 ( 
	lt_code -- VARCHAR(254) NOT NULL REFERENCES t_ltech(lt_code),
)
SELECT
	lt_code
FROM 
(	
	SELECT 
	concat('LT700', digt_6, digt_7, digt_8, digt_9, to_char(id, 'FM00000')) lt_code
	FROM
	psd_orange.sro_hsn_point_2154
	
	UNION ALL 
	
	SELECT 
	concat('LT700', digt_6, digt_7, '00', to_char(id, 'FM00000')) lt_code
	FROM
	psd_orange.nro_hsn_phase1_point_2154
) a