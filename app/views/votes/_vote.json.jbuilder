json.extract! vote, :id, :id_candidate, :code_postal, :bureau_de_vote, :id_tour, :created_at, :updated_at
json.url vote_url(vote, format: :json)