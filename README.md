# Japonica

A cli tool for generating order email text from auction site links. Currently
only Yahoo! Japan and Mbok are supported.

This utility will populate the fields of the order form with data scraped from the
content of the provided url.

## Installation

	$ gem install japonica

Or, from source:

    $ git clone git://github.com/ryands/japonica.git japonica
    $ cd japonica/
    $ bundle install
    $ rake install

## Usage

	$ japonica order <yahoo or mbok auction link> <max_bid in yen> [bid type]

The [bid type] can be one of: `bid`, `snipe`, or `bin` (buy-it-now).

## Links

* [Japonica](http://www.japonicamarket.com/)
* [RubyGems](https://rubygems.org/gems/japonica)

