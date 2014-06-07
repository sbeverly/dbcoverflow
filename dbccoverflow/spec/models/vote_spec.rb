describe Vote do

	context "migrations" do

		let(:vote) { FactoryGirl.build :vote}

		it { vote.should respond_to(:score)}
		it { vote.should respond_to(:user)}
		it { vote.should respond_to(:votable)}
	end

	context "validations" do
		it { should validate_presence_of :score }
		it { should validate_presence_of :user }
		it { should validate_presence_of :votable }
	end

	context "assocations" do
		it { should belong_to(:user) }
		it { should belong_to(:votable) }		
	end

end
