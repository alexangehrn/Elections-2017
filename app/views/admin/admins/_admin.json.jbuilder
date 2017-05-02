json.extract! admin, :id, :login, :password, :statut, :created_at, :updated_at
json.url admin_url(admin, format: :json)