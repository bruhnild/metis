/*
####################################################################

                   GROUPE UTILISATEUR ADN_L49

####################################################################
*/

---Requête de création du groupe utilisateur---
CREATE ROLE group_adn_l49 WITH
	NOLOGIN
	NOSUPERUSER
	NOCREATEDB
	NOCREATEROLE
	INHERIT
	NOREPLICATION
	CONNECTION LIMIT -1;

---Requête de création des utilisateurs---
CREATE USER vrobert WITH LOGIN ENCRYPTED PASSWORD '8ie47cCU';
GRANT vrobert TO group_adn_l49;

CREATE USER fdridi WITH LOGIN ENCRYPTED PASSWORD 't725HpHt';
GRANT fdridi TO group_adn_l49;

--- Requete de création des droits associés

/*Autorise l'utilisateur à se connecter à la base indiquée*/
GRANT CONNECT ON DATABASE adn_l49 TO vrobert;
GRANT CONNECT ON DATABASE adn_l49 TO fdridi;

/*Actions permises par les utilisateur*/
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA administratif TO vrobert;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA analyse_thematique TO vrobert;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA coordination TO vrobert;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA erdf TO vrobert;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA orange TO vrobert;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA rapport TO vrobert;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA rip1 TO vrobert;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA rip2 TO vrobert;

GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA administratif TO fdridi;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA analyse_thematique TO fdridi;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA coordination TO fdridi;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA erdf TO fdridi;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA orange TO fdridi;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA rapport TO fdridi;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA rip1 TO fdridi;
GRANT INSERT,SELECT,UPDATE,DELETE ON ALL TABLES IN SCHEMA rip2 TO fdridi;

/*Droit d'usage de ces actions*/
GRANT USAGE ON SCHEMA administratif TO vrobert;
GRANT USAGE ON SCHEMA analyse_thematique TO vrobert;
GRANT USAGE ON SCHEMA coordination TO vrobert;
GRANT USAGE ON SCHEMA erdf TO vrobert;
GRANT USAGE ON SCHEMA orange TO vrobert;
GRANT USAGE ON SCHEMA rapport TO vrobert;
GRANT USAGE ON SCHEMA rip1 TO vrobert;
GRANT USAGE ON SCHEMA rip2 TO vrobert;

GRANT USAGE ON SCHEMA administratif TO fdridi;
GRANT USAGE ON SCHEMA analyse_thematique TO fdridi;
GRANT USAGE ON SCHEMA coordination TO fdridi;
GRANT USAGE ON SCHEMA erdf TO fdridi;
GRANT USAGE ON SCHEMA orange TO fdridi;
GRANT USAGE ON SCHEMA rapport TO fdridi;
GRANT USAGE ON SCHEMA rip1 TO fdridi;
GRANT USAGE ON SCHEMA rip2 TO fdridi;

/*Permission de création de séquences*/
GRANT USAGE ON ALL SEQUENCES IN SCHEMA administratif TO vrobert;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA analyse_thematique TO vrobert;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA coordination TO vrobert;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA erdf TO vrobert;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA orange TO vrobert;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA rapport TO vrobert;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA rip1 TO vrobert;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA rip2 TO vrobert;

GRANT USAGE ON ALL SEQUENCES IN SCHEMA administratif TO fdridi;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA analyse_thematique TO fdridi;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA coordination TO fdridi;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA erdf TO fdridi;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA orange TO fdridi;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA rapport TO fdridi;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA rip1 TO fdridi;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA rip2 TO fdridi;

/*Suppression des users
REVOKE ALL ON SCHEMA administratif FROM vrobert;
REVOKE ALL ON SCHEMA analyse_thematique FROM vrobert;
REVOKE ALL ON SCHEMA coordination FROM vrobert;
REVOKE ALL ON SCHEMA erdf FROM vrobert;
REVOKE ALL ON SCHEMA orange FROM vrobert;
REVOKE ALL ON SCHEMA rapport FROM vrobert;
REVOKE ALL ON SCHEMA rip1 FROM vrobert;
REVOKE ALL ON SCHEMA rip2 FROM vrobert;
REVOKE ALL ON ALL SEQUENCES IN SCHEMA administratif FROM vrobert;
REVOKE ALL ON ALL SEQUENCES IN SCHEMA analyse_thematique FROM vrobert;
REVOKE ALL ON ALL SEQUENCES IN SCHEMA coordination FROM vrobert;
REVOKE ALL ON ALL SEQUENCES IN SCHEMA erdf FROM vrobert;
REVOKE ALL ON ALL SEQUENCES IN SCHEMA orange FROM vrobert;
REVOKE ALL ON ALL SEQUENCES IN SCHEMA rapport FROM vrobert;
REVOKE ALL ON ALL SEQUENCES IN SCHEMA rip1 FROM vrobert;
REVOKE ALL ON ALL SEQUENCES IN SCHEMA rip2 FROM vrobert;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA administratif FROM vrobert;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA analyse_thematique FROM vrobert;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA coordination FROM vrobert;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA erdf FROM vrobert;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA orange FROM vrobert;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA rapport FROM vrobert;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA rip1 FROM vrobert;
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA rip2 FROM vrobert;
REVOKE ALL ON DATABASE adn_l49 FROM vrobert;
DROP USER vrobert;

REVOKE ALL ON SCHEMA administratif FROM fdridi
REVOKE ALL ON SCHEMA analyse_thematique FROM fdridi
REVOKE ALL ON SCHEMA coordination FROM fdridi
REVOKE ALL ON SCHEMA erdf FROM fdridi
REVOKE ALL ON SCHEMA orange FROM fdridi
REVOKE ALL ON SCHEMA rapport FROM fdridi
REVOKE ALL ON SCHEMA rip1 FROM fdridi
REVOKE ALL ON SCHEMA rip2 FROM fdridi
REVOKE ALL ON ALL SEQUENCES IN SCHEMA administratif FROM fdridi
REVOKE ALL ON ALL SEQUENCES IN SCHEMA analyse_thematique FROM fdridi
REVOKE ALL ON ALL SEQUENCES IN SCHEMA coordination FROM fdridi
REVOKE ALL ON ALL SEQUENCES IN SCHEMA erdf FROM fdridi
REVOKE ALL ON ALL SEQUENCES IN SCHEMA orange FROM fdridi
REVOKE ALL ON ALL SEQUENCES IN SCHEMA rapport FROM fdridi
REVOKE ALL ON ALL SEQUENCES IN SCHEMA rip1 FROM fdridi
REVOKE ALL ON ALL SEQUENCES IN SCHEMA rip2 FROM fdridi
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA administratif FROM fdridi
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA analyse_thematique FROM fdridi
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA coordination FROM fdridi
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA erdf FROM fdridi
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA orange FROM fdridi
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA rapport FROM fdridi
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA rip1 FROM fdridi
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA rip2 FROM fdridi
REVOKE ALL ON DATABASE adn_l49 FROM fdridi
DROP USER fdridi