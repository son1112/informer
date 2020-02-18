module Informer
  class Org
    def self.construct_using(results)
      new(results).format
    end

    def initialize(results)
      @results = results
    end

    def format
      @results.map do |result|
        <<~TEXT
        * #{result[:title]}
        LINE NUMBER: #{result[:line_number]}

        #{result[:contents].join("\n")}
        TEXT
      end.join("\n")
    end
  end
end
