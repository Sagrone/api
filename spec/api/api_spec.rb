require 'spec_helper'

RSpec.describe API do
  describe 'GET /status' do
    it 'retrieves the API status' do
      get '/status'

      expect_status 200
      expect(json_body).to eq(status: 'OK')
    end
  end
end
