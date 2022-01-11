class Admin::DashboardController < ApplicationController
  def show
    @categories = Category.count
    @products = Product.count
  end
end
