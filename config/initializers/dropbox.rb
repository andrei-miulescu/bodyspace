module Dropbox

  def self.dropbox_credentials
    YAML.load(File.open(Rails.root.join('config/dropbox.yml').to_path))[Rails.env]
  end

end