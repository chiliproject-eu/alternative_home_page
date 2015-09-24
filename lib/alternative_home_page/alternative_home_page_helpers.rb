module AlternativeHomePageHelpers

  module_function def initialize_alternative_home_page_from_settings!
    home_route = Rails.application.routes.named_routes.instance_variable_get('@routes')[:home]
    if Setting.plugin_alternative_home_page['enabled'] == '1'
      home_page_params = {
        :controller=>Setting.plugin_alternative_home_page['controller'],
        :action=>Setting.plugin_alternative_home_page['action']
      }
      Setting.plugin_alternative_home_page['params'].split(';').each do |param|
        k, v = param.split('=')
        home_page_params[k.to_sym] = v
      end
      if Setting.plugin_alternative_home_page['redirect'] != '1'
        home_route.instance_variable_set('@defaults', home_page_params)
      else
        home_route.instance_variable_set('@defaults', {:controller=>"welcome", :action=>"index"})
      end
    else
      home_route.instance_variable_set('@defaults', {:controller=>"welcome", :action=>"index"})
    end
  end

end
