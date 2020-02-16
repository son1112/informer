
module Informer
  def self.search(terms)
    terms.each do |term|
      # TODO: Add configuration options to control ignores and other options
      results = `ag -r -C 2 --nobreak #{term}`

      puts results
    end
  end
end
