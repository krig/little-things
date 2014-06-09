# All the little Ruby things

I've been learning Ruby lately, and as part of that process I watched
a video called [All the little things][yt], from a talk given by
[Sandi Metz][sm] at Railsconf 2014. It was a pretty great talk on how
to refactor code in general, but I thought the whole thing got a bit
derailed towards the end. It felt as if in order to get back into the
object-oriented comfort zone, things turned from getting progressively
simpler to getting more complex again.

I decided to see if I could "fix" it from where it seemed to start
going wrong. Well, turns out one of the reasons the code took what
looks like a bad turn to me is that Ruby is very much geared towards
objects with methods, and doesn't really want to treat methods as
values themselves.

Yes, there are first-class functions of a sort, but the syntax to
actually do what I'd want to do turned out to be awkward at best. In
the end, I don't know if I really think my version is that much
cleaner, but the problem as I see it are deficiencies in the Ruby
language when it comes to treating functions/methods as values. It
might also be that there is a better way to do what I'm trying to do
in Ruby, I just don't know it yet.

I'd still say my version is *better*, since I only needed to modify a
single location to add the conjured mana cake, whereas the suggested
implementation in the talk required adding a new class and then
hooking the class into the name => implementation map. Plus, there is
still only a single class, it is clear that the only thing that varies
between the variants is the tick method and from just looking at the
now tiny GildedRose class, the general purpose of the tick method is
also clear.

At the same time, it is clear that this is not how Ruby wants it. As a
footnote, I'd say that Python is a much cleaner language in this 
regard, and my version of the code would end up being a whole lot
cleaner in Python.

[sm]: http://www.sandimetz.com/
[yt]: http://youtu.be/8bZh5LMaSmE
