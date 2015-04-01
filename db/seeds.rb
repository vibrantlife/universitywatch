# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'json'

# file = File.read(File.expand_path('db/campus-crime-data.json', Rails.root))
# crimes_array = JSON.parse(file)
# crimes_array.each do |school|
#     population = school["women_total"].to_i + school["men_total"].to_i
#     acronym = school["INSTNM"].split(" ").map {|word| word[0].upcase }.join('')

#     if (school["MURD11"].to_i == 0 &&
#         school["NEG_M11"].to_i == 0 &&
#         school["FORCIB11"].to_i == 0 &&
#         school["NONFOR11"].to_i == 0 &&
#         school["ROBBE11"].to_i == 0 &&
#         school["AGG_A11"].to_i == 0 &&
#         school["BRGLA11"].to_i == 0 &&
#         school["VEHIC11"].to_i == 0 &&
#         school["ARSON11"].to_i == 0 &&
#         school["MURD12"].to_i == 0 &&
#         school["NEG_M12"].to_i == 0 &&
#         school["FORCIB12"].to_i == 0 &&
#         school["NONFOR12"].to_i == 0 &&
#         school["ROBBE12"].to_i == 0 &&
#         school["AGG_A12"].to_i == 0 &&
#         school["BRGLA12"].to_i == 0 &&
#         school["VEHIC12"].to_i == 0 &&
#         school["ARSON12"].to_i == 0 &&
#         school["MURD13"].to_i == 0 &&
#         school["NEG_M13"].to_i == 0 &&
#         school["FORCIB13"].to_i == 0 &&
#         school["NONFOR13"].to_i == 0 &&
#         school["ROBBE13"].to_i == 0 &&
#         school["AGG_A13"].to_i == 0 &&
#         school["BRGLA13"].to_i == 0 &&
#         school["VEHIC13"].to_i == 0 &&
#         school["ARSON13"].to_i == 0)

#     else
#         new_school = School.create(
#             name: school["INSTNM"],
#             school_type: school["Sector_desc"],
#             state: school["State"],
#             city: school["City"].titleize,
#             population: population,
#             acronym: acronym,
#             street: school["Address"].titleize,
#             zip: school["ZIP"]
#             )

#         Crime.create(
#             murder: school["MURD11"].to_i,
#             manslaughter: school["NEG_M11"].to_i,
#             f_sex: school["FORCIB11"].to_i,
#             nf_sex: school["NONFOR11"].to_i,
#             robbery: school["ROBBE11"].to_i,
#             ag_assault: school["AGG_A11"].to_i,
#             burglary: school["BRGLA11"].to_i,
#             auto_theft: school["VEHIC11"].to_i,
#             arson: school["ARSON11"].to_i,
#             school: new_school,
#             year: 2011


#             )

#         Crime.create(
#             murder: school["MURD12"].to_i,
#             manslaughter: school["NEG_M12"].to_i,
#             f_sex: school["FORCIB12"].to_i,
#             nf_sex: school["NONFOR12"].to_i,
#             robbery: school["ROBBE12"].to_i,
#             ag_assault: school["AGG_A12"].to_i,
#             burglary: school["BRGLA12"].to_i,
#             auto_theft: school["VEHIC12"].to_i,
#             arson: school["ARSON12"].to_i,
#             school: new_school,
#             year: 2012


#             )


#         Crime.create(
#             murder: school["MURD13"].to_i,
#             manslaughter: school["NEG_M13"].to_i,
#             f_sex: school["FORCIB13"].to_i,
#             nf_sex: school["NONFOR13"].to_i,
#             robbery: school["ROBBE13"].to_i,
#             ag_assault: school["AGG_A13"].to_i,
#             burglary: school["BRGLA13"].to_i,
#             auto_theft: school["VEHIC13"].to_i,
#             arson: school["ARSON13"].to_i,
#             school: new_school,
#             year: 2013


#             )
#     end
# end

# file = File.read(File.expand_path('db/acronymdata.json', Rails.root))
# accronym_array = JSON.parse(file)

# array = accronym_array["results"]["university"]
# school_info = []
# array_of_garbage = []

# array.each_with_index do |school, index|
#   if school["acronym"]["text"] === ""
#     array_of_garbage << school
#     # array.delete_at(index)
#   end
# end

# array = (array - array_of_garbage)

# array.each do |school|
#   full_names = school["acronym"]["text"].split(",")
#   split_name = full_names[0].split(" ")
#   school_name = split_name[2..-1].join(" ")
#   acronym = split_name[0]
#   other_schools = full_names[1..-1]
#   other_schools.each do |school_name|
#     school_info << {name: school_name, acronym: acronym}
#   end
#   school_info << {name: school_name, acronym: acronym}
# end


# school_info.each do |school|
#   if School.find_by(name: school[:name])
#     School.find_by(name: school[:name]).update_attributes(acronym: school[:acronym])
#   end
# end

# File.open(File.expand_path('db/geolocations.json', Rails.root), 'w') do |f|
#     f.write(Geoinfo.all.to_json)
# end

# new_file = File.read(File.expand_path('db/geolocations.json', Rails.root))
# geolocations_array = JSON.parse(new_file)


# geolocations_array.each do |location|
#     p location
#     Geoinfo.create!(lat: location["lat"], lng: location["lng"], school_id: location["school_id"])
# end

File.open(File.expand_path('db/heatmap.json', Rails.root), 'w') do |f|
    f.write(Heatmap.all.to_json)
end

# heatmap_file = File.read(File.expand_path('db/heatmap.json', Rails.root))
# heatmap_array = JSON.parse(heatmap_file)


# heatmap_array.each do |array|
#     p array
#     Heatmap.create!(geodatainfos: location["geodatainfos"])
# end
