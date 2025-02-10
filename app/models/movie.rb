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

  before_save :log_save
  after_save :log_after_save

  def log_save
    Rails.logger.info "Before Save: #{self.title}"
  end

  def log_after_save
    Rails.logger.info "After Save: #{self.title}"
  end
end
