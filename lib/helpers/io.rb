class Classification::IO
  def initialize(input, output)
  end

  def output(file, data)
    File.open(file, "w") do |f|
      data.each_with_index do |i, d|
        f << i.to_s + "," + d.to_s
      end
    end
  end
end
