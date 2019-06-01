require_relative '../lib/hash_array_mask.rb'

describe HashArrayMask do
  it 'says Hello' do
    expect(HashArrayMask.hi).to eql('Hello world!')
  end
end

describe Hash do
  it 'responds to .merge' do
    expect({}).to respond_to(:merge)
  end

  describe '.whitelist' do
    it 'responds to .whitelist' do
      expect({}).to respond_to(:whitelist)
    end

    context 'simple hash whitelist' do
      payload = { a: 'A', b: [1, 2, 3], c: :c, d: { alpha: 'A', beta: 'B' } }

      it 'returns an empty hash if the sieve is nil' do
        modified = payload.whitelist(nil)
        expect(modified).to eq({})
      end

      it 'returns an empty hash if there are no matches' do
        modified = payload.whitelist(x: true)
        expect(modified).to eq({})
      end

      it 'returns an equivalent payload if all match' do
        modified = payload.whitelist(a: true, b: true, c: true, d: true)
        expect(modified).to eq(payload)
      end

      it 'returns the selected item when one is chosen' do
        modified = payload.whitelist(b: true)
        expectation = { b: [1, 2, 3] }
        expect(modified).to eq(expectation)
      end
    end

    context 'nested hash whitelist' do
      payload = {
        top: {
          a: 'A',
          b: 'B'
        },
        strata: {
          junk: 'x',
          one: {
            junk: 'x',
            two: {
              junk: 'x',
              three: {
                junk: 'x',
                four: 'bedrock'
              }
            }
          }
        }
      }

      it 'returns only part of a nested hash' do
        modified = payload.whitelist(top: { a: true })
        expectation = { top: { a: 'A' } }
        expect(modified).to eq(expectation)
      end

      it 'returns goes deep in nested hashes' do
        modified = payload.whitelist(strata: {
                                       one: {
                                         two: {
                                           three: {
                                             four: true
                                           }
                                         }
                                       }
                                     })
        expectation = {
          strata: {
            one: {
              two: {
                three: {
                  four: 'bedrock'
                }
              }
            }
          }
        }
        expect(modified).to eq(expectation)
      end
    end
  end
end
