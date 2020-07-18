RSpec.describe 'POST /api/v1/watchlist_items', type: :request do
  let(:subscriber) { create(:user, subscriber: true, email: 'subscriber@mail.com')}
  let(:subscriber_credentials) { subscriber.create_new_auth_token }
  let(:subscriber_headers) { {HTTP_ACCEPT: 'application/json'}.merge!(subscriber_credentials)}

  let!(:watchlist) {create(:watchlist, user_id: subscriber.id)}
  let!(:watchlist_item) { create(:watchlist_item, movie_db_id: 12, title: 'Batman', watchlist: watchlist)}

  describe 'successfully' do
    before do 
      post '/api/v1/watchlist_items',
      params: {
        movie_db_id: 699,
        title: 'For Your Eyes Only'
      },
      headers: subscriber_headers
    end

    it ' returns 200 response status' do
      expect(response.status).to eq 200
    end

    it 'returns success message' do
      expect(JSON.parse(response.body)["message"]).to eq "The movie has been added to your watchlist"
    end

  end
end