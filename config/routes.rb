Rails.application.routes.draw do
  namespace :admin do
    DashboardManifest::DASHBOARDS.each do |dashboard_resource|
      resources dashboard_resource
    end
    root controller: DashboardManifest::ROOT_DASHBOARD, action: :index
  end

  resources :vocab_worksheets
  resources :article_worksheets
  resources :verb_matching_games

  root to: 'visitors#index'
  devise_for :users
end
