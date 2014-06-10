class GildedRose
  attr_accessor :quality, :days_remaining

  def initialize(name, quality, days_remaining)
    tick = {
      "normal" => ->(days, quality) {
        days -= 1
        return days, quality if quality == 0
        return days, quality - 2 if days < 1
        return days, quality - 1
      },
      "Aged Brie" => ->(days, quality) {
        days -= 1
        return days, quality if quality >= 50
        return days, quality - 2 if days < 1
        return days, quality - 1
      },
      "Sulfuras, Hand of Ragnaros" => ->(days, quality) {
        return days, quality
      },
      "Backstage passes to a TAFKAL80ETC concert" => ->(days, quality) {
        days -= 1
        return days, quality if quality >= 50
        return days, 0 if days < 0
        return days, quality + 3 if days < 5
        return days, quality + 2 if days < 10
        return days, quality + 1
      },
      "Conjured Mana Cake" => ->(days, quality) {
        days -= 1
        return days, quality if quality == 0
        return days, quality - 4 if days <= 0
        return days, quality - 2
      },
    }
    @days_remaining, @quality, @tick = days_remaining, quality, tick[name]
  end

  def tick
    @days_remaining, @quality = @tick.(@days_remaining, @quality)
  end
end
