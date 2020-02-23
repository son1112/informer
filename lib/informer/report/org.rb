module Informer
  class Org
    def self.construct_using(results)
      new(results).format
    end

    def initialize(results)
      @results = results
    end

    def format
      org_results = @results[:items].map do |result|
        <<~TEXT
        * TODO #{result[:title]}:#{result[:line_number]}

          [[#{result[:directory]}/#{result[:title]}::#{result[:line_number]}]]

          #+BEGIN_SRC text
          #{result[:contents].join("\n")}
          #+END_SRC
        TEXT
      end

      org_results.prepend("*#{@results[:term]}*")
      org_results.join("\n")
    end
  end
end
