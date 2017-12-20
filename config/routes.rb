Rails.application.routes.draw do
  resources :details
  root 'details#index'
  get 'report' => 'details#get_report', as: :report 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
