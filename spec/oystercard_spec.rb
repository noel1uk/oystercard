require 'oystercard'

describe Oystercard do
  subject(:oystercard) {described_class.new}
  let(:station) {double('station')}

  context "when new oystercard is initialized with argument" do
    let(:oystercard20) { described_class.new(20) }
    it "has balance given" do
      expect(oystercard20.balance).to eq 20
    end
  end

  describe "#initialize" do
    context "when new oystercard is initialized without argument" do
      it "has default balance" do
        expect(oystercard.balance).to eq Oystercard::DEFAULT_BALANCE
      end
      # it "has empty journey history" do
      #   expect(oystercard.journey_history).to eq []
      # end
    end
    context "When a journey is sent into the history" do
      it "save journey into history" do
        expect(oystercard.history).to eq []
      end
    end
    context "when initialized" do
      it "equals nil" do
        expect(oystercard.current_journey).to eq nil
      end
    end
  end
  context "when oystercard meets minimum balance" do
    before(:each){oystercard.top_up(Oystercard::MINIMUM_BALANCE)}

    describe "#touch_in" do
      it "stores entry station" do
        oystercard.touch_in(station)
        expect(oystercard.entry_station).to eq station
      end
    end


    describe "#touch_out" do
      before(:each){oystercard.touch_in(station)}

      it "deducts fare from the card balance" do
        expect{oystercard.touch_out(station)}.to change{oystercard.balance}.by(-Oystercard::MINIMUM_BALANCE)
      end

      it "sets entry station to nil" do
        oystercard.touch_out(station)
        expect(oystercard.entry_station).to eq nil
      end

      # let(:journey) { {entry_station: station, exit_station: station }}
      # it "stores current journey hash in array" do
      #   oystercard.touch_out(station)
      #   expect(oystercard.journey_history).to include(journey)
      # end
    end
  end






  describe "#touch_in" do
    before(:each) do
      oystercard.top_up(Oystercard::MINIMUM_BALANCE)
      oystercard.touch_in('Aldgate')
    end
    it "creates a journey object" do
      journey = double("journey")
      allow(oystercard).to receive(:current_journey) { journey }
      expect(oystercard.current_journey).not_to eq nil
    end
  end






  context "when oystercard does not have minimum balance" do
    describe "#touch_in" do
      it "raises an error" do
        error_message = "Minimum balance not met"
        expect { oystercard.touch_in(station) }.to raise_error error_message
      end
    end
  end

  describe "#top_up" do
    it "increases oystercard balance" do
      amount = 10
      expect{ oystercard.top_up(amount)}.to change{oystercard.balance}.by(amount)
    end
    it "raises error if maximum balance exceeded" do
      error_message = "Maximum balance of #{Oystercard::DEFAULT_LIMIT} exceeded"
      amount = Oystercard::DEFAULT_LIMIT - oystercard.balance + 1
      expect{ oystercard.top_up(amount) }.to raise_error error_message
    end
  end

  # describe "#in_journey" do
  #   it "returns whether or not the card is in journey" do
  #     expect(oystercard.in_journey?).to eq(true).or eq(false)
  #   end
  # end

    describe "#touch_out" do
    it "raises error if card hasn't been touched in" do
      error_message = "Not yet in journey"
      expect { oystercard.touch_out(station) }.to raise_error error_message
    end
  end
end
