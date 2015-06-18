Rails.application.routes.draw do
   get 'personal_page/index'
   get 'fun_page/index'
   get 'short_movies/show'
   root 'build_page#index'
end
