# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

# if settings table is not present migrations are pending or running
if ActiveRecord::Base.connection.table_exists? 'settings'
  AlternativeHomePageHelpers.initialize_alternative_home_page_from_settings!
end
