class Api::V1::PlaysController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
  end

  def create
    binding.pry
  end
end