class Classification::Sample
  def generate(n)
    collection = []
    n.times { collection << Random.rand() }
    collection
  end
end
