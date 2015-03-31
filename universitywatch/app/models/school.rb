class School < ActiveRecord::Base
    include PgSearch
    has_one :geoinfo
    has_many :crimes
    pg_search_scope :search_by_school_info,
    :against => [
      [:name, "A"],
      [:city, "B"]
    ],
    :using => {
      :tsearch => {:prefix => true},
    }


    self.per_page = 10

    def forced_2013_sexual_assault
      self.crimes.where(year: 2013)[0][:f_sex]
    end

end
