Rails.application.routes.draw do
  devise_for :users
  resources :basics
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 
  get 'basics/quotations'
  post 'basics/quotations'
  get  'basics/quotations/search', to: 'basics#search1'
  get "basics/exportXML", to: 'basics#exportXML'
  get "basics/exportJSON", to: 'basics#exportJSON'
  get "basics/destroy",to:  'basics#destroy'

  root 'basics#index'


end



