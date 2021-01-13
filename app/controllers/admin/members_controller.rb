class Admin::MembersController < ApplicationController
  

  def index
    @members = Member.page(params[:page]).per(10)
  end

  def show
    @member = Member.find(params[:id])
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    @member.update(member_params)
    redirect_to admin_member_path(@member)
  end

  def member_params
    params.require(:member).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :postal_code, :street_address, :phone_number, :email, :is_active)
  end
end
