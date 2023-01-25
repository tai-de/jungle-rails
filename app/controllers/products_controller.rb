class ProductsController < ApplicationController

  def index
    messages = ["WHERE YOU CAN FIND ANY PLANTS!", "IT GETS WORSE HERE EVERY DAY", "WE GOT EVERYTHING YOU WANT"]
    
    @message = messages.sample
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
  end

end
