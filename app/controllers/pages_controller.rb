class PagesController < ApplicationController
  def index
  end

  def home
  end

  def profile
    if (User.find_by_username(params[:id]))
      @username = params[:id]
    else
      redirect_to root_path, :notice=> "ERROR! User not Found!"

    end
  end

  def explore
  end
end
