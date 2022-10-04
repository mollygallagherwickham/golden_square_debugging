require 'diary_entry'

RSpec.describe DiaryEntry do
    it "creates a new object" do
        diary_entry = DiaryEntry.new("Green Eggs and Ham", "I do not like them Sam-I-Am")
        expect(diary_entry.title).to eq "Green Eggs and Ham"
    end

    it "creates a new object" do
        diary_entry = DiaryEntry.new("Green Eggs and Ham", "I do not like them Sam-I-Am")
        expect(diary_entry.contents).to eq "I do not like them Sam-I-Am"
    end

    it "counts words of contents and returns a value of 5" do
        diary_entry = DiaryEntry.new("Dear Diary","This is a new page!")
        expect(diary_entry.count_words).to eq 5
    end

    context "when contents not given" do
        it "returns an error" do
            diary_entry = DiaryEntry.new("Dear Diary","")
            expect{diary_entry.count_words}.to raise_error "Content not valid!"
        end
    end

    it "returns 1 minute when reading per minute is 100" do
        diary_entry = DiaryEntry.new("Dear Diary","one " * 100)
        expect(diary_entry.reading_time(100)).to eq "1 minute(s)" 
    end

    it "returns 4 minutes when reading per minute is 100" do
        diary_entry = DiaryEntry.new("Dear Diary","one " * 336)
        expect(diary_entry.reading_time(100)).to eq "4 minute(s)" 
    end

end