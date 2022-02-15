class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_day, presence: true

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze}

  validates :family_name, :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }

  validates :family_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  
end
