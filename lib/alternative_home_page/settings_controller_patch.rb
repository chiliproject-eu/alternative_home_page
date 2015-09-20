require_dependency 'settings_controller'

module SettingsControllerPatch

  def self.included(base)
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)
    
    base.class_eval do
      def plugin_with_alternative_home_page
        plugin_without_alternative_home_page
        if request.post? && params[:id] == 'alternative_home_page'
          AlternativeHomePageHelpers.initialize_alternative_home_page_from_settings!
        end
      end
      alias_method_chain :plugin, :alternative_home_page
    end
  end

  module ClassMethods
  end

  module InstanceMethods
  end    

end

SettingsController.send(:include, SettingsControllerPatch)
