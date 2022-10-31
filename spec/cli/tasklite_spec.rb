# frozen_string_literal: true

RSpec.describe 'tasklite_cli_application' do

  subject { puts `bundle exec ruby ./cli/tasklite` }

  context 'when no input' do
    let(:message) { /tasklite yay!/ }

    it 'prints the help text' do
      expect { subject }.to output(message).to_stdout
    end
  end
end
