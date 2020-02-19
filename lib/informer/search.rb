require 'informer/report'
require 'informer/searcher'

module Informer
  def self.search(*terms)
    search_results = {}

    terms.flatten.each do |term|
      # TODO: Add configuration options to control ignores and other options
      results = Informer::Searcher.search(term)

      # TODO: rename filepath to reflect org
      filepath, html_filepath, markdown_filepath = Informer::Report.construct_using(term, results, TYPE)

      result_filepaths = {
        org_filepath: filepath,
        html_filepath: html_filepath,
        markdown_filepath: markdown_filepath
      }

      search_results[term.to_sym] = result_filepaths

      puts "Search results for #{term} written to #{filepath}"
      puts "Search results for #{term} written to #{html_filepath}"
      puts "Search results for #{term} written to #{markdown_filepath}"
    end

    return search_results
  end
end
