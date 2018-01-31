require "journey"

describe Journey do

  subject(:journey) {described_class.new}
  # let(:oystercard) {double('oystercard')}



  it "has empty history" do
    expect(journey.history).to eq []
  end



  #
  let(:station) {double('station')}
  let(:stations) { {entry_station: station, exit_station: station }}
  it "stores current journey hash in array" do
    journey.save
    expect(journey.history).to include(stations)
  end
  #
  # @history << {:entry_station => @entry_station, :exit_station => @exit_station}

  describe "#in_journey" do
    it "returns whether or not the card is in journey" do
      expect(journey.in_journey?).to eq(true).or eq(false)
    end
  end


end
