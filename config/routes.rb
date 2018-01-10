# Rails.application.routes.draw do
#   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# end


Rails.application.routes.draw do
  # root 'twitters#index'
  root 'tops#index'
  
  resources :twitters do
    collection do
      post :confirm
    end
  end
 end