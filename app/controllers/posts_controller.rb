class PostsController < ApplicationController
  before_action :post_params, only: [:create, :update]
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    render json: { post: @post.to_json, status: 200}
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      render json: { message: "Post saved successfully ", status: 200}
    else
      render json: { message: "Post not save", status: 500}
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      render json: { message: "Post updated successfully ", status: 200}
    else
      render json: { message: "Post not save", status: 500}
    end
  end

  def destroy
    post = Post.find_by(id: params[:id])
    unless post.blank?
      post.destroy
      render json: { message: "Post destroyed", status: 200}
    else
      render json: { message: "Post Not found", status: 400}
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :description, :is_active, :published_date)
  end
end
