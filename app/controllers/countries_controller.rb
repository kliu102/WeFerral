class CountriesController < ApplicationController
  before_action :set_country, only: [:show]

  def show
    render json: @country
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_country
    @country = Country.includes(:states).find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def country_params
    params.require(:country).permit(:id)
  end
end
