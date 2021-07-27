class Api::V1::CashbacksController < ApplicationController

  def index
    render json: Tourist.first
  end

  
end