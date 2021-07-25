module Amocrm
  extend ActiveSupport::Concern

  private

  def update_auth_code
    if user_signed_in?
      AmocrmRails::register :user_id, current_user.id
      if File.exist?('config/amocrm.yml')
        data = YAML.load_file('config/amocrm.yml')
        return nil if data.dig(Rails.env, current_user.id).nil?
        data[Rails.env][current_user.id].each do |k, v|
          AmocrmRails::register k.underscore.to_sym, v
        end

        if File.exist?('config/amocrm_token.yml')
          token_data = YAML.load_file("config/amocrm_token.yml")
          token_data[current_user.id] = {} if data.dig(current_user.id).nil?
          token_data[current_user.id].each do |k, v|
            config::register k.underscore.to_sym, v
          end
        end

        AmocrmRails.generate_access_token if AmocrmRails.access_token.nil? && AmocrmRails.code.present?
      end
    end
  end
end