module CrimesHelper

  def self.crime_selector(crime_type)
    crime_type_data = []
    top_10_crime_type = Crime.order("year" => "DESC", "#{crime_type}" => "DESC").limit(10)
    top_10_crime_type.each do |crime|
      crime_type_hash = Hash.new
      school_id = crime.school_id
      school_name = School.find(school_id).name
      school_crime_num = crime[crime_type]
      crime_type_hash[school_name] = school_crime_num
      crime_type_data << crime_type_hash
    end
    p top_10_crime_type
  end

end
