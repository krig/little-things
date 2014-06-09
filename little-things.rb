TICK = {
  "normal" => lambda do |days, quality|
    days -= 1
    return days, quality if quality == 0
    return days, quality - 2 if days < 1
    return days, quality - 1
  end,
  "Aged Brie" => lambda do |days, quality|
    days -= 1
    return days, quality if quality >= 50
    return days, quality - 2 if days < 1
    return days, quality - 1
  end,
  "Sulfuras, Hand of Ragnaros" => lambda do |days, quality|
    return days, quality
  end,
  "Backstage passes to a TAFKAL80ETC concert" => lambda do |days, quality|
    days -= 1
    return days, quality if quality >= 50
    return days, 0 if days < 0
    return days, quality + 3 if days < 5
    return days, quality + 2 if days < 10
    return days, quality + 1
  end,
  "Conjured Mana Cake" => lambda do |days, quality|
    days -= 1
    return days, quality if quality == 0
    return days, quality - 4 if days <= 0
    return days, quality - 2
  end,
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
