class AuthConstraint
  def matches?(request)
    request.session[:user_type].present?
  end
end

Rails.application.routes.draw do
  namespace :admin do
    resources :student_actions
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
    resources :teachers do
      post '/reset_password', to: 'teachers#reset_password'
    end
    post '/load_students', to: 'students#load_students'
    get '/download_students', to: 'students#download_students'
    root :to => "dashboard#index"
  end

  namespace :teachers do
    get '/csv_actions', to: "student_actions#csv"
    get '/reports', to: "reports#index"
    resources :students do
      resources :core_values, only: [:show]
    end
    get '/scholar_hours/completed', to: 'scholar_hours#completed'
    resources :scholar_hours do 
      post '/complete', to: 'scholar_hours#complete'
    end
    get '/procedure_practices/completed', to: 'procedure_practices#completed'
    resources :procedure_practices do 
      post '/complete', to: 'procedure_practices#complete'
    end
    resources :courses do
      resources :student_actions
      get '/liveclass', to: 'live#classroom'
      post '/liveclass', to: 'live#update'
      get '/roster', to: 'courses#roster'
    end
    get '/view_student', to: "students#view_student"
    root :to => "dashboard#index"
    resources :teachers, only: [:index, :edit, :update]
  end

  namespace :guardians do
    resources :students, only: [:show] do
      get '/scholar_hours', to: 'scholar_hours#index'
      get '/procedure_practices', to: 'procedure_practices#index'
      resources :swot_reports, only: [:index, :show, :new, :create]
    end
    get '/students/:id/behavior', to: 'students#behavior', as: "student_behavior"
    get '/view_student', to: "students#view_student"
    root :to => "dashboard#index"
  end  


  namespace :students do
    resources :core_values, only: [:show]
    resources :scholar_hours, only: [:index, :show]
    resources :procedure_practices, only: [:index, :show]
    root :to => "dashboard#index"
  end

  post '/login',      to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'
  root :to      => 'home#go_to_dashboard', as: :dashboard_root, :constraints => AuthConstraint.new
  root :to      => 'home#index'
end
