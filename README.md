# Description of Program

### You can 'hire' stylists.  And then add appointments under each stylist.

# Setup Instructions

### git clone repo Address
### cd hair_salon  then bundle
### CREATE DATABASE hair_salon;
### \c hair_salon;
### CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);
### CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int, appointment timestamp);
### ruby app.rb

# Copyright
### Jeyananthan Sivakumaran 2015

# License
### GPL v3
