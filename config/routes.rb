# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resource :upload, controller: :tab_upload, only: %i[new create show]
end
