Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # root to: 'admin/entries#index'
  root to: 'quest#index'


  get 'scrape', to: 'scraper#scrape', as: 'scrape'

  post 'quest', to: 'quest#validate', as: :post_quest

end
