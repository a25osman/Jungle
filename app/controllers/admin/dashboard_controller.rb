class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['BASIC_AUTH_USERNAME'], password: ENV['BASIC_AUTH_PASSWORD']
  def show
    @categories = Category.count
    @products = Product.count
  end
end
