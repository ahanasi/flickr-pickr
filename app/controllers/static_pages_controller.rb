require 'pry'
class StaticPagesController < ApplicationController
  def home
    @results = if params[:flickr_user_id]
                 fetch_by_user_id
               elsif params[:tag]
                 fetch_by_tag
               else
                 fetch_interesting
               end
  end

  def fetch_by_user_id
    @results = Flickr.photos.search(user_id: params[:flickr_user_id], page: params[:page], per_page: 48)
  end

  def fetch_by_tag
    @results = Flickr.photos.search(tags: params[:tag], page: params[:page], per_page: 48,
                                    min_upload_date: '2021-01-01')
  end

  def fetch_interesting
    @results = Flickr.photos.get_interesting(page: params[:page], per_page: 48)
  end
end