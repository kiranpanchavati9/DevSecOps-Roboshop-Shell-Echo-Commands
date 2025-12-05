echo =================================================
echo Disable NodeJS Default Version
echo =================================================
echo
dnf module disable nodejs -y

echo =================================================
echo Disable NodeJS 20 Version
echo =================================================
echo
dnf module enable nodejs:20 -y

echo =================================================
echo Install NodeJS
echo =================================================
echo
dnf install nodejs -y

echo =================================================
echo Add Application User
echo =================================================
echo useradd roboshop

echo =================================================
echo Copy Systemd Service file
echo =================================================
echo

cp catalogue.service /etc/systemd/system/catalogue.service

echo =================================================
echo Copy Mongod Repo File
echo =================================================
echo
cp mongo.repo /etc/yum.repos.d/mongo.repo


echo =================================================
echo Create app directory
echo =================================================
echo
mkdir /app

echo =================================================
echo Download application content
echo =================================================
echo
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip

cd /app

echo =================================================
echo Unzip Application Content
echo =================================================
echo
unzip /tmp/catalogue.zip

cd /app

echo =================================================
echo Download NodeJS Dependencies
echo =================================================
echo
npm install

echo =================================================
echo Install Mongod Client
echo =================================================
echo
dnf install mongodb-mongosh -y


echo =================================================
echo Load Schema
echo =================================================
echo
mongosh --host mongod-dev.kiranpanchavati.online </app/db/master-data.js


systemctl daemon-reload

echo =================================================
echo Restart Catalogue Services
echo =================================================
echo

systemctl enable catalogue
systemctl restart catalogue

