# Represents an Auction

require 'httparty'
require 'nokogiri'

module Japonica
	class Auction
		attr_accessor :url
		attr_accessor :item_name
		attr_accessor :seller_id
		attr_accessor :current_price
		attr_accessor :max_bid

		def is_mbok?
			url =~ /mbok\.jp/i
		end

		def is_yahoo?
			url =~ /yahoo\.co\.jp/i
		end

		# Load auction from url
		def self.load_url(url)
			auction = Auction.new
			auction.url = url

			html = fetch_html url

			if auction.is_mbok?
				load_mbok html, auction
			elsif auction.is_yahoo?
				load_yahoo html, auction
			else
				nil
			end
		end 

		private 

		def self.fetch_html(url)
			response = HTTParty.get url
			html = response.body
			Nokogiri::HTML html
		end

		def self.load_mbok(noko, auction)
			item_name = noko.at_css 'h1.title[itemprop=name]'
			seller_id = noko.at_css 'p.owner-name a'
			current_price = noko.at_css 'span[itemprop=Price]'

			auction.item_name = item_name.text unless item_name.nil?
			auction.seller_id = seller_id.text unless seller_id.nil?
			auction.current_price = current_price.text unless current_price.nil?
			auction
		end

		def self.load_yahoo(noko, auction)
			item_name = noko.at_css "h1[property='auction:Title']"
			seller_id = noko.at_css "b[property='auction:SellerID']"
			current_price = noko.at_css "p[property='auction:Price']"
			
			auction.item_name = item_name.text unless item_name.nil?
			auction.seller_id = seller_id.text unless seller_id.nil?
			auction.current_price = current_price.text unless current_price.nil?
			auction
		end
	end
end