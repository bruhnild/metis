/*
####################################################################
                   GROUPE ITEMS - METIPOST
####################################################################
*/
---Requête de création du groupe utilisateur---
CREATE ROLE group_items_metipost WITH
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
GRANT CONNECT ON DATABASE metipost TO rtlili;
GRANT CONNECT ON DATABASE metipost TO sjrad;
GRANT CONNECT ON DATABASE metipost TO fdridi;
/*Actions permises par les utilisateur*/
GRANT SELECT ON ALL TABLES IN SCHEMA administratif TO rtlili;
GRANT SELECT ON ALL TABLES IN SCHEMA analyses TO rtlili;
GRANT SELECT ON ALL TABLES IN SCHEMA ban TO rtlili;
GRANT SELECT ON ALL TABLES IN SCHEMA batiments TO rtlili;
GRANT SELECT ON ALL TABLES IN SCHEMA places TO rtlili;
GRANT SELECT ON ALL TABLES IN SCHEMA pois TO rtlili;
GRANT SELECT ON ALL TABLES IN SCHEMA poste TO rtlili;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO rtlili;
GRANT SELECT ON ALL TABLES IN SCHEMA routes TO rtlili;
GRANT SELECT ON ALL TABLES IN SCHEMA topology TO rtlili;
GRANT SELECT ON ALL TABLES IN SCHEMA statistiques TO rtlili;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA ban TO rtlili;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA routes TO rtlili;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA administratif TO rtlili;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA statistiques TO rtlili;
GRANT ALL ON ALL TABLES IN SCHEMA ban TO rtlili;
GRANT ALL ON ALL TABLES IN SCHEMA routes TO rtlili;
GRANT ALL ON ALL TABLES IN SCHEMA administratif TO rtlili;
GRANT ALL ON ALL TABLES IN SCHEMA statistiques TO rtlili;
ALTER DEFAULT PRIVILEGES IN SCHEMA ban GRANT ALL PRIVILEGES ON TABLES TO rtlili;
ALTER DEFAULT PRIVILEGES IN SCHEMA routes GRANT ALL PRIVILEGES ON TABLES TO rtlili;
ALTER DEFAULT PRIVILEGES IN SCHEMA administratif GRANT ALL PRIVILEGES ON TABLES TO rtlili;
ALTER DEFAULT PRIVILEGES IN SCHEMA statistiques GRANT ALL PRIVILEGES ON TABLES TO rtlili;
GRANT CREATE ON DATABASE metipost TO rtlili;

GRANT SELECT ON ALL TABLES IN SCHEMA administratif TO sjrad;
GRANT SELECT ON ALL TABLES IN SCHEMA analyses TO sjrad;
GRANT SELECT ON ALL TABLES IN SCHEMA ban TO sjrad;
GRANT SELECT ON ALL TABLES IN SCHEMA batiments TO sjrad;
GRANT SELECT ON ALL TABLES IN SCHEMA places TO sjrad;
GRANT SELECT ON ALL TABLES IN SCHEMA pois TO sjrad;
GRANT SELECT ON ALL TABLES IN SCHEMA poste TO sjrad;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO sjrad;
GRANT SELECT ON ALL TABLES IN SCHEMA routes TO sjrad;
GRANT SELECT ON ALL TABLES IN SCHEMA topology TO sjrad;
GRANT SELECT ON ALL TABLES IN SCHEMA statistiques TO sjrad;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA ban TO sjrad;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA routes TO sjrad;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA administratif TO sjrad;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA statistiques TO sjrad;
GRANT ALL ON ALL TABLES IN SCHEMA ban TO sjrad;
GRANT ALL ON ALL TABLES IN SCHEMA routes TO sjrad;
GRANT ALL ON ALL TABLES IN SCHEMA administratif TO sjrad;
GRANT ALL ON ALL TABLES IN SCHEMA statistiques TO sjrad;
ALTER DEFAULT PRIVILEGES IN SCHEMA ban GRANT ALL PRIVILEGES ON TABLES TO sjrad;
ALTER DEFAULT PRIVILEGES IN SCHEMA routes GRANT ALL PRIVILEGES ON TABLES TO sjrad;
ALTER DEFAULT PRIVILEGES IN SCHEMA administratif GRANT ALL PRIVILEGES ON TABLES TO sjrad;
ALTER DEFAULT PRIVILEGES IN SCHEMA statistiques GRANT ALL PRIVILEGES ON TABLES TO sjrad;
GRANT CREATE ON DATABASE metipost TO sjrad;

GRANT SELECT ON ALL TABLES IN SCHEMA administratif TO fdridi;
GRANT SELECT ON ALL TABLES IN SCHEMA analyses TO fdridi;
GRANT SELECT ON ALL TABLES IN SCHEMA ban TO fdridi;
GRANT SELECT ON ALL TABLES IN SCHEMA batiments TO fdridi;
GRANT SELECT ON ALL TABLES IN SCHEMA places TO fdridi;
GRANT SELECT ON ALL TABLES IN SCHEMA pois TO fdridi;
GRANT SELECT ON ALL TABLES IN SCHEMA poste TO fdridi;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO fdridi;
GRANT SELECT ON ALL TABLES IN SCHEMA routes TO fdridi;
GRANT SELECT ON ALL TABLES IN SCHEMA topology TO fdridi;
GRANT SELECT ON ALL TABLES IN SCHEMA statistiques TO fdridi;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA ban TO fdridi;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA routes TO fdridi;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA administratif TO fdridi;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA statistiques TO fdridi;
GRANT ALL ON ALL TABLES IN SCHEMA ban TO fdridi;
GRANT ALL ON ALL TABLES IN SCHEMA routes TO fdridi;
GRANT ALL ON ALL TABLES IN SCHEMA administratif TO fdridi;
GRANT ALL ON ALL TABLES IN SCHEMA statistiques TO fdridi;
ALTER DEFAULT PRIVILEGES IN SCHEMA ban GRANT ALL PRIVILEGES ON TABLES TO fdridi;
ALTER DEFAULT PRIVILEGES IN SCHEMA routes GRANT ALL PRIVILEGES ON TABLES TO fdridi;
ALTER DEFAULT PRIVILEGES IN SCHEMA administratif GRANT ALL PRIVILEGES ON TABLES TO fdridi;
ALTER DEFAULT PRIVILEGES IN SCHEMA statistiques GRANT ALL PRIVILEGES ON TABLES TO fdridi;
GRANT CREATE ON DATABASE metipost TO fdridi;

/*Droit d'usage de ces actions*/
GRANT USAGE ON SCHEMA administratif TO rtlili;
GRANT USAGE ON SCHEMA analyses TO rtlili;
GRANT USAGE ON SCHEMA ban TO rtlili;
GRANT USAGE ON SCHEMA batiments TO rtlili;
GRANT USAGE ON SCHEMA places TO rtlili;
GRANT USAGE ON SCHEMA pois TO rtlili;
GRANT USAGE ON SCHEMA poste TO rtlili;
GRANT USAGE ON SCHEMA public TO rtlili;
GRANT USAGE ON SCHEMA routes TO rtlili;
GRANT USAGE ON SCHEMA statistiques TO rtlili;
GRANT USAGE ON SCHEMA topology TO rtlili;

GRANT USAGE ON SCHEMA administratif TO sjrad;
GRANT USAGE ON SCHEMA analyses TO sjrad;
GRANT USAGE ON SCHEMA ban TO sjrad;
GRANT USAGE ON SCHEMA batiments TO sjrad;
GRANT USAGE ON SCHEMA places TO sjrad;
GRANT USAGE ON SCHEMA pois TO sjrad;
GRANT USAGE ON SCHEMA poste TO sjrad;
GRANT USAGE ON SCHEMA public TO sjrad;
GRANT USAGE ON SCHEMA routes TO sjrad;
GRANT USAGE ON SCHEMA statistiques TO sjrad;
GRANT USAGE ON SCHEMA topology TO sjrad;

GRANT USAGE ON SCHEMA administratif TO fdridi;
GRANT USAGE ON SCHEMA analyses TO fdridi;
GRANT USAGE ON SCHEMA ban TO fdridi;
GRANT USAGE ON SCHEMA batiments TO fdridi;
GRANT USAGE ON SCHEMA places TO fdridi;
GRANT USAGE ON SCHEMA pois TO fdridi;
GRANT USAGE ON SCHEMA poste TO fdridi;
GRANT USAGE ON SCHEMA public TO fdridi;
GRANT USAGE ON SCHEMA routes TO fdridi;
GRANT USAGE ON SCHEMA statistiques TO fdridi;
GRANT USAGE ON SCHEMA topology TO fdridi;

/*Permission de création de séquences*/
GRANT USAGE ON ALL SEQUENCES IN SCHEMA ban TO rtlili;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA ban TO sjrad;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA ban TO fdridi;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA routes TO rtlili;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA routes TO sjrad;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA routes TO fdridi;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA statistiques TO rtlili;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA statistiques TO sjrad;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA statistiques TO fdridi;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA administratif TO rtlili;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA administratif TO sjrad;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA administratif TO fdridi;
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
