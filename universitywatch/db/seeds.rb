# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'json'

file = File.read('/Users/Afton1/Documents/Bootcamp/phase-3/universitywatch/universitywatch/db/campus-crime-data.json')
crimes_array = JSON.parse(file)
crimes_array.each do |school|
    population = school["women_total"].to_i + school["men_total"].to_i
    acronym = school["INSTNM"].split(" ").map {|word| word[0].upcase }.join('')
    new_school = School.create(
        name: school["INSTNM"],
        school_type: school["Sector_desc"],
        state: school["State"],
        city: school["City"],
        population: population,
        acronym: acronym,
        street: school["Address"],
        zip: school["ZIP"]
        )


    Crime.create(
        murder: school["MURD13"].to_i,
        manslaughter: school["NEG_M13"].to_i,
        f_sex: school["FORCIB13"].to_i,
        nf_sex: school["NONFOR13"].to_i,
        robbery: school["ROBBE13"].to_i,
        ag_assault: school["AGG_A13"].to_i,
        burglary: school["BRGLA13"].to_i,
        auto_theft: school["VEHIC13"].to_i,
        arson: school["ARSON13"].to_i,
        school: new_school

        )


end


