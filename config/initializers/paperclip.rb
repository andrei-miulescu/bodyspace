# encoding: utf-8

require 'aws-sdk'
# Sets the paperclip options if there is a file available
# This will allow us to set s3 as part of the deploy so that the actaul code doesn't need to know about it

#Used for each image convert options
#IE8 requires images in RGB format - We must ensure colorspace is RGB, not CMYK
Paperclip::GLOBAL_IMAGE_CONVERT_OPTIONS = '-strip -colorspace RGB -quality 80'

found_file = %w(paperclip.s3.yml).find do |file|
  File.exists?(Rails.root.join 'config', file)
end

# Newco's cached_s3 & optimized paperclip storage - useful if reprocessing all images.
#require 'paperclip_storage'

# Allow us to sepcify the asset endpoint when setting the default_url
# on a given model.
Paperclip.interpolates :asset_endpoint do |attachment, style|
  host ||= Rails.configuration.action_controller.asset_host
end

if found_file
  configuration = YAML.load(ERB.new(File.read(Rails.root.join 'config', found_file)).result)

  config = configuration[Rails.env]
  raise "No environment configured for paperclip for RAILS_ENV=#{Rails.env}" unless configuration[Rails.env]

  config           = config.symbolize_keys
  config[:styles]  = config[:styles].symbolize_keys
  if config[:storage] == :s3 or config[:storage] == :cached_s3

    config[:s3_options]     = config[:s3_options].symbolize_keys if config[:s3_options]
    config[:s3_credentials] = config[:s3_credentials].symbolize_keys if config[:s3_credentials]
    config[:s3_permissions] = config[:s3_permissions].to_sym if config[:s3_permissions]

    #Forcibly set cache control for images being saved on S3
    config[:s3_headers]     = {'Cache-Control' => 'max-age=315576000', 'Expires' => 3.years.from_now.httpdate}

    # Associate a given id with one of our cloudfront aliases to have parallel image downloads.
    # Done with muliple CF names as this allows schemeless downloads in parallel using SSL is the scheme
    # Select a CF name based on the image instance id to facilitate browser caching.
    config[:s3_host_alias]  = Proc.new { |pca| config[:s3_host_aliases][pca.instance.id%config[:s3_host_aliases].length] } if config[:s3_host_aliases]

    #Initialize AWS
    AWS.config(:logger => Rails.logger)
    AWS.config(config[:s3_credentials])

    Paperclip::Attachment.default_options.merge!(config)

  elsif config[:storage] == :filesystem
    Paperclip::Attachment.default_options.merge!(config)
  end

  Paperclip.options[:log_command]= false
  Paperclip.options[:log]        = false
end
