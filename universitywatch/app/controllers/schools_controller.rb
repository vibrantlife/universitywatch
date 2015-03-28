class SchoolsController < ApplicationController
  def index
     @schools = School.all
  end

  def show
    @school = School.find(params[:id])
    @crimes = @school.crimes
    @crime_2011 = @crimes.where(year: 2011)[0]
    @crime_2012 = @crimes.where(year: 2012)[0]
    @crime_2013 = @crimes.where(year: 2013)[0]
  end

  def search_school
    school = School.where(school_params).first
    redirect_to school_path(school)
  end

  def state
    state = params[:state_name]
    @schools = School.where(state: state)
    render :json => @schools
  end

  def states
  end

  private

  def school_params
    params.require(:school).permit(:name)
  end

end
