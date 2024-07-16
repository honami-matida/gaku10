class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
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
    params.require(:customer).permit(:name, :email, :introduction)
  end
end
