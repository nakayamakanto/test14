class UsersController < ApplicationController
  def index
    @users=User.all
  end

  def show
    binding.pry
    @user=User.find(params[:id])
    @my_followers=@user.followers
    @my_followed_users=@user.followed_users
  end
end
