class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!

  def search
    @word = params[:word]
    @model = params[:model]

    # 選択したモデルに応じて検索を実行
    if @model  == "customer"
      @records = Customer.search_for(@word).page(params[:page]).per(9)
    else
      @records = Post.search_for(@word).page(params[:page]).per(9)
    end
  end
end
