describe Eth::Utils, type: :model do
  describe ".int_to_base256" do
    let(:hex) { '1c18f80381f0ef01e63617fc8eeda646bcef8dea61b34cf0aa079b48ec64e6e55d64d0398818a61bfdcf938e9aa175d16661ffa696629a6abc367a49fad3df90b8' }
    let(:bin) { Eth::Utils.hex_to_bin hex }
    let(:int) { Eth::Utils.base256_to_int bin }

    it "gets the same result back" do
      base256 = Eth::Utils.int_to_base256 int
      expect(base256).to eq(bin)
    end
  end

  describe ".prefix_hex" do
    it "ensures that a hex value has 0x at the beginning" do
      expect(Eth::Utils.prefix_hex('abc')).to eq('0xabc')
      expect(Eth::Utils.prefix_hex('0xabc')).to eq('0xabc')
    end

    it "does not reformat the hex or remove leading zeros" do
      expect(Eth::Utils.prefix_hex('0123')).to eq('0x0123')
    end
  end
end
