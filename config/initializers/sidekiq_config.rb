if Rails.env.production?
  Sidekiq.configure_server do |config|
    config.redis = { :url => 'redis://162.218.137.143:6379/1', :namespace => 'sidekiq' }
  end

  Sidekiq.configure_client do |config|
    config.redis = { :url => 'redis://162.218.137.143:6379/1', :namespace => 'sidekiq' }
  end
end