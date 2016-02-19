class DrawerController < ApplicationController
  def index
    render json: { message: "whats up!" }
  end
end
