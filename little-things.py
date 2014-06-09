class GildedRose(object):
    def __init__(self, name, quality, days_remaining):
        self.quality = quality
        self.days_remaining = days_remaining
        for f in dir(self):
            if f.startswith('tick_') and getattr(self, f).__doc__ == name:
                self.tick = getattr(self, f)

    def tick(self):
        pass

    def tick_normal(self):
        "normal"
        self.days_remaining -= 1
        if self.quality == 0: pass
        elif self.days_remaining < 1: self.quality -= 2
        else: self.quality -= 1

    def tick_aged_brie(self):
        "Aged Brie"
        self.days_remaining -= 1
        if self.quality >= 50: pass
        elif self.days_remaining < 1: self.quality -= 2
        else: self.quality -= 1

    def tick_backstage(self):
        "Backstage passes to a TAFKAL80ETC concert"
        self.days_remaining -= 1
        if self.quality >= 50: pass
        elif self.days_remaining < 0: self.quality = 0
        elif self.days_remaining < 5: self.quality += 3
        elif self.days_remaining < 10: self.quality += 2
        else: self.quality += 1

    def tick_conjured(self):
        "Conjured Mana Cake"
        self.days_remaining -= 1
        if self.quality == 0: pass
        elif self.days_remaining <= 0: self.quality -= 4
        else: self.quality -= 2
