class CrimesController < ApplicationController

  def index
  end

  def murder
   CrimesHelper.crime_selector("murder")
  end

  def manslaughter
    CrimesHelper.crime_selector("manslaughter")
  end

  def sexualassaultforcible
    CrimesHelper.crime_selector("f_sex")
  end

  def sexualassaultnonforcible
    CrimesHelper.crime_selector("nf_sex")
  end

  def robbery
    @crime_data = CrimesHelper.crime_selector("robbery")
    p @top_robbery_schools = @crime_data[0]
    p @top_robbery_stats = @crime_data[1].join(', ')
  end

  def aggravated_assault
    CrimesHelper.crime_selector("ag_assault")
  end

  def burglary
    CrimesHelper.crime_selector("burglary")
  end

  def auto_theft
    CrimesHelper.crime_selector("auto_theft")
  end

  def arson
    CrimesHelper.crime_selector("arson")
  end

end
