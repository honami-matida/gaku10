class Public::SearchesController < ApplicationController
  before_action :authenticate_customer!

  def search
    @word = params[:word]
    @model = params[:model]

    # 選択したモデルに応じて検索を実行
    if @model  == "customer"
      @records = Customer.search_for(@word)
    else
      @records = Post.search_for(@word)
    end
  end
end
