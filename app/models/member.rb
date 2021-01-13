class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :orders, dependent: :destroy
  has_many :shipping_addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :email, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :kana_last_name, presence: true
  validates :kana_first_name, presence: true
  validates :postal_code, presence: true
  validates :street_address, presence: true
  validates :phone_number, presence: true
  

  enum is_active: {Available: true, Invalid: false}
    #有効会員はtrue、退会済み会員はfalse

    def active_for_authentication?
        super && (self.is_active === "Available")
    end
    #is_activeが有効の場合は有効会員(ログイン可能)

end
