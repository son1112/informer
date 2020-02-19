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
        * TODO #{result[:title]}:#{result[:line_number]}

          [[#{result[:directory]}/#{result[:title]}::#{result[:line_number]}]]

          #+BEGIN_SRC text
          #{result[:contents].join("\n")}
          #+END_SRC
        TEXT
      end.join("\n")
    end
  end
end
