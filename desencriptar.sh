#!/bin/bash
openssl enc -d -aes-256-cbc -in $1 -out $2 -pbkdf2
