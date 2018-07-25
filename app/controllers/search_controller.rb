class SearchController < ApplicationController
  def index
    @sorted_stations = Nrel.new(params[:q]).stations
  end
end