Rails.application.routes.draw do
	resources :articles
	root 'articles#index'
	get '/articles/:id/destroy', to: 'articles#destroy'
end
