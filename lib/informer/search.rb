require 'informer/report'
require 'informer/searcher'

module Informer
  def self.search(*terms)
    search_results = {}

    terms.flatten.each do |term|
      # TODO: Add configuration options to control ignores and other options
      results = Informer::Searcher.search(term)

      # TODO: rename filepath to reflect org
      report = Informer::Report.construct_using(term, results, TYPE)
      filepath = report.record

      # TODO: handle multiple types
      search_results[term.to_sym] = filepath

      puts "Search results for #{term} written to #{filepath}"
    end

    return search_results
  end
end
