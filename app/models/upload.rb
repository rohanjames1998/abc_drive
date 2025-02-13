class Upload < ApplicationRecord
  include Discard::Model
  default_scope -> { kept }

  belongs_to :user
  has_one :shortened_url
  has_one_attached :file

  validates :file_name, presence: true
  validates :file, presence: true
  validate :validate_file_size

  def shortened_url
    super || create_default_shortened_url
  end

  private


  def validate_file_size
    if file.attached?
      if file.blob.byte_size > 100000
        errors.add(:file, 'size is too big')
      end
    end
  end

  def create_default_shortened_url
    return unless file.attached?

    full_url = Rails.application.routes.url_helpers.url_for(file)
    unique_identifier = Digest::MD5.hexdigest(full_url)
    create_shortened_url(full_url: full_url, unique_identifier: unique_identifier)
  end
end
