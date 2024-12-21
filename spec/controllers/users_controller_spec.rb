require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) { { name: 'John Doe', email: 'john@example.com', password: 'password', password_confirmation: 'password' } }
  let(:invalid_attributes) { { name: '', email: '', password: 'password', password_confirmation: 'password' } }
  let(:user) { User.create!(valid_attributes) }

  # POST /signup - User Creation
  describe 'POST #signup' do
    context 'with valid attributes' do
      it 'creates a new user and returns a JWT token' do
        post :signup, params: { user: valid_attributes }
        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)).to have_key('token')
      end
    end

    context 'with invalid attributes' do
      it 'returns a 422 error and validation messages' do
        post :signup, params: { user: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['errors']).to include("Name can't be blank", "Email can't be blank")
      end
    end
  end

  # POST /login - User Login
  describe 'POST #login' do
    context 'with valid credentials' do
      it 'returns a JWT token' do
        post :login, params: { email: user.email, password: user.password }
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)).to have_key('token')
      end
    end

    context 'with invalid credentials' do
      it 'returns a 401 error' do
        post :login, params: { email: user.email, password: 'wrongpassword' }
        expect(response).to have_http_status(:unauthorized)
        expect(JSON.parse(response.body)['error']).to eq('Invalid credentials')
      end
    end
  end
end
