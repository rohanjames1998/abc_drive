class Upload < ApplicationRecord
  include Discard::Model
  default_scope -> { kept }

  belongs_to :user
  has_one_attached :file

  validates :file_name, presence: true
  validates :file, presence: true
end
