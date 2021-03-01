class VolunteerEngagementsController < ApplicationController
  before_action :set_volunteer_engagement, only: [:show, :edit, :update]

  def index
    @volunteer_engagements = VolunteerEngagement.all
  end

  def show
  end

  def new
    @volunteer_engagement = VolunteerEngagement.new
  end

  def create
    @volunteer_engagement = VolunteerEngagement.new(volunteer_eng_params(:date, :volunteer_id, :nonprofit_id))
    @volunteer_engagement.save
    redirect_to volunteer_engagement_path(@volunteer_engagement)
  end

  def edit
  end

  def update
    @volunteer_engagement.update(volunteer_eng_params(:date, :volunteer_id, :nonprofit_id))
    redirect_to volunteer_engagement_path(@volunteer_engagement)
  end

  private 

  def set_volunteer_engagement
    @volunteer_engagement = VolunteerEngagement.find(params[:id])
  end

  def volunteer_eng_params(*args)
    params.require(:volunteer_engagement).permit(*args)
  end
end