class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process resize_to_limit: [270, 270]
  
  storage :file
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  def default_url(args)
    ActionController::Base.helpers.asset_path("default-ava/" + [args].compact.join('_'))
  end
  
  version :thumb do
    process :resize_to_fit => [150, 150]
  end
  
  version :thumb_small do
    process :resize_to_fit => [90, 90]
  end
  
  version :thumb_super_small do
    process :resize_to_fit => [60, 60]
  end
  
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
