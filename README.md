# releasecraft

`releasecraft` treats automation as a local verification problem. The Ruby implementation is intentionally narrow, but the fixtures and notes make the behavior explicit.

## Releasecraft Checkpoints

Treat the compact fixture as the contract and the extended examples as a scratchpad. The code should stay boring enough that a change in behavior is obvious from the test output.

## Architecture Notes

The core is a scoring model over demand, capacity, latency, risk, and weight. That keeps dry-run output, file plans, and safety rails in one explicit decision path. The threshold is 161, with risk penalty 4, latency penalty 2, and weight bonus 5. The Ruby code keeps the module small and leans on Minitest for direct fixture checks.

## What This Is For

The repository exists to keep a technical idea small enough to reason about. The implementation avoids external dependencies where possible, then uses fixtures to make changes easy to review.

## Useful Pieces

- Uses fixture data to keep file plans changes visible in code review.
- Includes extended examples for safety rails, including `surge` and `degraded`.
- Documents idempotent checks tradeoffs in `docs/operations.md`.
- Runs locally with a single verification command and no external credentials.
- Stores project constants and verification metadata in `metadata/project.json`.

## Case Study

`recovery` is the first example I would inspect because it lands on the `accept` path with a score of 243. The broader file also keeps `degraded` at 65 and `surge` at 281, which gives the model a useful low-to-high spread.

## Project Layout

- `lib`: library code
- `tests`: verification harness
- `fixtures`: compact golden scenarios
- `examples`: expanded scenario set
- `metadata`: project constants and verification metadata
- `docs`: operations and extension notes
- `scripts`: local verification and audit commands

## Tooling

The only required setup is the local Ruby toolchain. After cloning, stay in the repo root so fixture paths resolve correctly.

## Local Workflow

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

This runs the language-level build or test path against the compact fixture set.

## Quality Gate

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/audit.ps1
```

The audit command checks repository structure and README constraints before it delegates to the verifier.

## Scope

The examples cover useful edges, not every edge. A larger version would add malformed-input tests, richer reports, and deeper domain parsers.

## Expansion Ideas

- Add a short report command that prints the score breakdown for a single scenario.
- Add malformed input fixtures so the failure path is as visible as the happy path.
- Split the scoring constants into a typed configuration object and validate it before use.
- Add one more automation fixture that focuses on a malformed or borderline input.
