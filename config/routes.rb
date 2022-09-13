# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  resource :upload, controller: :tab_upload, only: %i[new create show]
end
