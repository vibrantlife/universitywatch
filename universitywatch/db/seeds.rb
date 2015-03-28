# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'json'

file = File.read(File.expand_path('db/campus-crime-data.json', Rails.root))
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
        murder: school["MURD11"].to_i,
        manslaughter: school["NEG_M11"].to_i,
        f_sex: school["FORCIB11"].to_i,
        nf_sex: school["NONFOR11"].to_i,
        robbery: school["ROBBE11"].to_i,
        ag_assault: school["AGG_A11"].to_i,
        burglary: school["BRGLA11"].to_i,
        auto_theft: school["VEHIC11"].to_i,
        arson: school["ARSON11"].to_i,
        school: new_school,
        year: 2011


        )

    Crime.create(
        murder: school["MURD12"].to_i,
        manslaughter: school["NEG_M12"].to_i,
        f_sex: school["FORCIB12"].to_i,
        nf_sex: school["NONFOR12"].to_i,
        robbery: school["ROBBE12"].to_i,
        ag_assault: school["AGG_A12"].to_i,
        burglary: school["BRGLA12"].to_i,
        auto_theft: school["VEHIC12"].to_i,
        arson: school["ARSON12"].to_i,
        school: new_school,
        year: 2012


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
        school: new_school,
        year: 2013


        )


end


