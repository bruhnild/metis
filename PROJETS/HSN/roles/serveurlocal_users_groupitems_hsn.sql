/*
####################################################################

                   GROUPE ITEMS - METIPOST

####################################################################
*/
---Requête de création du groupe utilisateur---
CREATE ROLE group_items_hsn WITH
  NOLOGIN
  NOSUPERUSER
  NOCREATEDB
  NOCREATEROLE
  INHERIT
  NOREPLICATION
  CONNECTION LIMIT -1;

---Requête de création des utilisateurs---
CREATE USER rtlili WITH LOGIN ENCRYPTED PASSWORD '74aXixY5';
CREATE USER sjrad WITH LOGIN ENCRYPTED PASSWORD 'Qdbk425J';
CREATE USER fdridi WITH LOGIN ENCRYPTED PASSWORD 'zaVmR436';
--- Requete de création des droits associés

/*Autorise l'utilisateur à se connecter à la base indiquée*/
GRANT CONNECT ON DATABASE hsn TO rtlili;
GRANT CONNECT ON DATABASE hsn TO sjrad;
GRANT CONNECT ON DATABASE hsn TO fdridi;
/*Actions permises par les utilisateur*/
GRANT SELECT ON ALL TABLES IN SCHEMA ban TO rtlili;
GRANT SELECT ON ALL TABLES IN SCHEMA pci70 TO rtlili;
GRANT SELECT ON ALL TABLES IN SCHEMA psd_orange TO rtlili;
GRANT SELECT ON ALL TABLES IN SCHEMA rbal TO rtlili;
GRANT SELECT ON ALL TABLES IN SCHEMA grace_thd TO rtlili;
GRANT SELECT ON ALL TABLES IN SCHEMA sirene TO rtlili;
GRANT SELECT ON ALL TABLES IN SCHEMA topology TO rtlili;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO rtlili;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA ban TO rtlili;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA psd_orange TO rtlili;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA rbal TO rtlili;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA grace_thd TO rtlili;
GRANT ALL ON ALL TABLES IN SCHEMA ban TO rtlili;
GRANT ALL ON ALL TABLES IN SCHEMA psd_orange TO rtlili;
GRANT ALL ON ALL TABLES IN SCHEMA rbal TO rtlili;
GRANT ALL ON ALL TABLES IN SCHEMA grace_thd TO rtlili;
ALTER DEFAULT PRIVILEGES IN SCHEMA ban GRANT ALL PRIVILEGES ON TABLES TO rtlili;
ALTER DEFAULT PRIVILEGES IN SCHEMA psd_orange GRANT ALL PRIVILEGES ON TABLES TO rtlili;
ALTER DEFAULT PRIVILEGES IN SCHEMA rbal GRANT ALL PRIVILEGES ON TABLES TO rtlili;
ALTER DEFAULT PRIVILEGES IN SCHEMA grace_thd GRANT ALL PRIVILEGES ON TABLES TO rtlili;

GRANT CREATE ON DATABASE hsn TO rtlili;

/*Autorise l'utilisateur à se connecter à la base indiquée*/
GRANT CONNECT ON DATABASE hsn TO sjrad;
GRANT CONNECT ON DATABASE hsn TO sjrad;
GRANT CONNECT ON DATABASE hsn TO fdridi;
/*Actions permises par les utilisateur*/
GRANT SELECT ON ALL TABLES IN SCHEMA ban TO sjrad;
GRANT SELECT ON ALL TABLES IN SCHEMA pci70 TO sjrad;
GRANT SELECT ON ALL TABLES IN SCHEMA psd_orange TO sjrad;
GRANT SELECT ON ALL TABLES IN SCHEMA sirene TO sjrad;
GRANT SELECT ON ALL TABLES IN SCHEMA topology TO sjrad;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO sjrad;
GRANT SELECT ON ALL TABLES IN SCHEMA rbal TO sjrad;
GRANT SELECT ON ALL TABLES IN SCHEMA grace_thd TO sjrad;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA ban TO sjrad;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA psd_orange TO sjrad;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA rbal TO sjrad;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA grace_thd TO sjrad;
GRANT ALL ON ALL TABLES IN SCHEMA ban TO sjrad;
GRANT ALL ON ALL TABLES IN SCHEMA psd_orange TO sjrad;
GRANT ALL ON ALL TABLES IN SCHEMA rbal TO sjrad;
GRANT ALL ON ALL TABLES IN SCHEMA grace_thd TO sjrad;
ALTER DEFAULT PRIVILEGES IN SCHEMA ban GRANT ALL PRIVILEGES ON TABLES TO sjrad;
ALTER DEFAULT PRIVILEGES IN SCHEMA psd_orange GRANT ALL PRIVILEGES ON TABLES TO sjrad;
ALTER DEFAULT PRIVILEGES IN SCHEMA rbal GRANT ALL PRIVILEGES ON TABLES TO sjrad;
ALTER DEFAULT PRIVILEGES IN SCHEMA grace_thd GRANT ALL PRIVILEGES ON TABLES TO sjrad;

GRANT CREATE ON DATABASE hsn TO sjrad;

/*Autorise l'utilisateur à se connecter à la base indiquée*/
GRANT CONNECT ON DATABASE hsn TO fdridi;
GRANT CONNECT ON DATABASE hsn TO fdridi;
GRANT CONNECT ON DATABASE hsn TO fdridi;
/*Actions permises par les utilisateur*/
GRANT SELECT ON ALL TABLES IN SCHEMA ban TO fdridi;
GRANT SELECT ON ALL TABLES IN SCHEMA pci70 TO fdridi;
GRANT SELECT ON ALL TABLES IN SCHEMA psd_orange TO fdridi;
GRANT SELECT ON ALL TABLES IN SCHEMA sirene TO fdridi;
GRANT SELECT ON ALL TABLES IN SCHEMA topology TO fdridi;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO fdridi;
GRANT SELECT ON ALL TABLES IN SCHEMA rbal TO fdridi;
GRANT SELECT ON ALL TABLES IN SCHEMA grace_thd TO fdridi;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA ban TO fdridi;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA psd_orange TO fdridi;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA rbal TO fdridi;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA grace_thd TO fdridi;
GRANT ALL ON ALL TABLES IN SCHEMA ban TO fdridi;
GRANT ALL ON ALL TABLES IN SCHEMA psd_orange TO fdridi;
GRANT ALL ON ALL TABLES IN SCHEMA rbal TO fdridi;
GRANT ALL ON ALL TABLES IN SCHEMA grace_thd TO fdridi;
ALTER DEFAULT PRIVILEGES IN SCHEMA ban GRANT ALL PRIVILEGES ON TABLES TO fdridi;
ALTER DEFAULT PRIVILEGES IN SCHEMA psd_orange GRANT ALL PRIVILEGES ON TABLES TO fdridi;
ALTER DEFAULT PRIVILEGES IN SCHEMA rbal GRANT ALL PRIVILEGES ON TABLES TO fdridi;
ALTER DEFAULT PRIVILEGES IN SCHEMA grace_thd GRANT ALL PRIVILEGES ON TABLES TO fdridi;



GRANT CREATE ON DATABASE hsn TO fdridi;

/*Droit d'usage de ces actions*/
GRANT USAGE ON SCHEMA ban TO rtlili;
GRANT USAGE ON SCHEMA pci70 TO rtlili;
GRANT USAGE ON SCHEMA psd_orange TO rtlili;
GRANT USAGE ON SCHEMA sirene TO rtlili;
GRANT USAGE ON SCHEMA topology TO rtlili;
GRANT USAGE ON SCHEMA public TO rtlili;
GRANT USAGE ON SCHEMA rbal TO rtlili;
GRANT USAGE ON SCHEMA grace_thd TO rtlili;

GRANT USAGE ON SCHEMA ban TO sjrad;
GRANT USAGE ON SCHEMA pci70 TO sjrad;
GRANT USAGE ON SCHEMA psd_orange TO sjrad;
GRANT USAGE ON SCHEMA sirene TO sjrad;
GRANT USAGE ON SCHEMA topology TO sjrad;
GRANT USAGE ON SCHEMA public TO sjrad;
GRANT USAGE ON SCHEMA rbal TO sjrad;
GRANT USAGE ON SCHEMA grace_thd TO sjrad;

GRANT USAGE ON SCHEMA ban TO fdridi;
GRANT USAGE ON SCHEMA pci70 TO fdridi;
GRANT USAGE ON SCHEMA psd_orange TO fdridi;
GRANT USAGE ON SCHEMA sirene TO fdridi;
GRANT USAGE ON SCHEMA topology TO fdridi;
GRANT USAGE ON SCHEMA public TO fdridi;
GRANT USAGE ON SCHEMA rbal TO fdridi;
GRANT USAGE ON SCHEMA grace_thd TO fdridi;
/*Permission de création de séquences*/
GRANT USAGE ON ALL SEQUENCES IN SCHEMA ban TO rtlili;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA ban TO sjrad;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA ban TO fdridi;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA psd_orange TO rtlili;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA psd_orange TO sjrad;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA psd_orange TO fdridi;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO rtlili;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO sjrad;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO fdridi;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA topology TO rtlili;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA topology TO sjrad;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA topology TO fdridi;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA rbal TO rtlili;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA rbal TO sjrad;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA rbal TO fdridi;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA grace_thd TO rtlili;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA grace_thd TO sjrad;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA grace_thd TO fdridi;
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



