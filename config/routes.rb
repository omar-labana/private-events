  
Rails.application.routes.draw do
  root to: 'events#index'
  delete 'attendances_from_creator/:user_id/:event_id', to: 'attendances#destroy', as: 'attendance_destroy'
  delete 'attendances_from_attendee/:user_id/:event_id', to: 'attendances#destroy_from_attendee', as: 'attendance_unattend'
  post 'attendances/:user_id/:event_id', to: 'attendances#create', as: 'create_attendance'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # resources :attendees, only: [:create, :destroy]
  resources :events
  get '/users/:id', to: 'users#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end