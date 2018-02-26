require_relative "./obtenir/version"
require 'colorize'
require_relative './obtenir/api_request'
require_relative './obtenir/database'
require_relative './obtenir/file_operations'
require_relative './obtenir/application'

module Obtenir
  application = Application.new
  application.get_username
end
