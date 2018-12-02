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

#steps to setup and run this application
1. git clone git@github.com:preeti1990/foot-traffic-analysis.git
2. cd food-traffic-analysis
3. bundle install
4. create config -> application.yml.default  and add USER_NAME and PASSWORD into application.yml.default
5. rake db:create
6. rake db:migrate
7. rake db:seed
8. rails c
9. Room.get_rooms_details.each do |room_details|
     puts room_details 
   end

#dependencis
1. OS ubuntu
2. rails verson:- 5.2
3. ruby version:- 2.5.1
4. mysql >= 7
5. java version >= 7
6. other dependencies mentioned in Gemfile
