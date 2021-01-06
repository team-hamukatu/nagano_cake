class Admin::MembersController < ApplicationController
  
  def index
    @members = Member.page(params[:page]).reverse_order
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end
  
  def update
    member = Member.find(params[:id])
    member.update(member_params)
  end
  
  def member_params
    params.require(:member).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :postal_code, :street_address, :phone_number, :email, :is_active)
  end
end
