class PodcastsController < ApplicationController
  resource_controller
  
  index do
    wants.html
    wants.rss
  end
  
end
