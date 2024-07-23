class Public::GroupsController < ApplicationController
  before_action :authenticate_customer!
  before_action :ensure_correct_customer, only: [:edit, :update]

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_customer.id #ログインしている会員がオーナーとする
    if @group.save
      redirect_to public_group_path(@group), notice: "グループを作成しました。"
    else
      flash.now[:alert] = @group.errors.full_messages.join(", ")
      #flash.now[:alert] = "作成できません"
      render 'new'
    end
  end

  def index
    @groups = Group.all.page(params[:page]).per(9)
    @customer = Customer.find(current_customer.id)
  end

  def show
    @group = Group.find(params[:id])
    @customer = Customer.find(params[:id])
    @owner = Customer.find(@group.owner_id)
    @group_request = @group.group_requests.find_by(customer: current_customer)
    @group_requests = @group.group_requests.page(params[:page]).per(9)
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to public_group_path(@group)
    else
      render "edit"
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :introduction, :group_image, :genre_id)
  end

  def ensure_correct_customer
    @group = Group.find(params[:id])
    unless @group.owner_id == current_customer.id
      redirect_to groups_path
    end
  end

end
