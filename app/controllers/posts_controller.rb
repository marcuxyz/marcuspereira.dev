class PostsController < ApplicationController
  before_action :post_params, only: %i[show]

  def index
    @posts = Post.published
  end

  def show
    not_found unless @post.published?
  end

  def search
    @posts = Post.filter_by_title(params[:q])

    render 'index'
  end

  private

  def post_params
    @post = Post.find(params[:id])
  end
end
