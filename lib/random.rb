class Classification::Sample
  def generate(n)
    collection = []
    n.times { collection << Random.rand() }
    collection
  end

end

class Classification::IO
   def output(file, data)
    File.open(file, "w") do |f|
      data.each_with_index do |i, d|
        f << i.to_s + "," + d.to_s
      end
    end
   end
end
