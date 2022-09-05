
class Item
    attr_reader :id, :archived
    attr_accessor :genre, :author, :source, :label, :publish_date

    def intialized
        @id = Random.rand(0..1000)
        @genre = genre
        @author = author
        @source = source
        @label = label
        @publish_date = publish_date
        @archived = archived    
    end
end