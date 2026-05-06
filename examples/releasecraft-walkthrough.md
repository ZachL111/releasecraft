# Releasecraft Walkthrough

The fixture is intentionally compact, so the review starts with the cases that pull farthest apart.

| Case | Focus | Score | Lane |
| --- | --- | ---: | --- |
| baseline | dry-run spread | 125 | watch |
| stress | rename risk | 222 | ship |
| edge | operator cost | 110 | watch |
| recovery | idempotence | 178 | ship |
| stale | dry-run spread | 233 | ship |

Start with `stale` and `edge`. They create the widest contrast in this repository's fixture set, which makes them better review anchors than the middle cases.

The useful comparison is `dry-run spread` against `operator cost`, not the raw score alone.
