require_relative '../lib/hash_array_mask.rb'

describe HashArrayMask do
  it 'says Hello' do
    expect(HashArrayMask.hi).to eql('Hello world!')
  end
end

describe Hash do
  it 'responds to .merge' do
    expect(Hash.new).to respond_to(:merge)
  end
  
  it 'responds to .whitelist' do
    expect(Hash.new).to respond_to(:whitelist)
  end
end
