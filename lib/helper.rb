module AmocrmHelper
  def amocrm_oauth_url(state: nil, mode: 'post_message', client_id: AmocrmRails::client_id)
    "https://www.amocrm.ru/oauth?client_id=#{client_id}&mode=#{mode}&state=#{state}"
  end
end