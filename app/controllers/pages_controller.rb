class PagesController < ApplicationController
  def index
  end

  def home
    @posts = Post.all
    @newPost = Post.new
  end

  def profile
  @user1=User.find_by_username(params[:id])
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




        #
        #     def create
        #   @friendship = current_user.friendships.build(:friend_id => params([:friend_id]))
        #   if @friendship.save
        #     flash[:notice] = "Added friend."
        #     redirect_to root_url
        #   else
        #     flash[:error] = "Unable to add friend."
        #     redirect_to root_url
        #   end
        # end
        #
        #     def destroy
        #       @friendship = current_user.friendships.find(params[:id])
        #       @friendship.destroy
        #       flash[:notice] = "Removed friendship."
        #       redirect_to current_user
        #     end
        #
        #
        #      def friendship_params
        #         params.require(:friendship).permit(:user_id, :friend_id)
        #       end
end
