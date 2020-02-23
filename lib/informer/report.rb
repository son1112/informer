require 'informer/report/record'
require 'informer/report/formatter'

module Informer
  class Report < Record
    attr_reader :term, :results, :type

    def self.construct_using(term, results, type)
      new(term, results, type)
    end

    def initialize(term, results, type)
      @term = term
      @results = results
      @type = type
    end

    def formatted_results
      @formatted_results = Informer::Formatter.construct_using(type, results)
    end

    def filename
      # @term.to_s + '_' + super
      super + @term.to_s
    end

    def extension
      '.' + @type.to_s
    end
  end
end
