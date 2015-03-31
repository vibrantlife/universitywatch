class CrimesController < ApplicationController

  def index
    @school = School.find(params[:school_id])
    @crimes = @school.crimes
  end

  def murder
   CrimesHelper.crime_selector("murder")
   # murder_data = []
   #  puts top_10_murders = Crime.order(murder: :DESC, year: :DESC).limit(10)
   #  top_10_murders.each do |crime|
   #    murder_hash = Hash.new
   #    school_id = crime.school_id
   #    school_name = School.find(school_id).name
   #    school_crime_num = crime.murder
   #    murder_hash[school_name] = school_crime_num
   #    murder_data << murder_hash
   #  end
   #  puts murder_data
  end



end
