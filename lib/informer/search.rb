require 'informer/report'
require 'informer/searcher'

module Informer
  def self.search(*terms)
    terms.flatten.each do |term|
      # TODO: Add configuration options to control ignores and other options
      results = Informer::Searcher.search(term)

      filepath, html_filepath, markdown_filepath = Informer::Report.construct_using(term, results, TYPE)
      puts "Search results for #{term} written to #{filepath}"
      puts "Search results for #{term} written to #{html_filepath}"
      puts "Search results for #{term} written to #{markdown_filepath}"
    end
  end
end
