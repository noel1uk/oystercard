require "journey"

describe Journey do

  subject(:journey) {described_class.new}

  context "when journey is created without recieving arguments" do
    let(:new_journey) { described_class.new }
  end

  describe "#initialize" do
    expect(:journey)
  end

  # it "has empty history" do
  #   expect(journey.history).to eq []
  # end

  # Is this whole test actually checking what happens when you run subject.save
  before do
    # Why doesn't let work here and where should I put it
    let(:entry_station) {'ald'}
    let(:exit_station) {'vic'}

    # is this a correct thing to do? Why does it not work when using @
    entry_station = 'ald'
    exit_station = 'vic'
  end



  describe "#in_journey" do
    it "returns whether or not the card is in journey" do
      expect(journey.in_journey?).to eq(true).or eq(false)
    end
  end


end
