class CrimesController < ApplicationController

  def index
  end

  def murder
   @crime_data = CrimesHelper.crime_selector("murder")
   p @top_murder_schools = @crime_data[0]
   p @top_murder_stats = @crime_data[1].join(', ')
   p @top_school_ids = @crime_data[2]
  end

  def manslaughter
    @crime_data = CrimesHelper.crime_selector("manslaughter")
    p @top_manslaughter_schools = @crime_data[0]
    p @top_manslaughter_stats = @crime_data[1].join(', ')
    @top_school_ids = @crime_data[2]
  end

  def sexualassaultforcible
    @crime_data = CrimesHelper.crime_selector("f_sex")
    p @top_f_sex_schools = @crime_data[0]
    p @top_f_sex_stats = @crime_data[1].join(', ')
    @top_school_ids = @crime_data[2]
  end

  def sexualassaultnonforcible
    @crime_data = CrimesHelper.crime_selector("nf_sex")
    p @top_nf_sex_schools = @crime_data[0]
    p @top_nf_sex_stats = @crime_data[1].join(', ')
    @top_school_ids = @crime_data[2]
  end

  def robbery
    @crime_data = CrimesHelper.crime_selector("robbery")
    p @top_robbery_schools = @crime_data[0]
    p @top_robbery_stats = @crime_data[1].join(', ')
    @top_school_ids = @crime_data[2]
  end

  def aggravated_assault
    @crime_data = CrimesHelper.crime_selector("ag_assault")
    p @top_ag_assault_schools = @crime_data[0]
    p @top_ag_assault_stats = @crime_data[1].join(', ')
    @top_school_ids = @crime_data[2]
  end

  def burglary
    @crime_data = CrimesHelper.crime_selector("burglary")
    p @top_burglary_schools = @crime_data[0]
    p @top_burglary_stats = @crime_data[1].join(', ')
    @top_school_ids = @crime_data[2]
  end

  def auto_theft
    @crime_data = CrimesHelper.crime_selector("auto_theft")
    p @top_auto_theft_schools = @crime_data[0]
    p @top_auto_theft_stats = @crime_data[1].join(', ')
    @top_school_ids = @crime_data[2]
  end

  def arson
    @crime_data = CrimesHelper.crime_selector("arson")
    p @top_arson_schools = @crime_data[0]
    p @top_arson_stats = @crime_data[1].join(', ')
    @top_school_ids = @crime_data[2]
  end

end
