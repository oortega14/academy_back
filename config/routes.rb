Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  post '/login',    to: 'sessions#create'
  post '/logout',   to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged'
  resources :users, only: %i[create show update destroy] do
    collection do
      get :search
    end
  end
  resources :academy_categories, only: %i[index]
  resources :courses do
    member do
      get :subscribed
    end
  end
  resources :course_tests, only: %i[show update]
  resources :test_questions, only: %i[index create update destroy]
  resources :question_options, only: %i[index update]
  resources :exams, only: %i[index show create]
  resources :exam_answers, only: %i[update]
  resources :lessons
  resources :students, only: %i[index create destroy] do
    collection do
      get :my_courses
    end
  end
  resources :about_us_sections
  resources :academies, except: %i[destroy] do
    member do
      get :teachers
    end
  end
  resources :academy_contacts
end
