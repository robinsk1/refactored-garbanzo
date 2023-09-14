# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Searches', type: :request do
  describe 'GET /index' do
    it 'returns expected response' do
      get '/'
      expect(response).to have_http_status(:ok)
    end
  end
end
