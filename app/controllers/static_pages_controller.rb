class StaticPagesController < ApplicationController
  def home
    @news = Post.all(limit: 3)
  end
end
