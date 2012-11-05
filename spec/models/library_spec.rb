require 'spec_helper'

describe Library do
  subject { Library.new }
  it { should validate_presence_of :owner }
end
