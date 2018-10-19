Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'scraper#index'

  get 'scrape', to: 'scraper#scrape'
  get 'list', to: 'scraper#list'

end
