CREATE SCHEMA IF NOT EXISTS goo;

CREATE TABLE goo.accounts(
    id_acc UUID PRIMARY KEY,
    email_acc TEXT NOT NULL UNIQUE,
    name_acc TEXT NOT NULL,
    picture_acc TEXT NOT NULL
);