
class Item 
    attr_accessor :publish_date
    attr_reader :genre, :label, :author, :archived, :source
  
    def initialize(date)
      @id = Random.rand(1..1000)
      @publish_date = Date.strptime(date, '%Y-%m-%d')
      @archived = false
    end
end