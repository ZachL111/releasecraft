# releasecraft

`releasecraft` keeps a focused Ruby implementation around automation. The project goal is to classify changelog fragments into deterministic release sections.

## Use Case

I want this repository to be useful as a quick reading exercise: fixtures first, implementation second, verifier last.

## Releasecraft Review Notes

The first comparison I would make is `dry-run spread` against `operator cost` because it shows where the rule is most opinionated.

## Highlights

- `fixtures/domain_review.csv` adds cases for dry-run spread and rename risk.
- `metadata/domain-review.json` records the same cases in structured form.
- `config/review-profile.json` captures the read order and the two review questions.
- `examples/releasecraft-walkthrough.md` walks through the case spread.
- The Ruby code includes a review path for `dry-run spread` and `operator cost`.
- `docs/field-notes.md` explains the strongest and weakest cases.

## Code Layout

The fixture data drives the tests. The code stays thin, while `metadata/domain-review.json` and `config/review-profile.json` explain what each case is meant to protect.

The Ruby code keeps the review rule close to the tests.

## Run The Check

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

## Regression Path

The verifier is intentionally local. It should fail if the fixture score math, lane assignment, or language-specific test drifts.

## Future Work

No external service is required. A deeper version would add more negative cases and a clearer boundary around invalid input.
