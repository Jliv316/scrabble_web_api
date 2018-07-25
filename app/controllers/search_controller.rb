class SearchController < ApplicationController
  def index
    binding.pry
    @sentences = Word.new(params[:word]).sentences
  end
end