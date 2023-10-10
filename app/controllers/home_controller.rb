class HomeController < ApplicationController
  def index
    @posts = Post.includes(:category).published.order('created_at DESC').limit(8)
  end

  def search
    @posts = Post.filter_by_title(params[:q])

    render 'index'
  end
end
