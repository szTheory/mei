# frozen_string_literal: true

require 'rails_helper'

describe BoardConfigSerializer do
  describe '.load' do
    it 'returns hash if raw is blank' do
      described_class.load(nil).should eql({})
      described_class.load('').should eql({})
    end

    it 'loads YAML document' do
      yaml = <<-END.strip_heredoc
        ---
        pagination:
          per_page: 2
      END

      described_class.load(yaml).should eql({ 'pagination' => { 'per_page' => 2 } })
    end
  end

  describe '.dump' do
    it 'returns hash if raw is blank' do
      described_class.load(nil).should eql({})
      described_class.load('').should eql({})
    end

    it 'loads YAML document' do
      yaml = <<-END.strip_heredoc
        ---
        pagination:
          per_page: 2
      END

      described_class.load(yaml).should eql({ 'pagination' => { 'per_page' => 2 } })
    end
  end

  describe '.dump' do
    it 'defaults to empty hash if given blank value' do
      described_class.dump(nil).should eql("--- {}\n")
    end

    it 'accepts a string, and pretend it is YAML text' do
      described_class.dump("--- {}\n").should eql("--- {}\n")
    end

    it 'dumps hash into YAML' do
      described_class.dump('a' => 1).should eql("---\na: 1\n")
    end
  end
end
