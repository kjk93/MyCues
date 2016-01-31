if Rails.env.production?
	CarrierWave.configure do |config|
	  config.fog_provider = 'fog/aws'                        # required
	  config.fog_credentials = {
	    provider:              'AWS',
	    aws_access_key_id:     ENV['S3_ACCESS_KEY'],                        
	    aws_secret_access_key: ENV['S3_SECRET_KEY'],                        
	  }
	  #need to fix
	  config.fog_directory  = ENV['S3_BUCKET']
	end
end

#ENV['S3_ACCESS_KEY']
#ENV['S3_SECRET_KEY']
#ENV['S3_BUCKET']