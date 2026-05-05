require 'minitest/autorun'
require 'policy'

class PolicyTest < Minitest::Test
  def test_fixture_decisions
    signal_case_1 = Releasecraft::Signal.new(demand: 88, capacity: 104, latency: 20, risk: 10, weight: 8)
    assert_equal 240, Releasecraft.score(signal_case_1)
    assert_equal 'accept', Releasecraft.classify(signal_case_1)
    signal_case_2 = Releasecraft::Signal.new(demand: 83, capacity: 96, latency: 10, risk: 23, weight: 10)
    assert_equal 200, Releasecraft.score(signal_case_2)
    assert_equal 'accept', Releasecraft.classify(signal_case_2)
    signal_case_3 = Releasecraft::Signal.new(demand: 93, capacity: 71, latency: 26, risk: 17, weight: 5)
    assert_equal 162, Releasecraft.score(signal_case_3)
    assert_equal 'accept', Releasecraft.classify(signal_case_3)
  end
end
