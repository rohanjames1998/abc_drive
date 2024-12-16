class Upload < ApplicationRecord
  belongs_to :user
  has_one_attached :file

  validates :file_name, presence: true
  validates :file, presence: true
end
