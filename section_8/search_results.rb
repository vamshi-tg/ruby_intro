require './search_result'
require 'httparty'
require 'nokogiri'

class SearchResults
    include HTTParty

    attr_reader :results

    def initialize(query_hash)
        @query = query_hash[:query]
        @results = []
    end

    public
    def size
        scrapeWebPage
        @results.size
    end

    def display
        @results.each { |search_result|
            search_result.display
        }
    end

    private
    def scrapeWebPage
        parsedHtml = Nokogiri::HTML(getHtmlStringOfGoogleSearch)
        parsedHtml.css("div#ires div.g").each { |result|
            titleEle = result.at_css("h3.r")
            title = getInnerText(titleEle)

            descEle = result.at_css(".st")
            desc = getInnerText(descEle)

            urlEle = result.at_css("cite")
            url = getInnerText(urlEle)

            # Create new SearchResult object
            search_result = SearchResult.new(title, desc, url)

            @results.push(search_result)
        }
    end

    def getInnerText(ele)
        ele.text if ele
    end

    def getHtmlStringOfGoogleSearch
        # TO-DO What is self.class?
        self.class.get("https://google.com/search?q=#{@query}")
    end
end

sr = SearchResults.new(:query => 'ruby intro')
puts "Total Search results #{sr.size}"

# sr.display

puts sr.results[0].title
puts sr.results[0].desc
puts sr.results[0].url 
