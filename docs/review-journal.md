# Review Journal

This journal records the domain cases that matter before widening the public API.

The local checks classify each case as `ship`, `watch`, or `hold`. That gives the project a small review vocabulary that matches its automation focus without claiming live deployment or external usage.

## Cases

- `baseline`: `dry-run spread`, score 125, lane `watch`
- `stress`: `rename risk`, score 222, lane `ship`
- `edge`: `operator cost`, score 110, lane `watch`
- `recovery`: `idempotence`, score 178, lane `ship`
- `stale`: `dry-run spread`, score 233, lane `ship`

## Note

The useful failure mode here is a wrong decision on a named case, not a vague style disagreement.
