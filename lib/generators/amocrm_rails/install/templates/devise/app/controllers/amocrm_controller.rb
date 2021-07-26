class AmocrmController < ApplicationController
  before_action :authenticate_user!, except: [:webhook]

  def link
  end

  def code
    if current_user.id == params[:state].to_i
      if File.exist?('config/amocrm.yml')
        data = YAML.load_file('config/amocrm.yml')
        data[Rails.env][current_user.id] = {} if data[Rails.env][current_user.id].nil?
        params.each do |k, v|
          data[Rails.env][current_user.id][k] = v
          AmocrmRails::register k.underscore.to_sym, v
        end
        File.open("config/amocrm.yml", 'w') { |f| YAML.dump(data, f) }
      end
    end
    @code = params[:code]
  end

  def webhook
    webhook_name = params[:name]
  end

  private

  def authenticate_user!
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
end