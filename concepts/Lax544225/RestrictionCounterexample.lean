import Lax544225.PartitionRobustness

/-!
---
title: Lemma 1.1 — Restriction counterexample
type: lemma
---
There is a four-point semimetric space with a nontrivial (1,1)-robust partition and a nonempty proper subset on which only the trivial partition is robust, although no global part contains that subset (Lemma 1.1, p. 13).

# Formalization notes

This is an existential counterexample, not a universally quantified false implication. The paper’s witness is the line {0,1,2,3}, partitioned into {0,1} and {2,3}, with A={1,2}.
-/

universe u

namespace Lax544225.RestrictionCounterexample

open Semimetric Partitions PartitionRobustness

/-- There is a four-point semimetric space with a nontrivial (1,1)-robust partition and a nonempty proper subset on which only the trivial partition is robust, although no global part contains that subset (Lemma 1.1, p. 13). -/
axiom statement : ∃ (d : Distance (Fin 4)) (P : Set (Set (Fin 4))) (A : Set (Fin 4)),
    IsSemimetric d ∧ IsPartition P ∧ Robust d P 1 1 ∧
    A.Nonempty ∧ Aᶜ.Nonempty ∧ OnlyTrivial (restrict d A) 1 1 ∧
    ¬ ∃ B ∈ P, A ⊆ B

end Lax544225.RestrictionCounterexample
