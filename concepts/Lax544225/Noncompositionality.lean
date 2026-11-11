import Lax544225.PartitionRobustness

/-!
---
title: Lemma 1 — Noncompositionality of robustness
type: lemma
---
For a semimetric space $(S,d)$, overlapping proper subsets $S_1,S_2$, and
$\mu\geq 0$, $\epsilon>0$, the following implications are false in general:

1. If only the trivial partition on $S_1$ is $(\mu,\epsilon)$-robust, then every
   $(\mu,\epsilon)$-robust partition of $S$ contains a part including $S_1$.
2. If only the trivial partitions on $S_1$ and $S_2$ are $(\mu,\epsilon)$-robust,
   then only the trivial partition on $S_1\cup S_2$ is $(\mu,\epsilon)$-robust.

# Formalization notes

Both implications are refuted by explicit counterexamples on the four-point
line $\{0,1,2,3\}$ with $\mu=\epsilon=1$ and partition
$\{\{0,1\},\{2,3\}\}$. The first uses $S_1=\{1,2\}$; the unused second
subset can be chosen equal to $S_1$. The second uses $S_1=\{0,1,2\}$ and
$S_2=\{1,2,3\}$. The two existential clauses record these counterexamples.
-/

namespace Lax544225.Noncompositionality

open SemimetricSpace Partitions PartitionRobustness

/-- Counterexamples to both compositionality implications in Lemma 1. -/
axiom statement :
    (∃ (d : Distance (Fin 4)) (hd : IsSemimetricSpace d)
      (P : Set (Set (Fin 4))) (hP : IsPartition P) (S₁ : Set (Fin 4)),
    MuEpsilonRobustPartition d hd P hP 1 ⟨1, zero_lt_one⟩ ∧ S₁.Nonempty ∧ S₁ᶜ.Nonempty ∧
    (∀ hS₁ : IsSemimetricSpace (fun x y : S₁ => d x.val y.val),
      OnlyTrivial (fun x y : S₁ => d x.val y.val) hS₁ 1 ⟨1, zero_lt_one⟩) ∧
    ¬ ∃ Sᵢ ∈ P, S₁ ⊆ Sᵢ) ∧
    (∃ (d : Distance (Fin 4)) (hd : IsSemimetricSpace d)
      (S₁ S₂ : Set (Fin 4)) (P : Set (Set (Fin 4))) (hP : IsPartition P),
    S₁ᶜ.Nonempty ∧ S₂ᶜ.Nonempty ∧ (S₁ ∩ S₂).Nonempty ∧ S₁ ∪ S₂ = Set.univ ∧
    (∀ hS₁ : IsSemimetricSpace (fun x y : S₁ => d x.val y.val),
      OnlyTrivial (fun x y : S₁ => d x.val y.val) hS₁ 1 ⟨1, zero_lt_one⟩) ∧
    (∀ hS₂ : IsSemimetricSpace (fun x y : S₂ => d x.val y.val),
      OnlyTrivial (fun x y : S₂ => d x.val y.val) hS₂ 1 ⟨1, zero_lt_one⟩) ∧
    MuEpsilonRobustPartition d hd P hP 1 ⟨1, zero_lt_one⟩ ∧ ¬ IsTrivial P)

end Lax544225.Noncompositionality
