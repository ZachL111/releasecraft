require_relative "policy"

module Releasecraft
  DomainReview = Struct.new(:signal, :slack, :drag, :confidence, keyword_init: true)

  def self.domain_review_score(item)
    item.signal * 2 + item.slack + item.confidence - item.drag * 3
  end

  def self.domain_review_lane(item)
    value = domain_review_score(item)
    return "ship" if value >= 140
    return "watch" if value >= 105
    "hold"
  end
end
