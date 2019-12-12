class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end


  def new
    @group = Group.new

  end

  def create
    @group = Group.new(group_params)
    @group.owner = current_user#グループを作成した人が管理者になる
    if @group.save
      redirect_to groups_path,notice: "コミュニティを作成しました"
    else
      render.new
    end
  end

  def update

  end

  def destroy
    @group = Group.find(parmas[:id])
    @group.destroy
    redirect_to root, notice: "グループを削除しました"
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end

end
