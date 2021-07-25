# frozen_string_literal: true
#
module AmocrmRails
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('templates', __dir__)

    class_option :with, type: :string, default: ''

    def generate_install
      with = options['with']
      copy_file 'amocrm_token.yml', 'config/amocrm_token.yml'

      if with.to_s.downcase == 'devise'
        copy_file 'devise/app/controllers/amocrm_controller.rb', 'app/controllers/amocrm_controller.rb'
        copy_file 'devise/app/views/amocrm/code.html.erb', 'app/views/amocrm/code.html.erb'
        copy_file 'devise/app/views/amocrm/link.html.erb', 'app/views/amocrm/link.html.erb'
        copy_file 'devise/config/amocrm.yml', 'config/amocrm.yml'
        copy_file 'devise/config/initializers/amocrm.rb', 'config/initializers/amocrm.rb'
        route "get '/amocrm' => 'amocrm#code'"
        route "get '/amocrm/link' => 'amocrm#link'"

        inject_into_file 'app/controllers/application_controller.rb', after: "class ApplicationController < ActionController::Base\n" do <<-'RUBY'
          include AmocrmRails::Concern
          before_action :update_auth_code
        RUBY
        end
      else
        copy_file 'amocrm.rb', 'config/initializers/amocrm.rb'
        copy_file 'amocrm.yml', 'config/amocrm.yml'
      end
    end
  end
end