Rails.application.routes.draw do


  root 'menus#index'
  resources :menus  do
    collection do
      post :import
    end
  end


end
