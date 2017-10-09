# encoding: utf-8

class CoverUploader < CarrierWave::Uploader::Base
include CarrierWave::MiniMagick

  storage :file
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  def default_url(args)
    ActionController::Base.helpers.asset_path([args].compact.join('_'))
  end
  
  def extension_white_list
     %w(jpg jpeg gif png)
  end
end
