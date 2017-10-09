Rails.application.routes.draw do
  root 'scraper#index'

  get 'scrape', to: 'scraper#scrape'
  get 'list', to: 'scraper#list'

end
