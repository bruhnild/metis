/*
-------------------------------------------------------------------------------------
Auteur : Marine FAUCHER (METIS)
Date de création : 26/06/2018
Objet : Insertion des valeurs de v_adresse dans rbal.t_adresse et gracethd_metis.t_adresse 
Modification : Nom : ///// - Date : date_de_modif - Motif/nature : //////

-------------------------------------------------------------------------------------
*/

--- Schema : rbal
--- Table : t_adresse
--- Traitement : Rempli la table t_adresse avec les nouvelles valeurs de v_adresse

TRUNCATE gracethd_metis.t_adresse CASCADE;
TRUNCATE rbal.t_adresse CASCADE;

INSERT INTO rbal.t_adresse ( 
	ad_code, 
	ad_ban_id, 
	ad_nomvoie, 
	ad_fantoir, 
	ad_numero, 
	ad_rep, 
	ad_insee, 
	ad_postal, 
	ad_alias, 
	ad_nom_ld, 
	ad_x_ban, 
	ad_y_ban, 
	ad_commune, 
	ad_section, 
	ad_idpar, 
	ad_x_parc, 
	ad_y_parc, 
	ad_nat, 
	ad_nblhab, 
	ad_nblpro, 
	ad_nbprhab, 
	ad_nbprpro, 
	ad_rivoli, 
	ad_hexacle, 
	ad_hexaclv, 
	ad_distinf, 
	ad_isole, 
	ad_prio, 
	ad_racc, 
	ad_batcode, 
	ad_nombat, 
	ad_ietat, 
	ad_itypeim, 
	ad_imneuf, 
	ad_idatimn, 
	ad_prop, 
	ad_gest, 
	ad_idatsgn, 
	ad_iaccgst, 
	ad_idatcab, 
	ad_idatcom, 
	ad_typzone, 
	ad_comment, 
	ad_geolqlt, 
	ad_geolmod, 
	ad_geolsrc, 
	ad_creadat, 
	ad_majdate, 
	ad_majsrc, 
	ad_abddate, 
	ad_abdsrc, 
	nom_sro, 
	nb_prises_totale, 
	statut, 
	cas_particuliers,
	nom_id, 
	nom_pro,
	typologie_pro, 
	x, 
	y, 
	potentiel_ftte, 
	geom
)
SELECT
	ad_code, 
	ad_ban_id, 
	ad_nomvoie, 
	ad_fantoir, 
	ad_numero, 
	ad_rep, 
	ad_insee, 
	ad_postal, 
	ad_alias, 
	ad_nom_ld, 
	ad_x_ban, 
	ad_y_ban, 
	ad_commune, 
	ad_section, 
	ad_idpar, 
	ad_x_parc, 
	ad_y_parc, 
	ad_nat, 
	ad_nblhab, 
	ad_nblpro, 
	ad_nbprhab, 
	ad_nbprpro, 
	ad_rivoli, 
	ad_hexacle, 
	ad_hexaclv, 
	ad_distinf, 
	ad_isole, 
	ad_prio, 
	ad_racc, 
	ad_batcode, 
	ad_nombat, 
	ad_ietat, 
	ad_itypeim, 
	ad_imneuf, 
	ad_idatimn, 
	ad_prop, 
	ad_gest, 
	ad_idatsgn, 
	ad_iaccgst, 
	ad_idatcab, 
	ad_idatcom, 
	ad_typzone, 
	ad_comment, 
	ad_geolqlt, 
	ad_geolmod, 
	ad_geolsrc, 
	now() as ad_creadat, 
	ad_majdate, 
	ad_majsrc, 
	ad_abddate, 
	ad_abdsrc, 
	nom_sro, 
	nb_prises_totale, 
	statut, 
	cas_particuliers,
	nom_id, 
	nom_pro,
	typologie_pro, 
	x, 
	y, 
	potentiel_ftte, 
	geom
	FROM rbal.v_adresse;

;

--- Schema : gracethd_metis
--- Table : t_adresse
--- Traitement : Rempli la table t_adresse avec les nouvelles valeurs de v_adresse

INSERT INTO gracethd_metis.t_adresse ( 
	ad_code, 
	ad_ban_id, 
	ad_nomvoie, 
	ad_fantoir, 
	ad_numero, 
	ad_rep, 
	ad_insee, 
	ad_postal, 
	ad_alias, 
	ad_nom_ld, 
	ad_x_ban, 
	ad_y_ban, 
	ad_commune, 
	ad_section, 
	ad_idpar, 
	ad_x_parc, 
	ad_y_parc, 
	ad_nat, 
	ad_nblhab, 
	ad_nblpro, 
	ad_nbprhab, 
	ad_nbprpro, 
	ad_rivoli, 
	ad_hexacle, 
	ad_hexaclv, 
	ad_distinf, 
	ad_isole, 
	ad_prio, 
	ad_racc, 
	ad_batcode, 
	ad_nombat, 
	ad_ietat, 
	ad_itypeim, 
	ad_imneuf, 
	ad_idatimn, 
	ad_prop, 
	ad_gest, 
	ad_idatsgn, 
	ad_iaccgst, 
	ad_idatcab, 
	ad_idatcom, 
	ad_typzone, 
	ad_comment, 
	ad_geolqlt, 
	ad_geolmod, 
	ad_geolsrc, 
	ad_creadat, 
	ad_majdate, 
	ad_majsrc, 
	ad_abddate, 
	ad_abdsrc, 
	nom_sro, 
	nb_prises_totale, 
	statut, 
	cas_particuliers,
	nom_id, 
	nom_pro, 
	x, 
	y, 
	potentiel_ftte, 
	geom
)
SELECT
	ad_code, 
	ad_ban_id, 
	ad_nomvoie, 
	ad_fantoir, 
	ad_numero, 
	ad_rep, 
	ad_insee, 
	ad_postal, 
	ad_alias, 
	ad_nom_ld, 
	ad_x_ban, 
	ad_y_ban, 
	ad_commune, 
	ad_section, 
	ad_idpar, 
	ad_x_parc, 
	ad_y_parc, 
	ad_nat, 
	ad_nblhab, 
	ad_nblpro, 
	ad_nbprhab, 
	ad_nbprpro, 
	ad_rivoli, 
	ad_hexacle, 
	ad_hexaclv, 
	ad_distinf, 
	ad_isole, 
	ad_prio, 
	ad_racc, 
	ad_batcode, 
	ad_nombat, 
	ad_ietat, 
	ad_itypeim, 
	ad_imneuf, 
	ad_idatimn, 
	ad_prop, 
	ad_gest, 
	ad_idatsgn, 
	ad_iaccgst, 
	ad_idatcab, 
	ad_idatcom, 
	ad_typzone, 
	ad_comment, 
	ad_geolqlt, 
	ad_geolmod, 
	ad_geolsrc, 
	now() as ad_creadat, 
	ad_majdate, 
	ad_majsrc, 
	ad_abddate, 
	ad_abdsrc, 
	nom_sro, 
	nb_prises_totale, 
	statut, 
	cas_particuliers,
	nom_id, 
	nom_pro, 
	x, 
	y, 
	potentiel_ftte, 
	geom
	FROM rbal.t_adresse;

;


--- Schema : rbal
--- Vue : v_tx_match_bal_ban
--- Traitement : Vue qui contient le pourcentage de correspondance bal/ban dans la table t_adresse

CREATE OR REPLACE VIEW rbal.v_tx_match_bal_ban AS
SELECT count(ad_ban_id)*100/ count(ad_code) as tx_match_bal_ban
FROM rbal.t_adresse;