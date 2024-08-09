#!/bin/bash
sudo tee /etc/yum.repos.d/mongodb-org-7.0.repo > /dev/null << EOF
[mongodb-org-7.0]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/amazon/2/mongodb-org/7.0/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://pgp.mongodb.com/server-7.0.asc
EOF
sudo yum install -y mongodb-org
sudo yum install -y git
git clone https://github.com/mincheol07/reca6team3
cd ~
cd reca6team3
sudo wget https://truststore.pki.rds.amazonaws.com/global/global-bundle.pem

mongosh --ssl --host docdb-2024-08-09-01-45-16.cluster-cn0y60kek5cj.ap-northeast-2.docdb.amazonaws.com:27017 --sslCAFile global-bundle.pem --username project --password 12345678 --eval "quit()"
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install Flask
pip install Flask-Session
pip install certifi
pip install gridfs
pip install pymongo
pip install werkzeug

flask run --host=0.0.0.0 --port=8080
