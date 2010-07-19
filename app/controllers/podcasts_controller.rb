class PodcastsController < ApplicationController
  resource_controller
  
  index do
    wants.html
    wants.rss { @all_podcasts = Podcast.all }
  end
  
  private
  
  def set_title
    @page_title = "Podcasts"
  end
  
  def collection
    @collection ||= end_of_association_chain.paginate :page => params[:page]
  end
  
end
