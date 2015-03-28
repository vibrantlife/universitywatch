class CrimesController < ApplicationController

  def index
    @school = School.find(params[:school_id])
    p @school
    @crimes = @school.crimes
    p @crimes
  end

end
