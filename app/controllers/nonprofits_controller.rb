class NonprofitsController < ApplicationController
  before_action :set_nonprofit, only: [:show, :edit, :update]

  def index
    @nonprofits = Nonprofit.all
  end

  def show
  end

  def new
    @nonprofit = Nonprofit.new
  end

  def create
    @nonprofit = Nonprofit.new(nonprofit_params(:name, :city))
    @nonprofit.save
    redirect_to nonprofit_path(@nonprofit)
  end

  def edit
  end

  def update
    @nonprofit.update(nonprofit_params(:name, :city))
    redirect_to nonprofit_path(@nonprofit)
  end

  private 

  def set_nonprofit
    @nonprofit = Nonprofit.find(params[:id])
  end

  def nonprofit_params(*args)
    params.require(:nonprofit).permit(*args)
  end
end