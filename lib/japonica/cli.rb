
require 'erb'
require 'thor'
require 'japonica/auction'


module Japonica
	class CLI < Thor
		
		desc "order URL MAX_BID BID_TYPE", "Creates an order form using the auction url and max bid.\nBID_TYPE can be: [instant|bid, bin (buy it now), snipe]"
		def order(url, max='xxxx', type=:instant)
			@auction = Japonica::Auction.load_url url
			@max_bid = max
			@bid_type = type_name type.to_sym
			
			# doesn't use thor's template() since i don't want to output to a file
			puts ERB.new(File.read(File.join(template_path, 'orderform.tt'))).result(binding)
		end

		desc "batch FILE", "Batch generate from a file"
		def batch(file)
			File.readlines(file).each do |l|
				url, max, type = l.split(' ')
				order(url, max, type)
			end
		end

		private 

		def template_path
			File.join(File.dirname(__FILE__), '..', 'templates')
		end

		def type_name (type)
			case type
			when :instant, :bid
				'Instant Bid'
			when :bin, :now
				'Buy It Now'
			when :snipe
				'Snipe Bid'
			end
		end
	end
end