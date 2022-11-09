class ItemsController < ApplicationController
  def index
    @items = ItemServicer.items
  end

  def show
    @item = ItemServicer.item(params[:id])
    @merchant = MerchantServicer.merchant(@item.merchant_id)
  end

  def search
    @items = ItemServicer.search(params[:search])
  end
end
