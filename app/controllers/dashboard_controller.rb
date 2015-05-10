class DashboardController < ApplicationController
  def index
    @books = Book.all.limit(3).sort_by { |b| b.created_at}
  end
end