echo Disable NodeJS Default Version

echo
dnf module disable nodejs -y  &>>/tmp/roboshop.log

echo Disable NodeJS 20 Version

dnf module enable nodejs:20 -y &>>/tmp/roboshop.log

echo Install Node JS
echo

dnf install nodejs -y  &>>/tmp/roboshop.log

echo Add Application User
echo
useradd roboshop


echo Copy SystemD Service File

cp catalogue.service /etc/systemd/system/catalogue.service &>>/tmp/roboshop.log

echo Copy Mongod repo File
cp mongo.repo /etc/yum.repos.d/mongo.repo &>>/tmp/roboshop.log

echo Create Application Directory

mkdir /app &>>/tmp/roboshop.log

echo Download Application Content

curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip &>>/tmp/roboshop.log
cd /app
unzip /tmp/catalogue.zip 


cd /app
npm install

echo install mongodb

dnf install mongodb-mongosh -y
mongosh --host mongod-dev.kiranpanchavati.online </app/db/master-data.js &>>/tmp/roboshop.log

systemctl daemon-reload

systemctl enable catalogue
systemctl restart catalogue

