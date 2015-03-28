class SchoolsController < ApplicationController
  def index
     @school = School.all
  end

  def show

  end

  def search_school
    # params[:school_acronym]

    school = School.where(acronym: params[:school_acronym]).first
    p school
    redirect_to school_crimes_path(school.id)
  end

  def state
    state = params[:state_name]
    @schools = School.where(state: state)
    render :json => @schools
  end

  def states
  end

end
