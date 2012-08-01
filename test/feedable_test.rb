require 'test_helper'

class FeebableTest < ActiveSupport::TestCase
  test "exists" do
    assert_kind_of Module, Feedable, "feedable isn't what it seems to be"
  end

  test "feedable all" do
    @stuff = feedable Post, Rooster, Alligator
    assert_equal @stuff.length, 9, "not 9 things"
    assert_equal @stuff[0], roosters(:roostr3),  "wrong order"
    assert_equal @stuff[1], posts(:post3),       "wrong order"
    assert_equal @stuff[2], alligators(:gator3), "wrong order"
    assert_equal @stuff[3], roosters(:roostr2),  "wrong order"
    assert_equal @stuff[4], posts(:post2),       "wrong order"
    assert_equal @stuff[5], alligators(:gator2), "wrong order"
    assert_equal @stuff[6], roosters(:roostr1),  "wrong order"
    assert_equal @stuff[7], posts(:post1),       "wrong order"
    assert_equal @stuff[8], alligators(:gator1), "wrong order"
  end

  test "feedable limit" do
    @stuff = feedable Alligator, Post, Rooster, :limit => 5
    assert_equal @stuff.length, 5, "not 5 things"
  end

  test "feedable offset" do
    @stuff = feedable Alligator, Post, Rooster, :limit => 5, :offset => 2
    assert_equal @stuff.length, 5, "not 5 things"
    assert_equal @stuff[0], alligators(:gator3), "not offset"
  end

  test "feedable order" do
    @stuff = feedable Alligator, Post, Rooster, :order => 'asc'
    assert_equal @stuff[0], alligators(:gator1), "not ordered asc"

    @stuff = feedable Alligator, Post, Rooster, :order => 'desc'
    assert_equal @stuff[0], roosters(:roostr3), "not ordered desc"
  end

  test "feedable where conditions" do
    @stuff = feedable Post.where("title='Poster 3'"),
      Rooster.where("kind='DNE'"),
      Alligator.where("name is not null")

    assert_equal @stuff.length, 4, "not 4 things"
  end

  test "unfeedable in query" do
    assert_raise RuntimeError do
      @stuff = feedable Post, Rooster, Trumpet, Alligator
    end
  end

  test "duplicate feedable ids" do
    gt = Alligator.new
    gt.id = roosters(:roostr3).id
    gt.save

    @stuff = feedable Post, Rooster, Alligator, :limit => 3

    assert_equal @stuff.length, 3,              "not 3 things"
    assert_equal @stuff[0], gt,                 "missing new gator"
    assert_equal @stuff[1], roosters(:roostr3), "missing first rooster"
    assert_equal @stuff[2], posts(:post3),      "wrong order"
  end
end
