require 'informer/report/record'
require 'informer/report/org'

module Informer
  class Report < Record
    attr_reader :results

    def self.construct_using(term, results, type)
      new(term, results, type).record
    end

    def initialize(term, results, type)
      @term = term
      @results = results
      @type = type
    end

    def formatted_results
      case @type
      when :org
        Informer::Org.construct_using(results)
      else
        super
      end
    end

    def filename
      @term.to_s + '_' + super
    end

    def extension
      '.' + @type.to_s
    end
  end
end
