class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :birth_day, presence: true

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :encrypted_password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります' }

  validates :family_name, :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]/ }

  validates :family_name_kana, :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/ }
  
end
