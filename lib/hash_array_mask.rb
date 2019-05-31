# Top-Level Class for hash_array_mask.
# May not be necessary depending on approach taken.
class HashArrayMask
  def self.hi
    puts 'Hello world!'
    'Hello world!'
  end
end

# Patch Hash to support nested masking behavior
class Hash
  def whitelist(sieve)
    return {} if sieve.nil?

    self.select { |k, _v| sieve[k] == true }
  end
end
