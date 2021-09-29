require 'system_helper'

RSpec.describe 'SentenceDisplaySpec', type: :system do
    before do
        sentence = Sentence.create(words: 'Apple is looking at buying U.K. startup for $1 billion.')
        entities = [ { text: "Apple", type: "ORG" },
        { text: "U.K.", type: "GPE"},
        { text: "$1 billion", type: "MONEY" }]
        entities.each do |entity|
            sentence.entities.create(entity)
        end
    end

    it "displays entities inline with sentence" do
        visit '/sentences'
        
        expect(page).to have_content("Apple ORG")
        expect(page).to have_content("U.K. GPE")
        expect(page).to have_content("$1 billion MONEY")
    end
end