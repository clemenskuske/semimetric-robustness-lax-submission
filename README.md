# Relaxing Global Classifier Robustness on Semimetric Spaces

Lean 4 formalization of the mathematical statements in Andrei Aleksandrov and
Kim Völlinger’s supplied FSEN 2027 manuscript.

The package contains 25 concepts: 16 definitions, five theorems, three
corollaries, and one lemma combining Lemma 1's two counterexamples. Each of
Proposition 1's five constructions has its own definition card and proof that
it is an ordered semimetric space. The fifth contains both list extensions.
All 14 claims are proved, with squared distance reusing absolute distance and
the list extensions reusing the product results. Supporting facts are lemmas.

Environment: Lean v4.33.0 and mathlib
`db584cd6d46c92f209a44c0f1c829460d327499d`.

Submission identity: **lax-544225**. The manifest requests an unlisted,
replaceable LAX draft. Unlisted content is accessible through its direct link;
this source repository is public. Registration requires a separate instruction.

This repository contains the Lean submission and the author-supplied TeX paper,
attached at the user’s request on 16 October 2026. The paper viewer links 27
passages to all 25 formalized concepts and results. Private working history and
unrelated formalizations are not included.

Validation:

```sh
lax build . --replay
```

The nine unused helper warnings are intentional: these lemmas validate the
classifier/partition and zero-relaxation definitions without adding public
result entries.

Formalization credit: Clemens Kuske and Codex (OpenAI).
Source references are recorded in `manifest.yaml`; source code uses Apache 2.0.

Each of Theorems 1–5 is one concept with its full paper statement and one PDF
passage. Covering conditions are written directly in theorem statements; named
shorthands for these conditions are confined to the proof package.
