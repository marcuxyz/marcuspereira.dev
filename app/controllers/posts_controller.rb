class PostsController < ApplicationController
  before_action :post_params, only: %i[show]

  def index
    @posts = Post.all
  end

  def show
    not_found unless @post.published?
  end

  private

  def post_params
    @post = Post.find(params[:id])
  end
end
