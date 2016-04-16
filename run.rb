require_relative 'app'
def parse_params
  params = {}
  ARGV.each do |p|
    k_v = p.split('=')
    params[k_v[0].gsub('-', '').to_sym] = k_v[1]
  end
  params
end

params = parse_params
cli = Classification::CLI.new params
cli.start
