class MerchantsController < ApplicationController
  def index
    @merchants = MerchantServicer.merchants
  end

  def show
    @merchant = MerchantServicer.merchant(params[:id])
    @items = MerchantServicer.items(params[:id])
  end

  def search
    @merchants = MerchantServicer.search(params[:search])
  end
end
