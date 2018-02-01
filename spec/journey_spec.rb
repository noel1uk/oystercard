require "journey"

describe Journey do

  subject(:journey) {described_class.new(entry_station)}
  let(:entry_station){double("entry station")}
  let(:exit_station){double("exit_station")}

    describe "#initialize" do
      it "returns entry station " do
        expect(journey.entry_station).to eq entry_station
      end
    end

    describe "#end_journey" do
      it "returns exit station" do
        expect(journey.end_journey(exit_station)).to eq exit_station
      end
    end

    describe "#send_journey" do
      it "responds to send journey" do
        journey.end_journey(exit_station)
        expect(journey.save_journey).to eq ({:entry_station => entry_station, :exit_station => exit_station})
      end
    end


  # it "has empty history" do
  #   expect(journey.history).to eq []
  # end

  # Is this whole test actually checking what happens when you run subject.save
  # before do
  #   # Why doesn't let work here and where should I put it
  #   let(:entry_station) {'ald'}
  #   let(:exit_station) {'vic'}
  #
  #   # is this a correct thing to do? Why does it not work when using @
  #   entry_station = 'ald'
  #   exit_station = 'vic'
  # end


  #
  # describe "#in_journey" do
  #   it "returns whether or not the card is in journey" do
  #     expect(journey.in_journey?).to eq(true).or eq(false)
  #   end
  # end
  #

end
