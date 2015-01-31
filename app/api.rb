class API < Grape::API
  content_type :json, 'application/json; charset=UTF-8'
  format :json
  formatter :json, Grape::Formatter::Rabl
  rescue_from :all

  desc 'Check API status'
  get '/status' do
    {status: 'OK'}
  end
end
