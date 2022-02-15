class ItemsController < ApplicationController
  def index
    @items = ItemServicer.items
  end

  def show
    @item = ItemServicer.item(params[:id])
  end
end
