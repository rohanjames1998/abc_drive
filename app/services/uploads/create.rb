module Uploads
  class Create < ApplicationService
    attr_reader :file_name, :description, :file, :current_user
    prepend SimpleCommand

    def initialize(params, current_user)
      @file_name = params[:file_name]
      @description = params[:description]
      @file = params[:file]
      @current_user = current_user
    end

    def call
      return add_error("File is required") if file.blank?
      return add_error("File name is required") if file_name.blank?

      create_upload
    end

    private

    def create_upload
      upload = Upload.new(
        file_name: file_name,
        description: description,
        user: current_user
      )

      attach_compressed_file(upload)

      if upload.save!
        upload
      else
        add_error(upload.errors.full_messages)
      end
    end

    def attach_compressed_file(upload)
      compressed_file = compress_file
      return unless compressed_file

      upload.file.attach(
        io: compressed_file,
        filename: "#{file_name}.gz",
        content_type: file.content_type
      )
    end

    def compress_file
      # Creating a temp file to store the compressed file
      begin
        Tempfile.new(ActiveSupport::Gzip.compress(file))
      rescue => e
        add_error("Failed to compress file: #{e.message}")
      end
    end

    def add_error(message)
      errors.add(:base, message)
    end
  end
end
