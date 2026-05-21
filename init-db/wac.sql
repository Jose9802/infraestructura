CREATE SCHEMA IF NOT EXISTS wac;

CREATE TABLE wac.users(
    id_use UUID PRIMARY KEY REFERENCES goo.accounts(id_acc),
    name_use TEXT
);