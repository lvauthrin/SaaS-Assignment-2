class CartesianProduct
  include Enumerable
  
  def initialize(first, second)
    @first = first
    @second = second
  end
  
  def each
    @first.each do |outerElement|
      @second.each do |innerElement|
        yield [outerElement, innerElement]
      end
    end
  end
  
end

c = CartesianProduct.new([:a,:b], [4,5])
c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]

c = CartesianProduct.new([:a,:b], [])
c.each { |elt| puts elt.inspect }
# (nothing printed since Cartesian product
# of anything with an empty collection is empty)