class ProductsController < ApplicationController

  def search
    #@product_name = Product.get_product_name_from_url(params[:url_query])
    @product_name = params[:product_name]
    @market = params[:market]

    unless @product_name.present?
      flash[:error] = 'Please provide product description'
      redirect_to '/' and return
    end
    @prices = Product.search_by(@product_name, @market)
  end

  def profitability
    unless params[:product_price_amount].present?
      flash[:error] = 'Please provide product price amount'
      redirect_to '/' and return
    end
    @profit_margin = params[:profit_margin]
    @price = Profitability.calculate_profitability(params[:product_price_amount].to_d,
      params[:listing_fee].to_d,
      params[:profit_margin].to_d)
  end
end
