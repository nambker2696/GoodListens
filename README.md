# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

#1 Install mysql :
sudo apt-get update
sudo apt-get install mysql-server
sudo mysql_secure_installation

#2 Create database: 
Create db: GoodListens_development

#2 Set up project:
Create database.yml
Set up user and password of mysql

bundle install

rails db:migrate

rails s
