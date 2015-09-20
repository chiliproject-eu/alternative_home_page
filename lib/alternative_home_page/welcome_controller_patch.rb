require_dependency 'welcome_controller'

module WelcomeControllerPatch

  def self.included(base)
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)

    base.class_eval do
      before_filter :alternative_home_page, only: :index
    end
  end

  module ClassMethods
  end

  module InstanceMethods
    def alternative_home_page
      if Setting.plugin_alternative_home_page['enabled'] == '1' &&
          Setting.plugin_alternative_home_page['redirect'] == '1'

        home_page_params = {
          :controller=>Setting.plugin_alternative_home_page['controller'],
          :action=>Setting.plugin_alternative_home_page['action']
        }
        Setting.plugin_alternative_home_page['params'].split(';').each do |param|
          k, v = param.split('=')
          home_page_params[k.to_sym] = v
        end
        redirect_to home_page_params
      end
    end
  end

end

WelcomeController.send(:include, WelcomeControllerPatch)
