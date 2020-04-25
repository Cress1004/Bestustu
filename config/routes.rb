Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  #students
  resources :students
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'

  get 'pages/:id', to: 'pages#show', as: :show_user_info

  # Routes for devise
  devise_for :users, skip: [:sessions,:registrations],
                       controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  devise_scope :user do
    # sessions
    get    'sign_in',  to: 'devise/sessions#new',     as: :new_user_session
    post   'sign_in',  to: 'devise/sessions#create',  as: :user_session
    delete 'sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
    # registrations
    put    '/account',  to: 'devise/registrations#update'
    delete '/account',  to: 'devise/registrations#destroy'
    post   '/account',  to: 'devise/registrations#create'
    get    '/sign_up', to: 'devise/registrations#new',    as: :new_user_registration
    get    '/account',  to: 'devise/registrations#edit',   as: :edit_user_registration
    patch  '/account',  to: 'devise/registrations#update', as: :user_registration
    get    '/account/cancel', to: 'devise/registrations#cancel', as: :cancel_user_registration# passwords
    # passwords
    # get   'new-pass',  to: 'devise/passwords#new',    as: :new_user_password
    # get   'edit-pass', to: 'devise/passwords#edit',   as: :edit_user_password
    # patch 'edit-pass', to: 'devise/passwords#update', as: :user_password
    # post  'new-pass',  to: 'devise/passwords#create', as: :user_password

  end
  #Route for tutors
  resources :tutors

  # Routes for class_registers
  resources :class_registers
  patch 'class_registers/:id/register',to: 'class_registers#register', as: :register
  get 'class_registers/:id/tutors',to: 'class_registers#select_tutors', as: :select_tutors
  get 'class_registers/:id/tutor_selected',to: 'class_registers#tutor_selected', as: :tutor_selected
  # Route for show bpoint of user
  get 'bpoint_show', to: 'pages#bpoint_page'
  # Route for message
  resources :messages, only: [:show,:destroy]
end
