# impl of actor model in ruby
# hacky, terrible, no tests, plz dont use this it was just for fun

I just wanted to see if I could make a prime-finding program that _actually_ used all of my cores without having to manually manage threads. So I made a `MTActor` class that can take blocks and split the work up (ala spinning up elixir threads)

It uses ~80-100% of my 3700x when running so I'd call that a win. 

reqs:
1) must run in jruby since MRI doesn't support _REAL_ threads.
