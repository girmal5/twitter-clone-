class PagesController < ApplicationController
  def index
  end

  def home
    @posts = Post.all
    @newPost = Post.new
  end

  def profile
    if (User.find_by_username(params[:id]))
      @username = params[:id]
    else
      redirect_to root_path, :notice=> "ERROR! User not Found!"

    end
    @posts = Post.all.where("user_id = ?", User.find_by_username(params[:id])) #shows only each users posts when clicked on profile
    @newPost = Post.new
    @toFollow = User.all
  end

  def explore
    @posts = Post.all
    @newPost = Post.new
  end
end
