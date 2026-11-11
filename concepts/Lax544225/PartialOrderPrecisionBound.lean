import Lax544225.Decomposition
import Lax544225.PartitionRobustness
import Lax544225.PrecisionGaps
import Lax544225.OrderedSemimetric
import Mathlib.Order.Preorder.Chain

/-!
---
title: Corollary 3 — Precision bound on ordered pieces
type: corollary
---
In a finite partially ordered semimetric space, a (μ,ε)-decomposition into totally ordered pieces admits only trivial robust partitions if ε≥Δᵢδᵢμ+Δᵢ for every piece.

# Formalization notes

`hD` assumes a decomposition, `hchain` says each piece is totally ordered, `hsize` ensures its precision metrics are defined, and `hbound` gives the precision bound on each piece.

For the finite family, bounding every piece is equivalent to bounding the maximum in the paper. Each piece uses its inherited order and interval cardinalities within that piece. The ambient space has at least two elements, as stated in the corollary. Each piece also has at least two elements, as required by the paper’s definition of its corresponding Δᵢ and δᵢ. The totality and nontriviality instances in `hbound` are supplied by `hchain` and `hsize`.
-/

universe u

namespace Lax544225.PartialOrderPrecisionBound

open scoped NNReal

open SemimetricSpace OrderedSemimetric Decomposition PartitionRobustness PrecisionGaps

/-- In a finite partially ordered semimetric space, a (μ,ε)-decomposition into totally ordered pieces admits only trivial robust partitions if ε≥Δᵢδᵢμ+Δᵢ for every piece. -/
axiom corollary3 {S : Type u} [Finite S] [PartialOrder S] [Nontrivial S] (d : Distance S)
    (hd : IsOrderedSemimetricSpace d (· ≤ ·)) (D : Set (Set S)) (μ : ℝ≥0) (ε : ℝ>0)
    (hD : IsDecomposition d hd.1 D μ)
    (hchain : ∀ Dᵢ ∈ D, IsChain (· ≤ ·) Dᵢ)
    (hsize : ∀ Dᵢ ∈ D, Nontrivial Dᵢ)
    (hbound : ∀ (Dᵢ : Set S) (_hmem : Dᵢ ∈ D)
      [Std.Total (α := Dᵢ) (· ≤ ·)] [Nontrivial Dᵢ]
      (hDᵢ : IsOrderedSemimetricSpace (fun x y : Dᵢ => d x.val y.val) (· ≤ ·)),
      threshold (fun x y : Dᵢ => d x.val y.val) hDᵢ μ ≤ ε) : OnlyTrivial d hd.1 μ ε

end Lax544225.PartialOrderPrecisionBound
