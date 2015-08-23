# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


cities = City.create([{:city => "San Francisco", :state => "California", :timezone => "Pacific"}, {:city => "New York", :state => "New York", :timezone => "Eastern"}, {:city => "Portland", :state => "Oregon", :timezone => "Pacific"}, {:city => "Chicago", :state => "Illinois", :timezone => "Central"}])