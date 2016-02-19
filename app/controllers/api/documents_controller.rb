class Api::DocumentsController < ApplicationController
  def index
    @documents = Document.order(created_at: :desc)
    render json: @documents
  end
end
