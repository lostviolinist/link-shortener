require "rails_helper"

RSpec.describe Shortener do
    it "shortens a given URL to 7 chars" do
        url = "https://www.google.com"
        shortener = Shortener.new(url)
        expect(shortener.lookup_code.length).to eq(7)
    end

    it "each lookup code is unique" do
        url = "https://www.google.com"
        shortener = Shortener.new(url)
        code_1 = shortener.lookup_code

        url = "https://www.facebook.com"
        shortener = Shortener.new(url)
        code_2 = shortener.lookup_code

        expect(code_2).to_not eq(code_1)
    end

    it "generates a Link record with a unique lookup code" do
        url = "https://www.facebook.com"
        shortener = Shortener.new(url)
        link = shortener.generate_short_link
        expect(link.valid?).to be(true)

        link2 = shortener.generate_short_link
        expect(link2.valid?).to be(true)
    end

end
