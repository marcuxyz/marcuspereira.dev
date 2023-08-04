class HomeController < ApplicationController
  def index
    @posts = Post.includes(:category).published.order('created_at DESC').limit(6)
  end
end
