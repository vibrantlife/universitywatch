class School < ActiveRecord::Base
    include PgSearch
    has_many :crimes
    pg_search_scope :search_by_school_info,
    :against => [
      [:name, "A"],
      [:city, "B"]
    ],
    :using => {
      :tsearch => {:prefix => true},
    }


end
