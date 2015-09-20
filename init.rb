Redmine::Plugin.register :alternative_home_page do
  name 'Alternative Home Page'
  author 'ChiliProject.eu'
  description 'Allows to set alternative page (like project wiki) instead of the default welcome index page'
  version '0.0.1'
  url 'http://www.chiliproject.eu/projects/chiliproject-eu/wiki/Alternative_Home_Page_Plugin'
  author_url 'http://www.chiliproject.eu'

  settings default: { 'enabled' => '0', 'params' => '' }, partial: 'settings/alternative_home_page'
end

ActionDispatch::Callbacks.to_prepare do
  require_dependency 'alternative_home_page/welcome_controller_patch'
  require_dependency 'alternative_home_page/settings_controller_patch'
  require_dependency 'alternative_home_page/alternative_home_page_helpers'
end
