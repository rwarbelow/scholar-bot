class AuthConstraint
  def matches?(request)
    request.session[:user_type].present?
  end
end

Rails.application.routes.draw do

  namespace :admin do
    resources :enrollments
    resources :guardianships
    resources :students do
      post '/assign_courses', to: 'students#assign_courses'
      post '/reset_password', to: 'students#reset_password'
    end
    resources :core_values
    resources :courses do
      post '/assign_students', to: 'courses#assign_students'
    end
    resources :guardians
    resources :teachers
    post '/load_students', to: 'students#load_students'
    get '/download_students', to: 'students#download_students'
    root :to => "dashboard#index"
  end

  namespace :teachers do
    resources :students
    resources :courses do
      get '/liveclass', to: 'live#classroom'
      post '/liveclass', to: 'live#update'
    end
    get '/view_student', to: "students#view_student"
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
