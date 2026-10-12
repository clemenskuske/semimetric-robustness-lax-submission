import Lax544225.Boundary
import Lax544225.PrecisionGaps
import Lax544225.OrderedSemimetric

/-!
---
title: Theorem 4 — Successor covering at the precision bound
type: theorem
---
In a finite totally ordered semimetric space, ε≥Δδμ+Δ implies B(x,μ)⊆B(y,ε) whenever y is the immediate successor of x (Theorem 4, p. 12).

-/

universe u

namespace Lax544225.SuccessorCovering

open scoped NNReal

open Semimetric OrderedSemimetric Balls Boundary PrecisionGaps

/-- In a finite totally ordered semimetric space, ε≥Δδμ+Δ implies B(x,μ)⊆B(y,ε) whenever y is the immediate successor of x (Theorem 4, p. 12). -/
axiom statement {S : Type u} [Finite S] [LinearOrder S] (d : Distance S)
    (hd : IsOrdered d (· ≤ ·)) (μ ε : ℝ≥0) (hε : 0 < ε)
    (hbound : threshold d μ ≤ ε) (x y : S) (hxy : Successor x y) :
    ball d x μ ⊆ ball d y ε

end Lax544225.SuccessorCovering
