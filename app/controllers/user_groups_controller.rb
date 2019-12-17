class UserGroupsController < ApplicationController


  def create
    @user = current_user
    @group = Group.find(params[:group_id])
    current_user.groupsJoin(@group)
    
    flash[:success] = "参加しました"
    redirect_to groups_path
  end

  def destroy
    group = UserGroup.find(params[:id]).group
    current_user.groupsUnjoin(group)

    flash[:info]= "退出しました"
    redirect_to groups_path
  end
end
