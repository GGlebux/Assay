CREATE TABLE "person"
(
    "id"            INTEGER PRIMARY KEY NOT NULL generated by default as identity,
    "name"          VARCHAR(255)        NOT NULL,
    "gender"        VARCHAR(255)        NOT NULL,
    "date_of_birth" DATE                NOT NULL,
    "is_gravid"     BOOLEAN             NOT NULL DEFAULT '0'
);


CREATE TABLE "indicator"
(
    "id"        INTEGER PRIMARY KEY NOT NULL generated by default as identity,
    "name"      VARCHAR(255)        NOT NULL,
    "gender"    VARCHAR(255)        NOT NULL,
    "is_gravid" BOOLEAN             NOT NULL DEFAULT '0',
    "min_age"   INTEGER             NOT NULL,
    "max_age"   INTEGER             NOT NULL,
    "min_value" FLOAT(53)           NOT NULL,
    "max_value" FLOAT(53)           NOT NULL
);



CREATE TABLE "transcript"
(
    "id"    INTEGER PRIMARY KEY NOT NULL generated by default as identity,
    "name"  VARCHAR(255)        NOT NULL,
    "fall"  jsonb               NOT NULL,
    "raise" jsonb               NOT NULL
);



CREATE TABLE "referent"
(
    "id"            INTEGER PRIMARY KEY NOT NULL generated by default as identity,
    "current_value" FLOAT(53)           NOT NULL,
    "reg_date"      DATE                NOT NULL,
    "units"         VARCHAR(255)        NOT NULL,
    "status"        VARCHAR(255)        NOT NULL,
    "transcript"    jsonb
);



CREATE TABLE "excluded_reasons"
(
    "id"        INTEGER PRIMARY KEY            NOT NULL generated by default as identity,
    "person_id" INTEGER REFERENCES Person (id) NOT NULL,
    "reason"    VARCHAR(255) UNIQUE            NOT NULL
);



CREATE TABLE "person_info"
(
    "id"           INTEGER PRIMARY KEY                                NOT NULL generated by default as identity,
    "person_id"    INTEGER REFERENCES Person (id)                     NOT NULL,
    "indicator_id" INTEGER REFERENCES Indicator (id)                  NOT NULL,
    "referent_id"  INTEGER REFERENCES Referent (id) ON DELETE CASCADE NOT NULL
);


