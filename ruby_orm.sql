/* SQLEditor (Postgres)*/

CREATE TABLE party_type
(
  party_type_id SERIAL,
  description VARCHAR(255) NOT NULL,

  PRIMARY KEY (party_type_id)
);

CREATE TABLE party
(
  party_id SERIAL,
  party_type_id INTEGER NOT NULL,
  shortcut VARCHAR(10) NOT NULL,

  PRIMARY KEY (party_id),

  FOREIGN KEY (party_type_id) REFERENCES party_type (party_type_id)
);

CREATE TABLE organization
(
  party_id INTERGER NOT NULL UNIQUE,
  name VARCHAR(255),

  PRIMARY KEY (party_id),

  FOREIGN KEY (party_id) REFERENCES party (party_id)
);

CREATE TABLE person
(
  party_id INTERGER NOT NULL UNIQUE,
  name_first VARCHAR(40),
  name_middle VARCHAR(40),
  name_last VARCHAR(40),
  name_nickname VARCHAR(40),
  sex VARCHAR(1),
  dob DATE,
  ssn NUMERIC(6),

  PRIMARY KEY (party_id),

  FOREIGN KEY (party_id) REFERENCES party (party_id)
);

CREATE TABLE relation_type
(
  relation_type_id SERIAL,
  description VARCHAR(255) NOT NULL,

  PRIMARY KEY (relation_type_id)
);

CREATE TABLE party_relation
(
  party_id_from INTEGER NOT NULL,
  party_id_to INTEGER NOT NULL,
  relation_type_id INTEGER NOT NULL,
  date_from DATE NOT NULL,
  date_to DATE,
  priority INT2,
  comments VARCHAR(255),

  PRIMARY KEY (party_id_from,party_id_to),

  FOREIGN KEY (party_id_from) REFERENCES party (party_id),
  FOREIGN KEY (party_id_to) REFERENCES party (party_id),
  FOREIGN KEY (relation_type_id) REFERENCES relation_type (relation_type_id)
);

