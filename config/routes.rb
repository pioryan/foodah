Rails.application.routes.draw do


  resources :dishes
  resources :menu_items  do
    collection do
      post :import
    end
  end

  resources :menu_pages  do
    collection do
      post :import
    end
  end

  resources :menus  do
    collection do
      post :import
    end
  end

  root 'menus#index'
end
