module Releasecraft
  Signal = Struct.new(:demand, :capacity, :latency, :risk, :weight, keyword_init: true)

  THRESHOLD = 161
  RISK_PENALTY = 4
  LATENCY_PENALTY = 2
  WEIGHT_BONUS = 5

  def self.score(signal)
    signal.demand * 2 + signal.capacity + signal.weight * WEIGHT_BONUS -
      signal.latency * LATENCY_PENALTY - signal.risk * RISK_PENALTY
  end

  def self.classify(signal)
    score(signal) >= THRESHOLD ? "accept" : "review"
  end
end
