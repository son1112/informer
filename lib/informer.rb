
require 'informer/version'
require 'informer/search'

def searcher_installed?(searcher)
  system("brew list | grep #{searcher}")
end

unless searcher_installed?('the_silver_searcher')
  raise "Please install the_silver_searcher with 'brew install the_silver_searcher'"
end

