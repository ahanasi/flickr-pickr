require "pry"
class StaticPagesController < ApplicationController

  def home
    @results = Flickr.photos.search(tags: "puppies", page: params[:page], per_page: 12)
  end
end
