#!/bin/bash

# Color Codes
YELLOW="\e[33m"
CYAN="\e[36m"
GREEN="\e[32m"
RESET="\e[0m"

echo -e "${YELLOW}=================================================${RESET}"
echo -e "${CYAN}Disable NodeJS Default Version${RESET}"
echo -e "${YELLOW}=================================================${RESET}"
echo
dnf module disable nodejs -y

echo -e "${YELLOW}=================================================${RESET}"
echo -e "${CYAN}Enable NodeJS 20 Version${RESET}"
echo -e "${YELLOW}=================================================${RESET}"
echo
dnf module enable nodejs:20 -y

echo -e "${YELLOW}=================================================${RESET}"
echo -e "${CYAN}Install NodeJS${RESET}"
echo -e "${YELLOW}=================================================${RESET}"
echo
dnf install nodejs -y

echo -e "${YELLOW}=================================================${RESET}"
echo -e "${CYAN}Add Application User${RESET}"
echo -e "${YELLOW}=================================================${RESET}"
echo
useradd roboshop

echo -e "${YELLOW}=================================================${RESET}"
echo -e "${CYAN}Copy Systemd Service File${RESET}"
echo -e "${YELLOW}=================================================${RESET}"
echo
cp catalogue.service /etc/systemd/system/catalogue.service

echo -e "${YELLOW}=================================================${RESET}"
echo -e "${CYAN}Copy MongoDB Repo File${RESET}"
echo -e "${YELLOW}=================================================${RESET}"
echo
cp mongo.repo /etc/yum.repos.d/mongo.repo

echo -e "${YELLOW}=================================================${RESET}"
echo -e "${CYAN}Create /app Directory${RESET}"
echo -e "${YELLOW}=================================================${RESET}"
echo
mkdir -p /app

echo -e "${YELLOW}=================================================${RESET}"
echo -e "${CYAN}Download Application Content${RESET}"
echo -e "${YELLOW}=================================================${RESET}"
echo
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip

cd /app

echo -e "${YELLOW}=================================================${RESET}"
echo -e "${CYAN}Unzip Application Content${RESET}"
echo -e "${YELLOW}=================================================${RESET}"
echo
unzip -o /tmp/catalogue.zip

echo -e "${YELLOW}=================================================${RESET}"
echo -e "${CYAN}Install NodeJS Dependencies${RESET}"
echo -e "${YELLOW}=================================================${RESET}"
echo
npm install

echo -e "${YELLOW}=================================================${RESET}"
echo -e "${CYAN}Install MongoDB Client${RESET}"
echo -e "${YELLOW}=================================================${RESET}"
echo
dnf install mongodb-mongosh -y

echo -e "${YELLOW}=================================================${RESET}"
echo -e "${CYAN}Load Schema${RESET}"
echo -e "${YELLOW}=================================================${RESET}"
echo
mongosh --host mongod-dev.kiranpanchavati.online </app/db/master-data.js

systemctl daemon-reload

echo -e "${YELLOW}=================================================${RESET}"
echo -e "${CYAN}Restart Catalogue Services${RESET}"
echo -e "${YELLOW}=================================================${RESET}"
echo
systemctl enable catalogue
systemctl restart catalogue

echo -e "${GREEN}✔ Setup Completed Successfully!${RESET}"
