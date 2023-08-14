class PostsController < ApplicationController
  before_action :post_params, only: %i[show]

  def show
    return not_found unless @post.published?
  end

  private

  def post_params
    @post = Post.find(params[:id])
  end
end
