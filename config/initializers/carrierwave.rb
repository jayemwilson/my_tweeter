require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  if Rails.env.production?
    config.fog_credentials = {
      :provider              => 'AWS',
      :aws_access_key_id     => "#{ENV['AWS_ACCESS_KEY_ID']}",
      :aws_secret_access_key => "#{ENV['AWS_SECRET_ACCESS_KEY']}",
      :region                => "#{ENV['S3_REGION']}",
      :path_style            => true
    }

    config.fog_directory =  "#{ENV['S3_BUCKET_NAME']}"
    config.cache_dir     = "#{Rails.root}/tmp/uploads"   # For Heroku
  else
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end                                          
end