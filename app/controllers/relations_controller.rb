class RelationsController < ApplicationController
  before_action :authenticate_user!
  #binding.pry
  respond_to :js

  def create
    #@user = User.find(params[:relationship][:followed_id])
    #current_user.follow!(@user)
    #respond_with @user
    @relation=current_user.follower_relations.build(relation_params)
    if @relation.save
      respond_with @relation
    else
        
    end
  end
  
  def destroy
    @relation=Relation.find(params[:id])
    followed_id=@relation.followed_id
    if @relation.destroy
      @new_relation=current_user.follower_relations.build(followed_id: followed_id)
      respond_with @new_relation
    end
  end

  private
    def relation_params
      #binding.pry
      params.require(:relation).permit(:followed_id)
    end
end
