json.extract! note, :id, :title, :description, :user_id, :is_completed, :created_at, :updated_at
json.url note_url(note, format: :json)
