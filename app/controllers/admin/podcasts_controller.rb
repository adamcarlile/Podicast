class Admin::PodcastsController < Admin::BaseController
  resource_controller
  
  before_filter :set_page_title
    
  create.response do |wants|
    wants.html { redirect_to admin_podcasts_path }
  end
  
  update.response do |wants|
    wants.html { redirect_to admin_podcasts_path }
  end
  
  private
  
  def set_page_title
    @page_title = "Podcast"
  end
  
  def collection
    @collection ||= end_of_association_chain.paginate :page => params[:page]
  end
  
end
