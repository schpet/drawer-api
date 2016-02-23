class Api::UsersController < ApplicationController
  before_action :authenticate_user

  def show
    render json: current_user, only: [:id, :handle]
  end

  private 
end
