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

    sieve.each_with_object({}) do |(k, v), result|
      next if self[k].nil?

      if v == true
        result[k] = self[k]
      elsif v.is_a?(Hash)
        result[k] = self[k].whitelist(v)
      end
    end
  end
end

# Patch Array to support nested masking behavior
class Array
  def whitelist; end
end
