Rails.application.routes.draw do
  unless Rails.env.development? || Rails.env.test? || ENV['AWS_ACCESS_KEY_ID']
    mount Shrine.uppy_s3_multipart(:video_file) => '/s3/multipart'
  end

  root 'home#show'

  # Auth
  get 'auth/auth0/callback' => 'auth0#callback'
  get 'auth/failure' => 'auth0#failure'
  get 'logout' => 'logout#logout'


  namespace 'api' do
    namespace 'v1' do
      get ':event/my_profile' => 'profiles#my_profile'
      resources :conferences, only: [:index, :show], path: 'events'
      resources :talks, only: [:index, :show, :update]
      resources :tracks, only: [:index, :show]
      resources :sponsors, only: [:index]
      resources :speakers, only: [:index, :show]
      resources :chat_messages, only: [:index, :create, :update]
      resources :booths, only: [:show]
      get 'tracks/:id/viewer_count' => 'tracks#viewer_count'
      namespace 'talks' do
        get ':id/video_registration' => 'video_registration#show'
        put ':id/video_registration' => 'video_registration#update'
      end
    end
  end

  scope ':event' do
    post 'auth/auth0' => redirect('/auth/auth0')

    # Admin
    get 'admin' => 'admin#show'
    get 'admin/debug' => 'admin#debug'
    get 'admin/chat' => 'admin#chat'
    get 'admin/accesslog' => 'admin#accesslog'
    get 'admin/users' => 'admin#users'
    get 'admin/statistics' => 'admin#statistics'
    get 'admin/export_statistics' => 'admin#export_statistics'
    delete 'admin/destroy_user' => 'admin#destroy_user'
    namespace :admin do
      resources :admin_profiles, only: [:edit, :update]
      resources :sponsors, only: [:index, :show, :edit, :update]
      resources :booths, only: [:index, :show]
      resources :conferences, only: [:index, :show, :edit, :update]
      resources :speakers, only: [:index, :edit, :update]
      get 'export_speakers' => 'speakers#export_speakers'
      get 'export_profiles' => 'profiles#export_profiles'
      resources :talks, only: [:index]
      resources :proposals, only: [:index]
      resources :videos, only: [:index]
      resources :timetables, only: [:index]
      resource :timetable, only: [:update]
      resources :announcements
      resources :speaker_announcements
      post 'publish_timetable' => 'timetables#publish'
      post 'close_timetable' => 'timetables#close'
      get 'preview_timetable' => 'timetables#preview'
      put 'talks' => 'talks#update_talks'
      post 'start_on_air' => 'talks#start_on_air'
      post 'stop_on_air' => 'talks#stop_on_air'
      post 'start_recording' => 'talks#start_recording'
      post 'stop_recording' => 'talks#stop_recording'
      put 'proposals' => 'proposals#update_proposals'
      resources :tracks, only: [:index]
      put 'tracks' => 'tracks#update_tracks'
      post 'update_offset' => 'tracks#update_offset'
      resources :attachments, only: [:show]
      get 'team' => 'teams#show'
      put 'team' => 'teams#update'

      resources :live_stream_ivs, only: [:index, :create]
      post 'bulk_create_ivs' => 'live_stream_ivs#bulk_create'
      post 'bulk_delete_ivs' => 'live_stream_ivs#bulk_delete'
      post 'bulk_create_media_live' => 'live_stream_media_live#bulk_create'
      post 'bulk_delete_media_live' => 'live_stream_media_live#bulk_delete'
      post 'bulk_create_media_package' => 'live_stream_media_package#bulk_create'
      post 'bulk_delete_media_package' => 'live_stream_media_package#bulk_delete'
      resources :harvest_jobs
    end

    get '/team' => 'teams#show'

    get '/speakers/entry' => 'speaker_dashboard/speakers#new'
    get '/speakers/guidance' => 'speaker_dashboard/speakers#guidance'
    resources :speakers, only: [:index, :show]
    get '/speaker_dashboard' => 'speaker_dashboards#show'
    namespace :speaker_dashboard do
      resources :speakers, only: [:new, :edit, :create, :update]
      resources :video_registrations, only: [:new, :create, :edit, :update]
    end

    namespace :sponsor_dashboards do
      get '/login' => 'sponsor_dashboards#login'
      get ':sponsor_id' => 'sponsor_dashboards#show'
      scope ':sponsor_id' do
        resources :sponsor_profiles, only: [:new, :edit, :create, :update]
        resources :speakers, only: [:new, :edit, :create, :update]
      end
    end

    resources :talks, only: [:show, :index]
    get 'timetables' => 'timetable#index'
    get 'timetables/:date' => 'timetable#index'
    get 'dashboard' => 'tracks#waiting'
    get 'tracks/blank' => 'tracks#blank'
    get 'kontest' => 'contents#kontest'
    get 'discussion' => 'contents#discussion'
    get 'hands-on' => 'contents#hands_on'
    get 'job-board' => 'contents#job_board'
    get 'o11y' => 'contents#o11y'

    resources :tracks, only: [:index, :show]
    get 'registration' => 'profiles#new'
    get '/' => 'event#show'
    get 'privacy' => 'event#privacy'
    get 'coc' => 'event#coc'

    resources :booths, only: [:index, :show]
    resources :attachments, only: [:show]

    # Profile
    resources :profiles, only: [:new, :edit, :update, :destroy, :create]
    namespace :profiles do
      post 'talks', to: 'talks#create'
    end
    get 'profiles/new', to: 'profiles#new'
    post 'profiles', to: 'profiles#create'
    post 'profiles/:id', to: 'profiles#edit'
    put 'profiles', to: 'profiles#update'
    delete 'profiles', to: 'profiles#destroy'
    get 'profiles', to: 'profiles#edit'
    get 'profiles/edit', to: 'profiles#edit'

    delete 'profiles/:id', to: 'profiles#destroy_id'
    put 'profiles/:id/role', to: 'profiles#set_role'
    resources :links, only: [:index]

    resources :orders, only: [:new, :create]
    resources :cancel_orders
  end

  mount AvatarUploader.upload_endpoint(:cache) => '/upload/avatar'
  get '*path', controller: 'application', action: 'render_404'
end
