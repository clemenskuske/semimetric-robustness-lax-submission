import Lax544225.Decomposition
import Lax544225.PartitionRobustness

/-!
---
title: Theorem 5 — Decomposition transfers triviality
type: theorem
---
If a semimetric space has a (μ,ε)-decomposition and each induced subspace admits only trivial (μ,ε)-robust partitions, then the whole space admits only trivial (μ,ε)-robust partitions.

-/

universe u

namespace Lax544225.DecompositionObstruction

open scoped NNReal

open Semimetric Decomposition PartitionRobustness

/-- If a semimetric space has a (μ,ε)-decomposition and each induced subspace admits only trivial (μ,ε)-robust partitions, then the whole space admits only trivial (μ,ε)-robust partitions. -/
axiom statement {S : Type u} (d : Distance S) (hd : IsSemimetric d) (D : Set (Set S))
    (μ ε : ℝ≥0) (hε : 0 < ε) (hD : IsDecomposition d D μ)
    (hlocal : ∀ A ∈ D, OnlyTrivial (restrict d A) μ ε) : OnlyTrivial d μ ε

end Lax544225.DecompositionObstruction
