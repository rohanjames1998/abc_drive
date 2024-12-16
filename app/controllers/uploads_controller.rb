class UploadsController < ApplicationController
  before_action :authenticate_user!

  def index
    @uploads = current_user.uploads
  end

  def new
    @upload = Upload.new
  end

  def create
    service = Uploads::Create.call(upload_params, current_user)

    if service.success?
      flash[:notice] = "File uploaded successfully"
      redirect_to uploads_path
    else
      flash.now[:alert] = service.errors.full_messages.join(", ")
      render :new, status: :unprocessable_entity
    end
  end

  private

  def upload_params
    params.require(:upload).permit(:file_name, :description, :file)
  end
end 
