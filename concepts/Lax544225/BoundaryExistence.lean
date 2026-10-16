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
open Semimetric OrderedSemimetric PartitionRobustness Boundary

/-- In a finite totally ordered semimetric space, only-trivial robustness is equivalent to opposite-boundary covering of every nonempty proper cut. -/
axiom statement {S : Type u} [Finite S] [LinearOrder S] (d : Distance S)
    (hd : IsOrdered d (· ≤ ·)) (μ ε : ℝ≥0) (hε : 0 < ε) :
    OnlyTrivial d μ ε ↔ EveryCutBoundaryCovered d μ ε

end Lax544225.BoundaryExistence
