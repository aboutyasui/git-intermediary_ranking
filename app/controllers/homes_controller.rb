class HomesController < ApplicationController
  def top
    same_rate = 0
    rank = 1

    #最低一回は評価されたことのあるtraderのデータを取得
    reviews = Review.group(:trader_id).order('avg(star) desc').pluck(:trader_id)
    traders = Trader.find(reviews)
    #一度も評価されたことがないtraderのデータを取得
    not_traders = Trader.where.not(id: Review.group(:trader_id).order('avg(star) desc').pluck(:trader_id))
    not_traders.each {|trader|  traders.push(trader)}

    traders = traders.map.with_index(1) do |trader, i|
      if i == 1 #ランキング処理の一番最初だけ以下の処理
        same_rate = trader.review_average #一番最初だけ「same_rate」に値が入っていないので、先に値を入れる
      end
      if trader.review_average != same_rate #同率順位がない場合以下の処理
        rank = i #同率が無いので、順位を更新
        same_rate = trader.review_average #「same_rate」に現在の値を代入 → 次の値と比べる用として運用するイメージ
        {trader: trader, index: rank } #[trader = trader]という配列と[index = rank]という配列それぞれをセットにしている
      else #同率順位がある場合以下の処理
        same_rate = trader.review_average
        {trader: trader, index: rank }
      end
    end

    @traders = Kaminari.paginate_array(traders).page(params[:page]).per(5)
    #Kaminari.paginate_array → pageメソッドを配列に対して用いる場合に必要な記述
    @clients = Client.page(params[:page]).per(5)
    @genres = Genre.all
  end

  def about
  end

end
