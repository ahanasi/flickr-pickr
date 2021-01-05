require "pry"
class StaticPagesController < ApplicationController

  def home
    if params[:flickr_user_id]
      @results = Flickr.photos.search(user_id: params[:flickr_user_id], page: params[:page], per_page: 48)
    elsif params[:tag]
      @results = Flickr.photos.search(tags: params[:tag], page: params[:page], per_page: 48, min_upload_date: '2021-01-01')
    else
      @results = Flickr.photos.get_interesting(page: params[:page], per_page: 48)
    end
  end
end
