module Informer
  class Record
    def record
      File.open(filepath, 'w') do |file|
        file.write(formatted_results)
      end
      filepath
    end

    def formatted_results
      results
    end

    def filename
      Time.now.to_s
    end

    def filepath
      INFORMER_PATH + '/' + filename + extension
    end

    def extension
      '.txt'
    end
  end
end
