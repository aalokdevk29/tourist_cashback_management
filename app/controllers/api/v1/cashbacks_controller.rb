class Api::V1::CashbacksController < ApplicationController

  before_action :authenticate_tourist!

  api :GET, '/cashbacks', 'Return cashback balance and history'
  header 'Authorization', 'Bearer token', required: true
  
  def index
    render json: current_tourist
  end

  
end