RSpec.describe 'Get /api/v0/movies', type: :request do
  describe 'successfully' do
    before do 
      get '/api/v0/movies',
      params: {
        query: 'Batman'
      }

      @response_json = JSON.parse(response.body)
    end

    it 'is expected to return a collection of movies in an array' do 
      expect(@response_json["results"]).to be_an Array
    end

    it 'is expected to return a batman movie' do
      expect(@response_json["results"].first["title"]).to eq 'Batman'
    end
  end
end
