module SchoolsHelper

  def murder_over_population(school_id)
    three_scores = []
    school = School.find(school_id)
    school.crimes.each do |year|
      three_scores << year.murder / school.population if school.population != 0
    end
    return three_scores.sum / 3
  end

  def total_crimes(crime_type, year)
    schools = School.all
    total_crimes = 0
    schools.each do |school|
      school.crimes.where(year: year).each do |crime|
        total_crimes += crime[crime_type]
      end
    end
    total_crimes
  end



  def get_status(school, year)
    crime_for_year = school.crimes.where(year: year)[0]
    sum = crime_for_year.murder + crime_for_year.manslaughter + crime_for_year.f_sex + crime_for_year.nf_sex + crime_for_year.robbery + crime_for_year.ag_assault + crime_for_year.burglary + crime_for_year.auto_theft + crime_for_year.arson
    # (sum / school.population.to_f) * 100
    sum
  end

  
end
