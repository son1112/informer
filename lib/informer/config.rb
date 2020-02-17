require 'informer/version'
require 'informer/constants'

module Informer
  def self.setup
    check_for_searcher
    unless Dir.exists?(INFORMER_PATH)
      puts "Creating Informer directory: #{INFORMER_PATH}"
      Dir.mkdir(INFORMER_PATH)
    end
    puts "Informer directory: #{INFORMER_PATH}"
  end

  private

  def self.searcher_installed?(searcher)
    system("brew list | grep #{searcher}")
  end

  def self.check_for_searcher
    unless searcher_installed?('the_silver_searcher')
      raise "Please install the_silver_searcher with 'brew install the_silver_searcher'"
    end
  end
end
