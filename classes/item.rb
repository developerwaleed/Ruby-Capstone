
class Item
    attr_reader :id, :archived
    attr_accessor :genre, :author, :source, :label, :publish_date

    def intialized(genre, author, source, label, publish_date, archived)
        @id = Random.rand(0..1000)
        @genre = genre
        @author = author
        @source = source
        @label = label
        @publish_date = publish_date
        @archived = archived
    end

    def can_be_removed?
        (Date.today.year - @publish_date.year).to_i > 10
    end

    def move_to_archive
        @archived = true if can_be_removed?
    end
end