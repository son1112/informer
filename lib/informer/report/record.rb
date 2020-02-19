module Informer
  class Record
    def record
      File.open(filepath, 'w') do |file|
        file.write(formatted_results)
      end

      File.open(html_filepath, 'w') do |file|
        file.write(html_formatted_results)
      end

      File.open(markdown_filepath, 'w') do |file|
        file.write(markdown_formatted_results)
      end

      [filepath, html_filepath, markdown_filepath]
    end

    def formatted_results
      results
    end

    def html_formatted_results
      results
    end

    def filename
      datetime = Time.now.strftime("%Y-%m-%d-%H%M")
      "#{datetime}-#{Dir.pwd.to_s.gsub('/','_')}-"
    end

    def filepath
      INFORMER_PATH + '/' + filename + extension
    end

    def html_filepath
      INFORMER_PATH + '/' + filename + '.html'
    end

    def markdown_filepath
      INFORMER_PATH + '/' + filename + '.md'
    end

    def extension
      '.txt'
    end
  end
end
