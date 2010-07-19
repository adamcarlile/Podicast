class Admin::ConfigurationsController < Admin::BaseController
  
  resource_controller :singleton
  
  private
  
    def object
      @object = Configuration.first
    end
  
end
