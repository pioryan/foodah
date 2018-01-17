Rails.application.routes.draw do


  resources :dishes  do
    collection do
      post :import
    end
  end

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
      post :export
    end
  end

  root 'menus#index'
end
