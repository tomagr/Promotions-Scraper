Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # root to: 'admin/entries#index'
  get 'scrape', to: 'scraper#scrape', as: 'scrape'

  get 'quest', to: 'quest#index', as: :quest

end
