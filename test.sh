#!/usr/bin/env bash

cd examples
rm *.db *.sql
for f in *.json; do
    file="${f%.*}"
    node ../index.js $file.db < $file.json
    sqlite3 $file.db .dump > $file.sql
done
