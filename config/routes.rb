Rails.application.routes.draw do
  root 'scraper#index'

  get 'scraper/scrape_site'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
