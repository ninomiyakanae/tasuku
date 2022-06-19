require 'test_helper'
class Admin::RestaurantsController < ApplicationController
  before_action :if_not_admin
  before_action :set_restaurant, only: [:show, :edit, :destroy]

 # 中略
 

  private
  def if_not_admin
    redirect_to root_path unless current_user.admin?
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
