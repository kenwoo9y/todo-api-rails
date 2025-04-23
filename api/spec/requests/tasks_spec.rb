require 'rails_helper'

RSpec.describe 'Tasks API', type: :request do
  describe 'GET /tasks' do
    before do
      create_list(:task, 5)
    end

    it 'returns a successful response' do
      get '/tasks'
      expect(response).to have_http_status(:ok)
    end

    it 'returns all tasks in JSON format' do
      get '/tasks'
      json = JSON.parse(response.body)
      expect(json.length).to eq(5)
      expect(json.first).to have_key('id')
      expect(json.first).to have_key('title')
      expect(json.first).to have_key('description')
    end
  end
end
