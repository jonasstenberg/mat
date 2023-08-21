#!/bin/bash

psql mat -c "ALTER TABLE user_passwords DISABLE TRIGGER encrypt_password;"
psql mat -f ./data/data.sql
psql mat -c "ALTER TABLE user_passwords ENABLE TRIGGER encrypt_password;"
