# frozen_string_literal: true

RSpec.describe RuboCop::AST::ForNode do
  let(:for_node) { parse_source(source).ast }

  describe '.new' do
    let(:source) { 'for foo in bar; baz; end' }

    it { expect(for_node).to be_a(described_class) }
  end

  describe '#keyword' do
    let(:source) { 'for foo in bar; baz; end' }

    it { expect(for_node.keyword).to eq('for') }
  end

  describe '#do?' do
    context 'with a do keyword' do
      let(:source) { 'for foo in bar do baz; end' }

      it { expect(for_node).to be_do }
    end

    context 'without a do keyword' do
      let(:source) { 'for foo in bar; baz; end' }

      it { expect(for_node).not_to be_do }
    end
  end

  describe '#void_context?' do
    context 'with a do keyword' do
      let(:source) { 'for foo in bar do baz; end' }

      it { expect(for_node).to be_void_context }
    end

    context 'without a do keyword' do
      let(:source) { 'for foo in bar; baz; end' }

      it { expect(for_node).to be_void_context }
    end
  end

  describe '#variable' do
    let(:source) { 'for foo in :bar; :baz; end' }

    it { expect(for_node.variable).to be_lvasgn_type }
  end

  describe '#collection' do
    let(:source) { 'for foo in :bar; baz; end' }

    it { expect(for_node.collection).to be_sym_type }
  end

  describe '#body' do
    let(:source) { 'for foo in bar; :baz; end' }

    it { expect(for_node.body).to be_sym_type }
  end

  describe '#post_condition_loop?' do
    let(:source) { 'for foo in bar; baz; end' }

    it { expect(for_node).not_to be_post_condition_loop }
  end

  describe '#loop_keyword?' do
    let(:source) { 'for foo in bar; baz; end' }

    it { expect(for_node).to be_loop_keyword }
  end
end
