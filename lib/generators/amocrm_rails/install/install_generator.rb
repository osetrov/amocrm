# frozen_string_literal: true
#
module AmocrmRails
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('templates', __dir__)

    def generate_install
      copy_file 'amocrm.yml', 'config/amocrm.yml'
      copy_file 'amocrm_token.yml', 'config/amocrm_token.yml'
      copy_file 'amocrm.rb', 'config/initializers/amocrm.rb'
    end
  end
end