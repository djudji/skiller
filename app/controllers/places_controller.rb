class PlacesController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  def index
    @places = current_user.places
  end

  def show
  end

  def new
    @place = current_user.places.new
  end

  def edit
  end

  def create
    @place = current_user.places.new(place_params)

    respond_to do |format|
      if @place.save
        format.html { redirect_to @place, notice: 'Place was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @place.update(place_params)
        format.html { redirect_to @place, notice: 'Place was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @place.destroy
    respond_to do |format|
      format.html { redirect_to places_url, notice: 'Place was successfully destroyed.' }
    end
  end

  private

  def set_place
    @place = current_user.places.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :address, :description, :phone, :website)
  end
end
