class RelationsController < ApplicationController
  before_action :authenticate_user!
  binding.pry
  respond_to :js

  def create
    #@user = User.find(params[:relationship][:followed_id])
    #current_user.follow!(@user)
    #respond_with @user
    @relation=current_user.follower_relations.build(relation_params)
    respond_to do |format|
      if @relation.save
        respind_with @relation
      else
        
      end
    end
  end
  
  def destroy

  end

  private
    def relation_params
      binding.pry
      params.require(:relation).permit(:followed_id)
    end
end
