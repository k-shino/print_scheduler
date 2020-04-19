#!/bin/bash

cd /assets/
yq r config.yml -j > config.json
yq r env-definition.yml -j > env-definition.json
yq r tasks.yml -j > tasks.json
python /print/print_schedule.py
rm config.json
rm env-definition.json
rm tasks.json