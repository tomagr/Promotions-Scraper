Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'admin/entries#index'
  get 'scrape', to: 'scraper#scrape'
  get 'sample', to: 'scraper#sample'

end
