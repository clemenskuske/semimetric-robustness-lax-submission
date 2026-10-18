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
attached at the user’s request on 16 October 2026. The paper viewer links 29
passages to all 25 formalized concepts and results. Private working history and
unrelated formalizations are not included.

Validation:

```sh
lax build . --replay
```

Unused helper warnings are intentional: these lemmas validate the
classifier/partition and zero-relaxation definitions and the Flocq correspondence
without adding public result entries.

Formalization credit: Clemens Kuske and Codex (OpenAI).
Source references are recorded in `manifest.yaml`; source code uses Apache 2.0.

Each of Theorems 1–5 is one concept with its full paper statement and one PDF
passage. Covering conditions are written directly in theorem statements; named
shorthands for these conditions are confined to the proof package.

Space-dependent definitions consistently require semimetric or ordered-semimetric
evidence. Partition robustness also requires a valid finite partition. Theorem
statements and proofs pass their existing assumptions through these concepts;
classifier robustness reuses balls, and boundary results reuse the named
complement boundary. Subspace certificates remain proof helpers.

The proof package also translates the floating-point mathematics from the
[reference Flocq development](https://github.com/verinncoq/mueps-robustness-proofs/blob/d0d81caa28f9ffd166ffd245510c99b0db1c2962/flocq_ordered_spaces/semimetrics.v).
`FlocqBridge` maps total precision/exponent parameters and proves exact rational
embeddings agree with the existing real definitions. `FlocqStrict` proves the
strict squared-distance inequality. `FlocqExamples` checks binary64 special
values, list padding and the failure of maximum distance with ordinary pointwise
order, reusing the existing product/list construction proofs. These are
proof-side helpers; the 25 concepts and 14 public claims are unchanged.
This is an independent Lean proof of that mathematical model, not an import of
Rocq proofs or a port of Flocq's rounding library. The reference repository's
standalone `first_formalization/lean` package is maintained separately.

Two Model Validation passage markers open the existing scalar/list proof cards,
which name and link eight checked Flocq-related Lean lemmas. Paper wording is
preserved; these annotations add no concepts or claims.
