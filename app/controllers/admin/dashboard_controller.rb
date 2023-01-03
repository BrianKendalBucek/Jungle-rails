class Admin::DashboardController < ApplicationController

  before_action :authenticate

  def show
    @product_count = Product.count 
    @category_count = Category.count
  end
end
