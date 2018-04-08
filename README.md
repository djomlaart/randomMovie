# randomMovie

RandomMovie is a simple Processing script which simulates a random movie generated from several directors.
Each shot in the movie (A, B, C, D, ...) is done by several (seven) directors. That means, for every group (shot) A, B,C, ...
we have seven potential videos (shots) to chose from. Choice is done randomly.

We have also several movie formulas, e.g. A+B+C, B+A+A, ... which means - (in case of A+B+C) play one video from group A, one from B and one from group C. By following the formula we know which grouos (shots) to use. Which exact video from the group will be used is (as mentioned above) done randomly. In one formula same video from one group shouldn't appear twice. We-also have one additional non-director ("nula") which means that if this is chosen, there is no video to play, we just skip it and play the next shot from the formula.

Choice of the formula is done randomly. When one forumla is finished, we randomly pick the next one and play videos from that formula.


Program is simple. Random choice of videos from one groups is done so that we randoly shuffle the list of videos from each group so the order of videos would be random in that group. Then we just track how many videos from each group were played during current formula, and pick the next one from the list.
