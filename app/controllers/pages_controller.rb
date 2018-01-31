class PagesController < ApplicationController
  def index
    @users = User.all
  end

  def home
    @posts = Post.all
    @newPost = Post.new
  end

  def profile

    @friendships=Friendship.all

  @user1=User.find_by_username(params[:id])
    @username = params[:id]

@user4 = current_user
@user5 = User.find_by_username(params[:id])
# render json:@user4
# return

@friend_requests = @user4.requested_friends
@friendz = @user4.friends

  # @user4.remove_friend(@user5)



    if (@user1)

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

  def friendship_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end


  def sendrequest
    @user4 = current_user
    @user5 = User.find_by_username(params[:id])
    @user4.friend_request(@user5)
  end

  def removerequest
    @user4 = current_user
    @user5 = User.find_by_username(params[:id])
    @user4.remove_friend(@user5)
  end


  def acceptrequest

    @user4 = current_user
    @user5 = User.find_by_username(params[:id])
    @user4.accept_request(@user5)
    



  end

end
