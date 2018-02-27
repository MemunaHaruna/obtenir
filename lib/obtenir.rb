require_relative "./obtenir/version"
require 'colorize'
require_relative './obtenir/api_request'
require_relative './obtenir/database'
require_relative './obtenir/file_operations'
require_relative './obtenir/application'
require_relative './obtenir/exit'

module Obtenir
  application = Application.new
  application.process
end
