class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :uploads

  validates :email, presence:true, uniqueness: {case_sensitivity: false}, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i}
  validates :name, presence: true
end
