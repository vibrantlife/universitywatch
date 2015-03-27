# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'json'

file = File.read('/Users/Afton1/Documents/Bootcamp/phase-3/universitywatch/universitywatch/db/campus-crime-data.json')
crimes_hash = JSON.parse(file)
# p crimes_hash[0]


