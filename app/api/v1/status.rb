module API
  module V1
    class Status < Grape::API

      desc 'Check API status'
      get '/status' do
        { status: 'OK' }
      end
    end
  end
end
