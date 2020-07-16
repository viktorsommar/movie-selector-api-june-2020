RSpec.describe 'Get /api/v0/movies', type: :request do
  describe 'successfully' do
    before do 
      get '/api/v0/movies/11'
    end

    it 'is expected to get a 200 response' do
      expect(response).to have_http_status 200
    end

  #   it 'is expected to return a collection of movies in an array' do 
  #     expect(@response_json["results"]).to be_an Array
  #   end

  #   it 'is expected to return a batman movie' do
  #     expect(@response_json["results"].first["title"]).to eq 'Batman'
  #   end
  end
end
