import Lax544225.Boundary
import Lax544225.PartitionRobustness
import Lax544225.OrderedSemimetric

/-!
---
title: Corollary 1 — Boundary criterion for triviality
type: corollary
---
In a finite totally ordered semimetric space, only-trivial robustness is equivalent to opposite-boundary covering of every nonempty proper cut.

# Formalization notes

Both directions are stated together as in the paper. Their separate arguments
remain supporting lemmas in the proof package.
-/

universe u

namespace Lax544225.BoundaryExistence

open scoped NNReal
open SemimetricSpace OrderedSemimetric PartitionRobustness Boundary Balls

/-- In a finite totally ordered semimetric space, only-trivial robustness is equivalent to opposite-boundary covering of every nonempty proper cut. -/
axiom statement {S : Type u} [Finite S] [LinearOrder S] (d : Distance S)
    (hd : IsOrderedSemimetricSpace d (· ≤ ·)) (μ ε : ℝ≥0) (hε : 0 < ε) :
    OnlyTrivial d hd.1 μ ε hε ↔ (∀ S' : Set S, S'.Nonempty → S'ᶜ.Nonempty →
      ∃ x, (x ∈ S' ∧ ball d hd.1 x μ ∩ S' ⊆ neighborhood d hd.1 (complementBoundary S') ε) ∨
        (x ∈ S'ᶜ ∧ ball d hd.1 x μ ∩ S'ᶜ ⊆ neighborhood d hd.1 (boundary S') ε))

end Lax544225.BoundaryExistence
