class UploadsController < ApplicationController
  before_action :authenticate_user!

  def index
    @uploads = current_user.uploads
  end

  def new
    @upload = Upload.new
  end

  def create
    upload = current_user.uploads.new(upload_params)

    if upload.save
      redirect_to uploads_path, notice: "File uploaded successfully"
    else
      flash.now[:alert] = upload.errors.full_messages.join(", ")
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @upload = Upload.find(params[:id])
    @upload.discard
    redirect_to uploads_path, notice: "File deleted successfully"
  end

  private

  def upload_params
    params.require(:upload).permit(:file_name, :description, :file)
  end
end 
