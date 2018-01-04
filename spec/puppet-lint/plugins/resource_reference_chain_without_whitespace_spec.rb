require 'spec_helper'

describe 'resource_reference_chain_without_whitespace' do

  context 'a whitespace between reference and bracket on chains' do
    let(:msg) { 'whitespce between reference type and title' }
    let(:code) { "class foo { include foo::install include foo::config include foo::service Class ['foo::install'] -> Class ['foo::config'] ~> Class ['foo::service'] } " }

    it 'should detect two problems' do
      expect(problems).to have(3).problem
    end

    it 'should create an error' do
      expect(problems).to contain_error(msg).on_line(1)
    end
  end

end
