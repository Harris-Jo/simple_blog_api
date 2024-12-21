require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  let(:user) { User.create!(name: 'John Doe', email: 'john@example.com', password: 'password') }
  let(:post) { Post.create!(title: 'First Post', content: 'This is the first post', user: user) }
  let(:other_user) { User.create!(name: 'Jane Doe', email: 'jane@example.com', password: 'password') }
  let(:valid_headers) { { 'Authorization' => "Bearer #{JsonWebToken.encode(user_id: user.id)}" } }

  # POST /posts/:post_id/likes - Like a Post
  describe 'POST #create' do
    context 'with a valid token' do
      it 'likes a post' do
        post :create, params: { post_id: post.id }, headers: valid_headers
        expect(response).to have_http_status(:created)
        expect(JSON.parse(response.body)).to have_key('id')
      end
    end

    context 'when the user already likes the post' do
      before { post :create, params: { post_id: post.id }, headers: valid_headers }

      it 'returns an error that the post is already liked' do
        post :create, params: { post_id: post.id }, headers: valid_headers
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['error']).to eq('Already liked')
      end
    end

    context 'with an invalid token' do
      it 'returns a 401 unauthorized error' do
        post :create, params: { post_id: post.id }
        expect(response).to have_http_status(:unauthorized)
        expect(JSON.parse(response.body)['error']).to eq('Missing or invalid token')
      end
    end
  end

  # DELETE /posts/:post_id/likes/:id - Remove Like from a Post
  describe 'DELETE #destroy' do
    let!(:like) { post.likes.create!(user: user) }

    context 'with a valid token' do
      it 'removes a like from a post' do
        delete :destroy, params: { post_id: post.id, id: like.id }, headers: valid_headers
        expect(response).to have_http_status(:ok)
        expect(JSON.parse(response.body)['message']).to eq('Like removed')
      end
    end

    context 'with an invalid token' do
      it 'returns a 401 unauthorized error' do
        delete :destroy, params: { post_id: post.id, id: like.id }
        expect(response).to have_http_status(:unauthorized)
        expect(JSON.parse(response.body)['error']).to eq('Missing or invalid token')
      end
    end

    context 'when the like does not exist' do
      it 'returns a 404 not found error' do
        delete :destroy, params: { post_id: post.id, id: 9999 }, headers: valid_headers
        expect(response).to have_http_status(:not_found)
        expect(JSON.parse(response.body)['error']).to eq('Like not found')
      end
    end
  end
end
