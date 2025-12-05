echo Disable NodeJS Default Version

dnf module disable nodejs -y

echo Disable NodeJS 20 Version

dnf module enable nodejs:20 -y

echo Install NodeJS
dnf install nodejs -y

echo Add Application User
useradd roboshop

echo Copy Systemd Service file
cp catalogue.service /etc/systemd/system/catalogue.service

echo Copy Mongod Repo File
cp mongo.repo /etc/yum.repos.d/mongo.repo

echo Create app directory
mkdir /app

echo Download application content
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip

cd /app

echo Unzip Application Content
unzip /tmp/catalogue.zip

cd /app

echo Download NodeJS Dependencies
npm install

echo Install Mongod Client
dnf install mongodb-mongosh -y

echo Load Schema
mongosh --host mongod-dev.kiranpanchavati.online </app/db/master-data.js


systemctl daemon-reload

echo Restart Catalogue Services

systemctl enable catalogue
systemctl restart catalogue

