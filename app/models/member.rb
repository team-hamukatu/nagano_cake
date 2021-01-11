class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  enum is_active: {Available: true, Invalid: false}
    #有効会員はtrue、退会済み会員はfalse

    def active_for_authentication?
        super && (self.is_active === "Available")
    end
    #is_activeが有効の場合は有効会員(ログイン可能)
         
   has_many :cart_items, dependent: :destroy
end
