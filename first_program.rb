require 'sinatra'
require 'nokogiri'
require 'httparty'

class Scraper
  def initialize(url, css_selector)
    @url = url
    @css_selector = css_selector
  end

  def scrape
    unparsed_page = HTTParty.get(@url)
    parsed_page = Nokogiri::HTML(unparsed_page)
    parsed_page.css(@css_selector)
  end
end

get "/" do
  scraper = Scraper.new("https://www.bbc.co.uk/news", "h3")
  @data = scraper.scrape.map(&:text)
  erb :index
end