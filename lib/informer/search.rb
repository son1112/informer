
module Informer
  def self.search(*terms)
    terms.each do |term|
      # TODO: Add configuration options to control ignores and other options
      puts `ag -r --pager="less -R" -C 2 --nobreak --ignore output.html --ignore spec --ignore cache --ignore sierra #{term}`
    end
  end
end
