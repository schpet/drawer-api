class Api::DocumentsController < ApplicationController
  before_action :authenticate_user, except: :show

  def index
    @documents = policy_scope(Document.order(created_at: :desc))

    render json: @documents
  end

  def create
    @document = Document.new(s3_bucket: S3_BUCKET.name, user: current_user)
    @document.assign_attributes(permitted_attributes(@document))

    authorize(@document)

    @document.save!

    render json: @document
  end

  def show
    @document = Document.find(params[:id])
    authorize(@document)

    render json: @document
  end
end
