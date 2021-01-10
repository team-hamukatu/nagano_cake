class Public::MembersController < ApplicationController
  def show
  end

  def edit
    @member = Member.find(current_member.id)
  end

  def update
    @member = Member.find(current_member.id)
    if @member.update(member_params)
      redirect_to members_my_page_path
    else
      render :edit
    end
  end

  def withdraw
    @member = Member.find(current_member.id)
    @member.update(is_active: "Invalid")
    reset_session
    redirect_to root_path
  end

  def check
    @member = Member.find(current_member.id)
  end

  private

  def member_params
    params.require(:member).permit(:email, :last_name, :first_name, :kana_first_name, :kana_last_name, :postal_code, :street_address, :phone_number)
  end
end
