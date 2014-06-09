TICK = {
  "normal" => Proc.new {|days, quality|
    days -= 1
    next days, quality if quality == 0
    next days, quality - 2 if days < 1
    next days, quality - 1
  },
  "Aged Brie" => Proc.new {|days, quality|
    days -= 1
    next days, quality if quality >= 50
    next days, quality - 2 if days < 1
    next days, quality - 1
  },
  "Sulfuras, Hand of Ragnaros" => Proc.new {|days, quality|
    next days, quality
  },
  "Backstage passes to a TAFKAL80ETC concert" => Proc.new {|days, quality|
    days -= 1
    next days, quality if quality >= 50
    next days, 0 if days < 0
    next days, quality + 3 if days < 5
    next days, quality + 2 if days < 10
    next days, quality + 1
  },
  "Conjured Mana Cake" => Proc.new {|days, quality|
    days -= 1
    next days, quality if quality == 0
    next days, quality - 4 if days <= 0
    next days, quality - 2
  },
}

class GildedRose
  attr_accessor :quality, :days_remaining
  def initialize(name, quality, days_remaining)
    @tick = TICK[name]
    @quality = quality
    @days_remaining = days_remaining
  end
  def tick
    @days_remaining, @quality = @tick.call @days_remaining, @quality
  end
end
