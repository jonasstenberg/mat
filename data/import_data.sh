#!/bin/bash

psql mat -c "ALTER TABLE auth.users DISABLE TRIGGER encrypt_pass;"
psql mat -f ./data/data.sql
psql mat -c "ALTER TABLE auth.users ENABLE TRIGGER encrypt_pass;"
