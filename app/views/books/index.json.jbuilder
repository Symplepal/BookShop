json.array!(@books) do |book|
  json.extract! book, :id, :title, :author_id, :publisher_id, :published_date, :price, :page_count, :genre_id
  json.url book_url(book, format: :json)
end
