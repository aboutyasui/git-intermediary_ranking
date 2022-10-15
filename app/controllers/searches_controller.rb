class SearchesController < ApplicationController
  def index
    @range = params[:range]#検索モデル→params[:range]
    if @range == "Trader"
      @traders = Trader.looks(params[:search], params[:word])#検索方法→params[:search],検索ワード→params[:word]
    elsif @range == "Client"
      @clients = Client.looks(params[:search], params[:word])
    elsif @range == "Post"
      @posts = Post.looks(params[:search], params[:word])
    else
      @reviews = Review.looks(params[:search], params[:word])
    end
  end
end
##①下記コードにて検索フォームからの情報を受け取っています。
#検索モデル→params[:range],検索方法→params[:search],検索ワード→params[:word]
##②if文を使い、検索モデルで条件分岐させます。
#今回の対象は４つ
