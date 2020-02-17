# frozen_string_literal: true

Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  resources :sessions, only: %i[new destroy create]
  resources :shows, only: %i[index] do
    get :search, on: :collection
    get :favorites, on: :collection
    post :add_to_favorite, on: :member
    post :remove_to_favorite, on: :member
  end
  root 'shows#index'
end
