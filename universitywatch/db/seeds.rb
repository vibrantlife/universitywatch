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

    if (school["MURD11"].to_i == 0 &&
        school["NEG_M11"].to_i == 0 &&
        school["FORCIB11"].to_i == 0 &&
        school["NONFOR11"].to_i == 0 &&
        school["ROBBE11"].to_i == 0 &&
        school["AGG_A11"].to_i == 0 &&
        school["BRGLA11"].to_i == 0 &&
        school["VEHIC11"].to_i == 0 &&
        school["ARSON11"].to_i == 0 &&
        school["MURD12"].to_i == 0 &&
        school["NEG_M12"].to_i == 0 &&
        school["FORCIB12"].to_i == 0 &&
        school["NONFOR12"].to_i == 0 &&
        school["ROBBE12"].to_i == 0 &&
        school["AGG_A12"].to_i == 0 &&
        school["BRGLA12"].to_i == 0 &&
        school["VEHIC12"].to_i == 0 &&
        school["ARSON12"].to_i == 0 &&
        school["MURD13"].to_i == 0 &&
        school["NEG_M13"].to_i == 0 &&
        school["FORCIB13"].to_i == 0 &&
        school["NONFOR13"].to_i == 0 &&
        school["ROBBE13"].to_i == 0 &&
        school["AGG_A13"].to_i == 0 &&
        school["BRGLA13"].to_i == 0 &&
        school["VEHIC13"].to_i == 0 &&
        school["ARSON13"].to_i == 0)

    else
        new_school = School.create(
            name: school["INSTNM"],
            school_type: school["Sector_desc"],
            state: school["State"],
            city: school["City"].titleize,
            population: population,
            acronym: acronym,
            street: school["Address"].titleize,
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

end


# bad_school_data = School.all.select do |school|
#     school.crimes.select do |crime|
#         crime.murder == 0 &&
#         crime.manslaughter == 0 &&
#         crime.f_sex == 0 &&
#         crime.nf_sex == 0 &&
#         crime.robbery == 0 &&
#         crime.ag_assault == 0 &&
#         crime.burglary == 0 &&
#         crime.auto_theft == 0 &&
#         crime.arson == 0
#     end.length == 3
# end
