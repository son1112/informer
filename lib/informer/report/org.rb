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

      # @results.split("\n").map do |result|

      #   <<~TEXT
      #   * TITLE GOES HERE
      #     #{result}
      #   ** CONTENT GOES HERE
      #   TEXT
      # end.join("\n")

      # @results.lines.map do |result|
      #   begin
      #     # TODO: add filtering/validation
      #     next if result == "\n"

      #     result = result.force_encoding('UTF-8')

      #     # byebug unless result.match?(/\//)
      #     # byebug unless result.match?(/^\d/)

      #     byebug

      #     title = result.first
      #     contents = result[1..-1].to_s

      #     <<~TEXT
      #            * #{title}
      #            ** #{contents}
      #     TEXT
      #   rescue => e
      #     puts e.inspect
      #     byebug
      #   end
      # end.join("\n")
    end
  end
end
