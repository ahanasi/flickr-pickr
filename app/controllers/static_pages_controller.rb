require "pry"
class StaticPagesController < ApplicationController

  def home
    @flickr = Flickr.new
    @list   = @flickr.photos.search(tags: "puppies")
  end
end
