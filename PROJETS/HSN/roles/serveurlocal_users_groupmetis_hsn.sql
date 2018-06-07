/*
####################################################################

                   GROUPE ITEMS - METIPOST

####################################################################
*/
---Requête de création du groupe utilisateur---
CREATE ROLE group_metis_hsn WITH
  NOLOGIN
  NOSUPERUSER
  NOCREATEDB
  NOCREATEROLE
  INHERIT
  NOREPLICATION
  CONNECTION LIMIT -1;

---Requête de création des utilisateurs---
CREATE USER msteiner WITH LOGIN ENCRYPTED PASSWORD '4Kf37fTe';
GRANT msteiner TO group_metis_hsn;
CREATE USER bfray WITH LOGIN ENCRYPTED PASSWORD 'BswN92u4';
GRANT bfray TO group_metis_hsn;
--- Requete de création des droits associés

/*Autorise l'utilisateur à se connecter à la base indiquée*/
GRANT CONNECT ON DATABASE hsn TO msteiner;
GRANT CONNECT ON DATABASE hsn TO bfray;
/*Actions permises par les utilisateur*/
GRANT SELECT ON ALL TABLES IN SCHEMA ban TO msteiner;
GRANT SELECT ON ALL TABLES IN SCHEMA pci70_edigeo_majic TO msteiner;
GRANT SELECT ON ALL TABLES IN SCHEMA pci70_etalab TO msteiner;
GRANT SELECT ON ALL TABLES IN SCHEMA enedis TO msteiner;
GRANT SELECT ON ALL TABLES IN SCHEMA orange TO msteiner;
GRANT SELECT ON ALL TABLES IN SCHEMA psd_orange TO msteiner;
GRANT SELECT ON ALL TABLES IN SCHEMA rbal TO msteiner;
GRANT SELECT ON ALL TABLES IN SCHEMA reseau_hsn TO msteiner;
GRANT SELECT ON ALL TABLES IN SCHEMA gracethd TO msteiner;
GRANT SELECT ON ALL TABLES IN SCHEMA gracethd_metis TO msteiner;
GRANT SELECT ON ALL TABLES IN SCHEMA gracethdcheck TO msteiner;
GRANT SELECT ON ALL TABLES IN SCHEMA gracethdcheckpub TO msteiner;
GRANT SELECT ON ALL TABLES IN SCHEMA sirene TO msteiner;
GRANT SELECT ON ALL TABLES IN SCHEMA zone_abf TO msteiner;
GRANT SELECT ON ALL TABLES IN SCHEMA zone_azi TO msteiner;
GRANT SELECT ON ALL TABLES IN SCHEMA topology TO msteiner;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO msteiner;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA ban TO msteiner;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA psd_orange TO msteiner;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA rbal TO msteiner;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA gracethd_metis TO msteiner;
GRANT ALL ON ALL TABLES IN SCHEMA ban TO msteiner;
GRANT ALL ON ALL TABLES IN SCHEMA psd_orange TO msteiner;
GRANT ALL ON ALL TABLES IN SCHEMA rbal TO msteiner;
GRANT ALL ON ALL TABLES IN SCHEMA gracethd_metis TO msteiner;
ALTER DEFAULT PRIVILEGES IN SCHEMA ban GRANT ALL PRIVILEGES ON TABLES TO msteiner;
ALTER DEFAULT PRIVILEGES IN SCHEMA psd_orange GRANT ALL PRIVILEGES ON TABLES TO msteiner;
ALTER DEFAULT PRIVILEGES IN SCHEMA rbal GRANT ALL PRIVILEGES ON TABLES TO msteiner;
ALTER DEFAULT PRIVILEGES IN SCHEMA gracethd_metis GRANT ALL PRIVILEGES ON TABLES TO msteiner;

GRANT SELECT ON ALL TABLES IN SCHEMA ban TO bfray;
GRANT SELECT ON ALL TABLES IN SCHEMA pci70_edigeo_majic TO bfray;
GRANT SELECT ON ALL TABLES IN SCHEMA pci70_etalab TO bfray;
GRANT SELECT ON ALL TABLES IN SCHEMA enedis TO bfray;
GRANT SELECT ON ALL TABLES IN SCHEMA orange TO bfray;
GRANT SELECT ON ALL TABLES IN SCHEMA psd_orange TO bfray;
GRANT SELECT ON ALL TABLES IN SCHEMA rbal TO bfray;
GRANT SELECT ON ALL TABLES IN SCHEMA reseau_hsn TO bfray;
GRANT SELECT ON ALL TABLES IN SCHEMA gracethd TO bfray;
GRANT SELECT ON ALL TABLES IN SCHEMA gracethd_metis TO bfray;
GRANT SELECT ON ALL TABLES IN SCHEMA gracethdcheck TO bfray;
GRANT SELECT ON ALL TABLES IN SCHEMA gracethdcheckpub TO bfray;
GRANT SELECT ON ALL TABLES IN SCHEMA sirene TO bfray;
GRANT SELECT ON ALL TABLES IN SCHEMA zone_abf TO bfray;
GRANT SELECT ON ALL TABLES IN SCHEMA zone_azi TO bfray;
GRANT SELECT ON ALL TABLES IN SCHEMA topology TO bfray;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO bfray;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA ban TO bfray;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA psd_orange TO bfray;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA rbal TO bfray;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA gracethd_metis TO bfray;
GRANT ALL ON ALL TABLES IN SCHEMA ban TO bfray;
GRANT ALL ON ALL TABLES IN SCHEMA psd_orange TO bfray;
GRANT ALL ON ALL TABLES IN SCHEMA rbal TO bfray;
GRANT ALL ON ALL TABLES IN SCHEMA gracethd_metis TO bfray;
ALTER DEFAULT PRIVILEGES IN SCHEMA ban GRANT ALL PRIVILEGES ON TABLES TO bfray;
ALTER DEFAULT PRIVILEGES IN SCHEMA psd_orange GRANT ALL PRIVILEGES ON TABLES TO bfray;
ALTER DEFAULT PRIVILEGES IN SCHEMA rbal GRANT ALL PRIVILEGES ON TABLES TO bfray;
ALTER DEFAULT PRIVILEGES IN SCHEMA gracethd_metis GRANT ALL PRIVILEGES ON TABLES TO bfray;

GRANT CREATE ON DATABASE hsn TO msteiner;
GRANT CREATE ON DATABASE hsn TO bfray;
/*Autorise l'utilisateur à se connecter à la base indiquée*/
GRANT CONNECT ON DATABASE hsn TO msteiner;
GRANT CONNECT ON DATABASE hsn TO bfray;
/*Droit d'usage de ces actions*/
GRANT USAGE ON SCHEMA ban TO msteiner;
GRANT USAGE ON SCHEMA pci70_edigeo_majic TO msteiner;
GRANT USAGE ON SCHEMA pci70_etalab TO msteiner;
GRANT USAGE ON SCHEMA bd_routes_ign TO msteiner;
GRANT USAGE ON SCHEMA psd_orange TO msteiner;
GRANT USAGE ON SCHEMA topology TO msteiner;
GRANT USAGE ON SCHEMA gracethd TO msteiner;
GRANT USAGE ON SCHEMA gracethdcheck TO msteiner;
GRANT USAGE ON SCHEMA gracethdcheckpub TO msteiner;
GRANT USAGE ON SCHEMA reseau_hsn TO msteiner;
GRANT USAGE ON SCHEMA enedis TO msteiner;
GRANT USAGE ON SCHEMA orange TO msteiner;
GRANT USAGE ON SCHEMA zone_abf TO msteiner;
GRANT USAGE ON SCHEMA zone_azi TO msteiner;
GRANT USAGE ON SCHEMA public TO msteiner;
GRANT USAGE ON SCHEMA rbal TO msteiner;
GRANT USAGE ON SCHEMA sirene TO msteiner;
GRANT USAGE ON SCHEMA gracethd_metis TO msteiner;

GRANT USAGE ON SCHEMA ban TO bfray;
GRANT USAGE ON SCHEMA pci70_edigeo_majic TO bfray;
GRANT USAGE ON SCHEMA pci70_etalab TO bfray;
GRANT USAGE ON SCHEMA bd_routes_ign TO bfray;
GRANT USAGE ON SCHEMA psd_orange TO bfray;
GRANT USAGE ON SCHEMA topology TO bfray;
GRANT USAGE ON SCHEMA gracethd TO bfray;
GRANT USAGE ON SCHEMA gracethdcheck TO bfray;
GRANT USAGE ON SCHEMA gracethdcheckpub TO bfray;
GRANT USAGE ON SCHEMA reseau_hsn TO bfray;
GRANT USAGE ON SCHEMA enedis TO bfray;
GRANT USAGE ON SCHEMA orange TO bfray;
GRANT USAGE ON SCHEMA zone_abf TO bfray;
GRANT USAGE ON SCHEMA zone_azi TO bfray;
GRANT USAGE ON SCHEMA public TO bfray;
GRANT USAGE ON SCHEMA rbal TO bfray;
GRANT USAGE ON SCHEMA sirene TO bfray;
GRANT USAGE ON SCHEMA gracethd_metis TO bfray;
/*Permission de création de séquences*/
GRANT USAGE ON ALL SEQUENCES IN SCHEMA ban TO msteiner;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA psd_orange TO msteiner;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO msteiner;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA topology TO msteiner;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA rbal TO msteiner;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA gracethd_metis TO msteiner;

GRANT USAGE ON ALL SEQUENCES IN SCHEMA ban TO bfray;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA psd_orange TO bfray;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO bfray;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA topology TO bfray;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA rbal TO bfray;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA gracethd_metis TO bfray;
/*Suppression des users
REVOKE ALL ON DATABASE metipost FROM rtlili;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA administratif FROM rtlili;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA analyses FROM rtlili;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA ban FROM rtlili;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA batiments FROM rtlili;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA places FROM rtlili;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA pois FROM rtlili;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA poste FROM rtlili;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA public FROM rtlili;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA routes FROM rtlili;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA topology FROM rtlili;
DROP USER rtlili;
REVOKE ALL ON DATABASE metipost FROM sjrad;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA administratif FROM sjrad;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA analyses FROM sjrad;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA ban FROM sjrad;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA batiments FROM sjrad;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA places FROM sjrad;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA pois FROM sjrad;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA poste FROM sjrad;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA public FROM sjrad;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA routes FROM sjrad;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA topology FROM sjrad;
DROP USER sjrad;
REVOKE ALL ON DATABASE metipost FROM fdridi;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA administratif FROM fdridi;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA analyses FROM fdridi;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA ban FROM fdridi;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA batiments FROM fdridi;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA places FROM fdridi;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA pois FROM fdridi;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA poste FROM fdridi;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA public FROM fdridi;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA routes FROM fdridi;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA topology FROM fdridi;
DROP USER fdridi;*/



