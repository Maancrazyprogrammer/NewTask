class User < ApplicationRecord
  has_many :payments
  has_many :reports
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :company

  enum role: { admin: 0, accountant: 1, employee: 2 }

end
