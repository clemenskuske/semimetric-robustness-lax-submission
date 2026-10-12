We formalize the mathematical statements of Andrei Aleksandrov and Kim
Völlinger's *Relaxing Global Classifier Robustness on Semimetric Spaces*.
A classifier is (μ,ε)-robust when every input lies within μ of a same-label
point whose closed ε-ball has a constant label.

The concept package includes the covering characterization, the general and
finite-order existence criteria, the precision obstruction Δδμ+Δ, the
noncompositional counterexamples, and the transfer theorem for closed
overlapping decompositions. It also specifies the canonical single-NaN binary
floating-point model, its absolute and squared embedded distances, and the sum
and synchronized maximum constructions on vectors and padded lists.

The public results follow the paper’s structure: five theorems, three
corollaries, Proposition 1’s constructions, and the two counterexamples of
Lemma 1. Equivalences are presented once; their directional arguments and other
supporting facts are separate proof lemmas. All 16 public results are proved in
Lean, reusing intermediate covering, existence, precision and construction
results. The complete package passes LAX validation and kernel replay.
