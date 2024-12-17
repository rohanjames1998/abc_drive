class ShortenedUrlsController < ApplicationController
  def redirect
    @shortened_url = ShortenedUrl.find_by(unique_identifier: params[:id])
    redirect_to @shortened_url.full_url
  end
end
