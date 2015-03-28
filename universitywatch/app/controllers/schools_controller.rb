class SchoolsController < ApplicationController
  def index
     @schools = School.all
  end

  def show
    @school = School.find(params[:id])
    @crimes = @school.crimes
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
