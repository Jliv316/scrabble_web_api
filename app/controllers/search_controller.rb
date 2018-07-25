class SearchController < ApplicationController
  def index
    @sentences = SentenceService.new(params[:word]).sentences
  end
end