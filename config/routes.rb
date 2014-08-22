class AuthConstraint
  def matches?(request)
    request.session[:user_type].present?
  end
end

Rails.application.routes.draw do
  resources :core_values
  resources :guardianships
  resources :enrollments
  resources :courses

  namespace :admin do
    resources :students
    resources :guardians
    resources :teachers
    root :to => "dashboard#index"
  end

  namespace :teachers do
    root :to => "dashboard#index"
  end

  namespace :guardians do
    root :to => "dashboard#index"
  end  

  namespace :students do
    root :to => "dashboard#index"
  end


  get '/login',       to: 'sessions#new'
  post '/login',      to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'
  root :to      => 'home#go_to_dashboard', as: :dashboard_root, :constraints => AuthConstraint.new
  root :to      => 'home#index'
end
