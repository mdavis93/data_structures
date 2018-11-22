### Explain why doubling the size of the underlying array of your HashClass may be a poor idea.

Doubling the size of the underlying array in the `HashClass` can be a poor idea due to it's exponentially increasing memory cost, and exponentially increasing time factor.  A single `HashClass` that initializes with a size of `6` will reserve six addresses for the arrays.  Upon resizing, assuming a double on each growth, this can quickly become a beast in very little time.  After resizing 7 times, we're up to over 750 addresses that are encased into our class.  This is in addition to the performance hit we will experience with each cumulative resize.

And added cost is the fact that each element in the Hash is stored at random memory locations, which will compound the fragmentation of the structure, and more RAM reads since it's not a guarantee that the addresses needed have been Cached in the system.  A small oversight in the data structure's design could lead to an extremely expensive memory leak by taking more "slots" than needed.

It is for those reasons that I can see the effective usefulness of this structure, however safeguards should be in place to serve as a "checks-and-balance".  One such safeguard could be a `constant` to hold the `max_size` of the `HashClass`.  Once it reaches this size, it would not be permitted to grow further without user interaction.  This leads me to naturally ask the next logical question:

>How well does this data structure serve in the context of scalability?
