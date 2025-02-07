class Movie
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :year, type: Integer
  field :genre, type: String
  field :director, type: String
  field :plot, type: String
  field :comment, type: String
  field :imdb_id, type: String
  field :poster, type: String

  validates :title, presence: true
  validates :imdb_id, uniqueness: true
end