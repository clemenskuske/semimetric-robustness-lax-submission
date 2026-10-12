import Lax544225.PartitionRobustness

/-!
---
title: Lemma 1.2 — Union counterexample
type: lemma
---
Two nonempty proper overlapping subsets can each admit only trivial (1,1)-robust partitions while their union is a four-point space admitting a nontrivial (1,1)-robust partition (Lemma 1.2, p. 13).

# Formalization notes

The paper’s witness is the line {0,1,2,3} with A={0,1,2}, B={1,2,3}, and the two-part partition {{0,1},{2,3}}. The conjunction describes this single counterexample witness.
-/

universe u

namespace Lax544225.UnionCounterexample

open Semimetric Partitions PartitionRobustness

/-- Two nonempty proper overlapping subsets can each admit only trivial (1,1)-robust partitions while their union is a four-point space admitting a nontrivial (1,1)-robust partition (Lemma 1.2, p. 13). -/
axiom statement : ∃ (d : Distance (Fin 4)) (A B : Set (Fin 4)) (P : Set (Set (Fin 4))),
    IsSemimetric d ∧ Aᶜ.Nonempty ∧ Bᶜ.Nonempty ∧ (A ∩ B).Nonempty ∧
    A ∪ B = Set.univ ∧ OnlyTrivial (restrict d A) 1 1 ∧
    OnlyTrivial (restrict d B) 1 1 ∧ IsPartition P ∧ Robust d P 1 1 ∧ ¬ IsTrivial P

end Lax544225.UnionCounterexample
