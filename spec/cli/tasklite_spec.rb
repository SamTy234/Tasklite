# frozen_string_literal: true

RSpec.describe 'tasklite_cli_application' do

  context 'when no input' do
    subject { puts `bundle exec ruby ./cli/tasklite` }

    let(:message) { /tasklite yay!/ }

    it 'prints the help text' do
      expect { subject }.to output(message).to_stdout
    end
  end

  context 'when new option is given' do
    subject { `bundle exec ruby ./cli/tasklite --new "go to the gym at 5pm"` }

    it 'saves a new task' do
      expect { subject }
    end
  end
end
