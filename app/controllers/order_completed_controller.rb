class OrderCompletedController < ApplicationController
  def show
    # 必要なデータを準備するロジックをここに追加
    # 例えば、注文の詳細情報など
  end

  def create
    # 注文の作成処理
    @order = Order.new(order_params)
    if @order.save
      # 注文が成功した場合は、完了ページにリダイレクト
      redirect_to order_completed_path
    else
      # 注文が失敗した場合は、エラーメッセージを表示
      render :new
    end
  end

  private

  def order_params
    # ストロングパラメータの設定
    params.require(:order).permit(:product_id, :quantity, :address, :payment_method)
  end
end