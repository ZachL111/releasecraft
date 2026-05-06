require 'minitest/autorun'
require 'domain_review'

class DomainReviewTest < Minitest::Test
  def test_domain_lane
    item = Releasecraft::DomainReview.new(signal: 45, slack: 52, drag: 29, confidence: 70)
    assert_equal 125, Releasecraft.domain_review_score(item)
    assert_equal "watch", Releasecraft.domain_review_lane(item)
  end
end
