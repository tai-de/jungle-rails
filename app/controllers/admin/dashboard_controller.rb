class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV["BASIC_AUTH_USER"], password: ENV["BASIC_AUTH_PASS"]

  def show
    @product_count = Product.count
    @category_count = Category.count
  end
end
