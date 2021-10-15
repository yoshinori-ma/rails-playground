# frozen_string_literal: true

Rails.application.routes.draw do
  # resources :posts
  # resources :users
  resources :plans, param: :uuid, only: [] do
    resource :request, only: [:new, :show, :create] do
      collection do
        post :hoge, to: 'requests#create'
      end
    end
  end
end
