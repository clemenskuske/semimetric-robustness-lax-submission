import Lax544225.Decomposition
import Lax544225.PartitionRobustness
import Lax544225.PrecisionGaps
import Lax544225.OrderedSemimetric

/-!
---
title: Corollary 3 — Precision bound on ordered pieces
type: corollary
---
In a finite partially ordered semimetric space, a (μ,ε)-decomposition into totally ordered pieces admits only trivial robust partitions if ε≥Δᵢδᵢμ+Δᵢ for every piece (Corollary 3, p. 14).

# Formalization notes

For the finite family, bounding every piece is equivalent to bounding the maximum in the paper. Each piece uses its inherited order and interval cardinalities within that piece. Singleton pieces have Δᵢ=δᵢ=0 and automatically satisfy the bound, resolving the paper’s unspecified case without adding a size assumption.
-/

universe u

namespace Lax544225.PartialOrderPrecisionBound

open scoped NNReal

open Semimetric OrderedSemimetric Decomposition PartitionRobustness PrecisionGaps

/-- In a finite partially ordered semimetric space, a (μ,ε)-decomposition into totally ordered pieces admits only trivial robust partitions if ε≥Δᵢδᵢμ+Δᵢ for every piece (Corollary 3, p. 14). -/
axiom statement {S : Type u} [Finite S] [PartialOrder S] (d : Distance S)
    (hd : IsOrdered d (· ≤ ·)) (D : Set (Set S)) (μ ε : ℝ≥0) (hε : 0 < ε)
    (hD : IsDecomposition d D μ)
    (hchain : ∀ A ∈ D, ∀ x ∈ A, ∀ y ∈ A, x ≤ y ∨ y ≤ x)
    (hbound : ∀ A ∈ D, threshold (restrict d A) μ ≤ ε) : OnlyTrivial d μ ε

end Lax544225.PartialOrderPrecisionBound
