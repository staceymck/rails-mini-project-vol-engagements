class VolunteersController < ApplicationController
  before_action :set_volunteer, only: [:show, :edit, :update]

  def index
    @volunteers = Volunteer.all
  end

  def show
  end

  def new
    @volunteer = Volunteer.new
  end

  def create
    @volunteer = Volunteer.new(volunteer_params(:name))
    @volunteer.save
    redirect_to volunteer_path(@volunteer)
  end

  def edit
  end

  def update
    @volunteer.update(volunteer_params(:name))
    redirect_to volunteer_path(@volunteer)
  end

  private 

  def set_volunteer
    @volunteer = Volunteer.find(params[:id])
  end

  def volunteer_params(*args)
    params.require(:volunteer).permit(*args)
  end
end