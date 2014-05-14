module ApplicationHelper
  def  menu
    proc do |primary|
      primary.dom_class = 'nav nav-tabs'
      
      primary.item :home_link, 'Home', root_path
      primary.item :projects_link, 'Projects', projects_path
      primary.item :categories_link, 'Categories', categories_path
      primary.item :indicators_link, 'Indicators', indicators_path
      
      primary.item :login_submenu_link, "Hello, #{current_user.first_name if current_user}!", '#', if: proc {current_user} do |subnav|
        subnav.item :logout_link, 'Log out', sessions_destroy_path
      end
    end
  end
end
