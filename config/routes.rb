Rails.application.routes.draw do
  #devise_for :users
  root 'scraper#index'

  get 'scrape', to: 'scraper#scrape'
  get 'list', to: 'scraper#list'

end
