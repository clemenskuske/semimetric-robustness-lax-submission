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

Each clause negates a proposed universal implication. In the second clause,
the ambient carrier is the union of the two subsets. Concrete spaces, radii,
and partitions belong to the proof.
-/

namespace Lax544225.Noncompositionality

open scoped NNReal

open SemimetricSpace Partitions PartitionRobustness

/-- Neither restriction nor gluing preserves the stated triviality properties in general. -/
axiom statement :
    (¬ ∀ (S : Type) (d : Distance S) (hd : IsSemimetricSpace d)
      (μ : ℝ≥0) (ε : ℝ>0) (S₁ : Set S)
      (hS₁ : IsSemimetricSpace (fun x y : S₁ => d x.val y.val)),
      S₁ᶜ.Nonempty →
      OnlyTrivial (fun x y : S₁ => d x.val y.val) hS₁ μ ε →
      ∀ (P : Set (Set S)) (hP : IsPartition P),
        MuEpsilonRobustPartition d hd P hP μ ε → ∃ Sᵢ ∈ P, S₁ ⊆ Sᵢ) ∧
    (¬ ∀ (S : Type) (d : Distance S) (hd : IsSemimetricSpace d)
      (μ : ℝ≥0) (ε : ℝ>0) (S₁ S₂ : Set S)
      (hS₁ : IsSemimetricSpace (fun x y : S₁ => d x.val y.val))
      (hS₂ : IsSemimetricSpace (fun x y : S₂ => d x.val y.val)),
      S₁ᶜ.Nonempty → S₂ᶜ.Nonempty → (S₁ ∩ S₂).Nonempty → S₁ ∪ S₂ = Set.univ →
      OnlyTrivial (fun x y : S₁ => d x.val y.val) hS₁ μ ε →
      OnlyTrivial (fun x y : S₂ => d x.val y.val) hS₂ μ ε →
      OnlyTrivial d hd μ ε)

end Lax544225.Noncompositionality
