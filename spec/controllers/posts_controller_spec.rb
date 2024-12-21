RSpec.describe PostsController, type: :controller do
    let!(:user) { create(:user) }
    let!(:post) { create(:post, user: user) }
  
    describe 'POST /posts' do
      it 'creates a new post' do
        post '/posts', params: { post: { title: 'New Post', content: 'Content for the new post' } }, headers: { 'Authorization' => "Bearer #{user.token}" }
        expect(response).to have_http_status(:created)
      end
    end
  end
  