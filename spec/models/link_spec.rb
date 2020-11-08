require "rails_helper"

RSpec.describe Link do

    it "is valid if it has an original URL and a lookup code" do
        link = Link.new(
            original_url: "https://www.google.com",
            lookup_code: "1234567"
        )
        expect(link.valid?).to be (true)
    end

    it "is invalid if URL doesnt follow proper format" do
        link = Link.new(
            original_url: "asdfghjkl",
            lookup_code: "1234567"
        )
        expect(link.valid?).to be (false)
    end

    it "is invalid if it does not have a lookup code" do
        link = Link.new(
            original_url: "https://www.google.com",
        )
        expect(link.valid?).to be (false)
    end

    it "is invalid if it does not have an original URL" do
        link = Link.new(
            lookup_code: "1234567"
        )
        expect(link.valid?).to be (false)
    end

    it "is invalid if the lookup code already exists" do
        link = Link.new(
            original_url: "https://www.google.com",
            lookup_code: "1234567"
        )
        link.save

        link_2 = Link.new(
            original_url: "https://www.google.com",
            lookup_code: "1234567"
        )
        expect(link_2.valid?).to be (false)
    end

end
