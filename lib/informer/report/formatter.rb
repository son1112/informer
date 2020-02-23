require 'informer/report/org'
require 'org-ruby'

module Informer
  class Formatter
    def self.construct_using(type, results)
      new(type, results).to_type
    end

    def initialize(type, results)
      @type = type
      @results = results
    end

    def format
      # default org format, use orgmode parser to convert to other formats
      Informer::Org.construct_using(@results)
    end

    def to_type
      # case org default self?
      case @type
      when :org
        format
      else
        Orgmode::Parser.new(format).send(('to_' + @type.to_s).to_sym)
      end
    end

  end
end
