class SearchResult
    attr_accessor :title, :desc, :url

    def initialize(title, desc, url)
        @title = title ? title : "No title"
        @desc = desc ? desc : "No description"
        @url = url ? url : "No url"
    end

    def display
        puts "------------------------------------------------------\n\n"
        puts "Tile: #{@title} \n\n"
        puts "Description: #{@desc} \n\n"
        puts "Url: #{@url} \n\n"
    end
end