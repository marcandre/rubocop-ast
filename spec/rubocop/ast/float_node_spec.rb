# frozen_string_literal: true

RSpec.describe RuboCop::AST::FloatNode do
  let(:float_node) { parse_source(source).ast }

  describe '.new' do
    let(:source) { '42.0' }

    it { expect(float_node).to be_a(described_class) }
  end

  describe '#sign?' do
    context 'explicit positive float' do
      let(:source) { '+42.0' }

      it { expect(float_node).to be_sign }
    end

    context 'explicit negative float' do
      let(:source) { '-42.0' }

      it { expect(float_node).to be_sign }
    end
  end

  describe '#value' do
    let(:source) do
      '1.5'
    end

    it { expect(float_node.value).to eq(1.5) }
  end
end
