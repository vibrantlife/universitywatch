module CrimesHelper

  def self.crime_selector(crime_type)
    @crime_type_data = []
    @top_10_crime_type = Crime.order("year" => "DESC", "#{crime_type}" => "DESC").limit(10)
    school_ids = []

    @top_10_crime_type.each do |crime|
      @crime_type_hash = Hash.new
      school_id = crime.school_id
      school_ids << school_id
      @school_name = School.find(school_id).name
      @school_crime_num = crime[crime_type]
      @crime_type_hash[@school_name] = @school_crime_num
      @crime_type_data << @crime_type_hash
    end
      school_names = []
      crime_values = []
      @crime_type_data.each do |hash|
        school_names << hash.keys
        crime_values << hash.values
      end

      p school_ids
      @crime_data = [school_names.flatten!, crime_values.flatten!, school_ids.flatten]
      return @crime_data
  end



end
