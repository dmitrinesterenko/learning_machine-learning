require 'pry'
module Classification
  Dir['lib/*.rb'].each do |f|
    require_relative f
 end
end
