class Admin::HomesController < ApplicationController

  def top
    @items = Item.page(params[:page]).per(10)
  end

end
