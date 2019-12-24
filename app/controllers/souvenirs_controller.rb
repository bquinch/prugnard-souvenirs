class SouvenirsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :that_day]
  before_action :set_souvenir, only: %I[show edit update destroy]
  def index
    @souvenirs = Souvenir.all
  end

  def that_day
    @souvenirs = Souvenir.where('extract(day from created_at) = ?', Date.today.day).where('extract(month from created_at) = ?', Date.today.month)
  end

  def show
  end

  def new
    @souvenir = Souvenir.new
  end

  def create
    @souvenir = Souvenir.new(souvenir_params)
    @user = current_user
    @souvenir.user = @user
    if @souvenir.save
      redirect_to souvenir_path(@souvenir)
    else
      render :new
    end
  end

  def edit
    @user = current_user
  end

  def update
    if @souvenir.update(souvenir_params)
      redirect_to souvenir_path(@souvenir)
    else
      render :edit
    end
  end

  def destroy
    @souvenir.destroy
    redirect_to root_url, notice: 'Souvenir supprimé'
  end

  private

  def souvenir_params
    params.require(:souvenir).permit(:description, :title, :location, :photo)
  end

  def set_souvenir
    @souvenir = Souvenir.find(params[:id])
  end
end
