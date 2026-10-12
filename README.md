# Relaxing Global Classifier Robustness on Semimetric Spaces

Lean 4 formalization of the mathematical statements in Andrei Aleksandrov and
Kim Völlinger’s supplied FSEN 2027 manuscript.

The package contains 14 definitions and 16 proved paper results: five theorems,
three corollaries, Proposition 1’s constructions, and Lemma 1’s two
counterexamples. Directional arguments and supporting facts are proof lemmas.
The proofs reuse intermediate results with a grounded dependency graph.

Environment: Lean v4.33.0 and mathlib
`db584cd6d46c92f209a44c0f1c829460d327499d`.

Submission identity: **lax-544225**. The manifest requests an unlisted,
replaceable LAX draft. Unlisted content is accessible through its direct link;
this source repository is public. Registration requires a separate instruction.

This repository contains the submission source only. The supplied manuscript,
private working history and unrelated formalizations are not included.

Validation:

```sh
lax build . --replay
```

The nine unused helper warnings are intentional: these lemmas validate the
classifier/partition and zero-relaxation definitions without adding public
result entries.

Formalization credit: Clemens Kuske and Codex (OpenAI).
Source references are recorded in `manifest.yaml`; source code uses Apache 2.0.
