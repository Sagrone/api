module API
  module V1
    class Status < Grape::API
      include API::V1::Defaults

      desc 'Check API status'
      get '/status' do
        { status: 'OK' }
      end
    end
  end
end
