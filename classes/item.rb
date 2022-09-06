
require 'date'

class Item
  attr_accessor :publish_date
  attr_reader :genre, :label, :author, :archived, :source

  def initialize(publish_date, archived: false)
    @id = Random.rand(1..1000)
    @publish_date = Date.parse(publish_date)
    @archived = archived
  end

  def add_genre(genre)
    @genre = genre.name
    genre.item << self unless genre.items.include?(self)
  end

  def can_be_archived?
    (Date.today.year - @publish_date.year) > 10
  end

  def move_to_archive
    true if can_be_archived?
  end

  private :can_be_archived?
end
