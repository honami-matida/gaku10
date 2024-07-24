class Admin::GroupsController < ApplicationController
  
  def index
    @groups = Group.all.page(params[:page]).per(9)
  end

  def show
    @group = Group.find(params[:id])
    @owner = Customer.find(@group.owner_id)
    @group_approved = @group.group_requests.approved
  end
end
