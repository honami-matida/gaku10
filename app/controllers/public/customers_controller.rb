class Public::CustomersController < ApplicationController
  before_action :ensure_guest_customer, only: [:edit]

  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @current_customer.update(customer_params)
      redirect_to profile_customer_path, notice: "保存しました"
    else
      flash.now[:alert] = "保存できません"
      render :edit
    end
  end

  def unsubscribe
    #会員の退会登録画面
  end

  def withdraw
    #会員の退会処理(ステータスの更新)
    @customer = Customer.find(current_customer.id)
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to new_customer_registration_path
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :introduction, :profile_image)
  end

  def ensure_guest_customer
    @customer = Customer.find(params[:id])
    if @customer.guest_customer?
      redirect_to public_customer_path(current_customer) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end
end
