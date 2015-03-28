class CrimesController < ApplicationController

  def index
    @school = School.find(params[:school_id])
    @crimes = @school.crimes
    p @school
    p @crimes
  end

end
