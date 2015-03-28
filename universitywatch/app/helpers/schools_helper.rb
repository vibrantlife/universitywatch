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

  def get_status(crime_type, school, year)
    number = school.crimes.where(year: year)[0][crime_type]
    number / school.population
  end

end
