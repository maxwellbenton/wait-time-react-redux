class Api::V1::StoreCommentsController < ApplicationController
  before_action :set_store_comment, only: [:show, :update, :destroy]

  # GET /store_comments
  def index
    @store_comments = StoreComment.all

    render json: @store_comments
  end

  # GET /store_comments/1
  def show
    render json: @store_comment
  end

  # POST /store_comments
  def create
    @store_comment = StoreComment.new(store_comment_params)

    if @store_comment.save
      render json: @store_comment, status: :created, location: @store_comment
    else
      render json: @store_comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /store_comments/1
  def update
    if @store_comment.update(store_comment_params)
      render json: @store_comment
    else
      render json: @store_comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /store_comments/1
  def destroy
    @store_comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store_comment
      @store_comment = StoreComment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def store_comment_params
      params.require(:store_comment).permit(:store_id, :user_id, :wait_time_id, :comment_id)
    end
end
