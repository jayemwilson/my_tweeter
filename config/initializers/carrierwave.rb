# require 'carrierwave/storage/abstract'
# require 'carrierwave/storage/file'
# require 'carrierwave/storage/fog'

# # CarrierWave.configure do |config|
# #   if Rails.env.production?
# #     config.fog_credentials = {
# #       :provider              => 'AWS',
# #       :aws_access_key_id     => "#{ENV['AWS_ACCESS_KEY_ID']}",
# #       :aws_secret_access_key => "#{ENV['AWS_SECRET_ACCESS_KEY']}",
# #       :region                => "#{ENV['S3_REGION']}",
# #       :path_style            => true
# #     }

# #     config.fog_directory =  "#{ENV['S3_BUCKET_NAME']}"
# #     config.cache_dir     = "#{Rails.root}/tmp/uploads"   # For Heroku
# #   else
# #     config.storage :file
# #     config.enable_processing = false if Rails.env.test?
# #   end                                          
# # end

# if Rails.env.production?
#   CarrierWave.configure do |config|
#     config.storage = :fog
#     config.fog_credentials = {
#       :provider               => 'AWS',                            # required
#       :aws_access_key_id      => ENV['AWS_ACCESS_KEY_ID'],         # required
#       :aws_secret_access_key  => ENV['AWS_SECRET_ACCESS_KEY'],
#       :region                 => ENV['S3_REGION'],                 # required
#     }
#     config.fog_directory  = ENV['S3_BUCKET_NAME']                  # required
#     config.fog_public     = true                                   # optional, defaults to true
#     config.root = Rails.root.join('tmp')
#     config.cache_dir = 'files'
#     config.permissions = 0777
#     config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
#   end
# else
#   CarrierWave.configure do |config|
#     config.storage :file
#   end
# end