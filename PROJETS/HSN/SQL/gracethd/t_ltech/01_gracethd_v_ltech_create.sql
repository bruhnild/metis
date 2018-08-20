--- Schema : gracethd_metis
--- Vue : v_ltech
--- Traitement : Initialise la vue v_ltech 

CREATE OR REPLACE VIEW gracethd_metis.v_ltech AS 

SELECT
	lt_code_metier
	, lt_code
	, lt_st_code
	, 'OR700000000000' AS lt_prop
	, 'OR700000000000' AS lt_gest
	, 'OR700000000000' AS lt_user
	, 'AVP' AS lt_statut
	, 'NC' lt_etat-- VARCHAR(3) NOT NULL  REFERENCES l_etat_type (code),
	, now() AS lt_creadat
FROM 
(	
	SELECT 
	concat('ND700', digt_6, digt_7, digt_8, digt_9, to_char(id, 'FM00000')) as lt_code_metier	
	, concat('LT700', digt_6, digt_7, digt_8, digt_9, to_char(id, 'FM00000')) lt_code
	, concat('ST700', digt_6, digt_7, digt_8, digt_9, to_char(id, 'FM00000')) AS lt_st_code
	FROM
	psd_orange.sro_hsn_point_2154
	
	UNION ALL 
	
	SELECT 
	concat('ND700', digt_6, digt_7, '00', to_char(id, 'FM00000')) as lt_code_metier														  
	, concat('LT700', digt_6, digt_7, '00', to_char(id, 'FM00000')) lt_code
	, concat('ST700', digt_6, digt_7, '00', to_char(id, 'FM00000')) AS lt_st_code
	FROM
	psd_orange.nro_hsn_phase1_point_2154

UNION ALL 

	SELECT 
	concat('BP700', b.digt_6, b.digt_7, '00', to_char(a.id, 'FM00000')) lt_code_metier
	, concat('LT700', concat(b.digt_6, b.digt_7, '00'), to_char(ROW_NUMBER() OVER (PARTITION BY concat(b.digt_6, b.digt_7, '00') ) + 13, 'FM00000')) as lt_code	
	, concat('ST700', concat(b.digt_6, b.digt_7, '00'), to_char(ROW_NUMBER() OVER (PARTITION BY concat(b.digt_6, b.digt_7, '00') ) + 13, 'FM00000')) as lt_st_code														  
	FROM
	avp_n070gay.boite a
	, psd_orange.zasro_hsn_polygon_2154 b
	WHERE ST_CONTAINS(b.geom, a.geom)
) a