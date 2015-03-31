class CrimesController < ApplicationController

  def index
    @school = School.find(params[:school_id])
    @crimes = @school.crimes
  end

  def murder
    murder_data = []
    puts top_10_murders = Crime.order("murder DESC").limit(10)
    top_10_murders.each do |crime|
      murder_hash = Hash.new
      school_id = crime.school_id
      school_name = School.find(school_id).name
      school_crime_num = crime.murder
      murder_hash[school_name] = school_crime_num
      murder_data << murder_hash
    end
    puts "----------------"
    p murder_data
  end
    #top_10_murders = Crime.order("f_sex DESC").limit(10) -- finds top 10
    # School.find(8344).name -- finds school name


# def crime_helper(crime, school_id)
#   top_10_crimes = Crime.order("#{crime} DESC").limit(10)
#   top_10_crimes. each do |school_id|

# end

end
