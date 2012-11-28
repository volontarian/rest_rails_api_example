ArticleImporter::Application.routes.draw do
  resources :articles, only: [:index, :show]
  
  namespace :api, defaults: { format: 'json' } do
    scope module: :v1 do
      resources :articles
    end
  end
  
  root to: 'articles#index'
end
