# metaprogramming to the rescue!

class Numeric
  @@currencies = {'dollar' => 1, 'yen' => 0.013, 'euro' =>  1.292, 'rupee' => 0.019}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end
  
  def in(currency)
    singular_currency = currency.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self / @@currencies[singular_currency]
    else
      self
    end
  end
  
end

# puts 5.dollars.in(:euros)
# puts 10.euros.in(:rupees)
# puts 200.yen.in(:dollars)

class String
  
  def palindrome?
    cleanString = self.gsub(/\W/, '').downcase
    return cleanString.eql?(cleanString.reverse)
  end

end

# puts "Madam, I'm Adam!".palindrome?
# puts "A man, a plan, a canal -- Panama".palindrome?
# puts "Abracadabra".palindrome?

module Enumerable
  
  def palindrome?
    a = []; b = []
    self.each { |element| a = a.unshift(element); b.push(element)}
    return a == b
  end
  
end

# puts [1,2,3,2,1].palindrome?
# puts [1,2,3,4,1].palindrome?
# puts [:a=>1, :b=>2].palindrome?