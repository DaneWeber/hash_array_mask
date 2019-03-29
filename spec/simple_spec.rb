require_relative '../lib/hash_array_mask.rb'

describe HashArrayMask do
  it 'says Hello' do
    expect(HashArrayMask.hi).to eql('Hello world!')
  end
end
