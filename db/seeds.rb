# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

 

User.destroy_all
u1 = User.create(:first_name => "Chla", :last_name => "TLeader", :username => "chlaleader", :email => "tl@tl.com",:password=>"Password123",:role => 1, :locale => "en")


u2 = User.create(:first_name => "Chla", :last_name => "TMember", :username => "chlamember",:email => "tm@tm.com",:password=>"Password123",:role => 2, :locale => "en")


User.create(:first_name => "Admin", :last_name => "User", :username => "chlaadmin",:email => "admin@admin.com",:password=>"Password123",:role => 0, :locale => "en")

m1 = Mission.create(:name => "Mission 1")
m1.build_about_study

m2 = Mission.create(:name => "Mission 2")
m2.build_about_study

u1.missions << m1
u1.missions << m2
