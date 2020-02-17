module Informer
  class Searcher
    def self.search(term)
      new(SEARCHER, OPTIONS, term).search
    end

    def initialize(searcher, options, term)
      @searcher = searcher
      @options = options
      @term = term
      @results = []
    end

    def search
      # TODO: add results for -g PATTERN (print filenames matching pattern)
      # TODO: handle multiple search terms (man ag -> --parallel)

      title_search.split("\x00").map do |title|
        title_contents = title.split(":")
        filepath = title_contents.first
        line_number = title_contents.last

        @results << {
          title: filepath,
          line_number: line_number,
          contents: content_search(filepath)
        }
      end

      @results
    end

    private

    def title_search
      `#{search_command} --count #{@term}`
    end

    def content_search(path = ".")
      begin
        `#{search_command} #{@term} #{path}`.force_encoding('UTF-8').split("\n")
      rescue => e
        byebug
      end
    end

    def search_command
      "#{@searcher} #{@options}"
    end
  end
end
