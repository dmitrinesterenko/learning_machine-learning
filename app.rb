require 'pry'
## TODO make this into a gem so it's not treated like a special thing
require_relative 'lib/class'
module Classification
 Dir['lib/**/*.rb'].each do |f|
    require_relative f
 end

end
