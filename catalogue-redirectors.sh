echo Disable NodeJS Default Version

echo
dnf module disable nodejs -y  &>>/tmp/roboshop.log
echo $?

echo Disable NodeJS 20 Version

dnf module enable nodejs:20 -y &>>/tmp/roboshop.log
echo $?

echo Install Node JS
echo

dnf install nodejs -y  &>>/tmp/roboshop.log
echo $?

echo Add Application User
echo
useradd roboshop


echo Copy SystemD Service File

cp catalogue.service /etc/systemd/system/catalogue.service &>>/tmp/roboshop.log
echo $?

echo Copy Mongod repo File
cp mongo.repo /etc/yum.repos.d/mongo.repo &>>/tmp/roboshop.log

echo Clean Old Application Directory
rm -rf /app &>>/tmp/roboshop.log
echo $?

echo $?
echo Create Application Directory
mkdir /app &>>/tmp/roboshop.log
echo $?


echo Download Application Content
curl -o /tmp/catalogue.zip https://roboshop-artifacts.s3.amazonaws.com/catalogue-v3.zip &>>/tmp/roboshop.log
echo $?

cd /app
echo $?

unzip /tmp/catalogue.zip 
echo $?

cd /app
echo $?

npm install
echo $?

echo install mongodb

dnf install mongodb-mongosh -y
echo $?

mongosh --host mongod-dev.kiranpanchavati.online </app/db/master-data.js &>>/tmp/roboshop.log
echo $?

systemctl daemon-reload
echo $?

systemctl enable catalogue
systemctl restart catalogue

