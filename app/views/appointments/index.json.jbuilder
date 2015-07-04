json.array!(@appointments) do |appointment|
  json.extract! appointment, :id, :date, :time, :description
  json.url appointment_url(appointment, format: :json)
end
