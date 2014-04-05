require 'spec_helper'

class EulerLang
  def run
    '42'
  end
end

describe Euler::Solution do

  before(:all) do
    euler_lang = EulerLang.new
    Euler.register_language('euler-lang', euler_lang)
    euler_lang
  end

  after(:all) do
    Euler.unregister_language('euler-lang')
  end

  it "should call it's language's run method when run is called" do
    solution = Euler::Solution.new(9001, 'euler-lang')
    solution.run
  end

  it "should raise an error if run is called before it's language is registered" do
    expect {
      solution = Euler::Solution.new(9001, 'euler-lang2')
      solution.run
    }.to raise_error Euler::LanguageNotRegisteredError
  end

  it "should attempt to create the directory specified by directory_strategy when init is called" do
    include FakeFS::SpecHelpers
    FakeFS.activate!

    ds = lambda { |problem_id, language|
      "/euler/#{problem_id}/#{language}"
    }

    args = [1, 'euler-lang']

    Euler.config do |config|
      config.directory_strategy ds
    end

    Euler::Solution.new(*args).init

    dir = ds.call(*args)

    File.directory?(dir).should be_true
  end

  it "correct? method should return true of the solution is correct and false otherwise" do
    include FakeFS::SpecHelpers
    FakeFS.deactivate!

    solution = Euler::Solution.new(1, 'euler-lang')
    problem  = solution.problem
    allow(problem).to receive(:answer).and_return('42', '9001')

    solution.correct?.should be_true

    solution.correct?.should be_false
  end

end
