class StaticPagesController < ApplicationController

  def home
    if current_user
      redirect_to posts_path
    else
      render 'static_pages/home'
    end
  end
end