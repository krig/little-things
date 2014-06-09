class GildedRose(object):
    def __init__(self, name, quality, days_remaining):
        self.quality, self.days_remaining = quality, days_remaining
        from inspect import getmembers, ismethod
        self.tick = ([fn for _, fn in getmembers(self, ismethod) if fn.__doc__ == name] +
                     [lambda: None])[0]

    def _normal(self):
        "normal"
        self.days_remaining -= 1
        if self.quality == 0: pass
        elif self.days_remaining < 1: self.quality -= 2
        else: self.quality -= 1

    def _brie(self):
        "Aged Brie"
        self.days_remaining -= 1
        if self.quality >= 50: pass
        elif self.days_remaining < 1: self.quality -= 2
        else: self.quality -= 1

    def _backstage(self):
        "Backstage passes to a TAFKAL80ETC concert"
        self.days_remaining -= 1
        if self.quality >= 50: pass
        elif self.days_remaining < 0: self.quality = 0
        elif self.days_remaining < 5: self.quality += 3
        elif self.days_remaining < 10: self.quality += 2
        else: self.quality += 1

    def _conjured(self):
        "Conjured Mana Cake"
        self.days_remaining -= 1
        if self.quality == 0: pass
        elif self.days_remaining <= 0: self.quality -= 4
        else: self.quality -= 2
