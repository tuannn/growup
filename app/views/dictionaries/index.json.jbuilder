json.array!(@dictionaries) do |dictionary|
  json.extract! dictionary, :id, :word, :pronunciation, :example, :language_id
  json.url dictionary_url(dictionary, format: :json)
end
