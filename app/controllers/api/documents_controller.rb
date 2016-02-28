class Api::DocumentsController < ApplicationController
  before_action :authenticate_user

  def index
    @documents = policy_scope(Document.order(created_at: :desc))

    render json: @documents
  end

  def create
    @document = Document.new(s3_bucket: S3_BUCKET.name,
                             user: current_user)
    @document.assign_attributes(permitted_attributes(@document))

    authorize(@document)

    @document.save!

    render json: @document
  end
end
