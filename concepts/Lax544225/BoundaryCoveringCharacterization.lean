import Lax544225.Boundary
import Lax544225.OrderedSemimetric

/-!
---
title: Theorem 3 — Boundary covering characterization
type: theorem
---
In a finite totally ordered semimetric space, covering every proper cut is equivalent to covering its within-side μ-ball from the opposite boundary (Theorem 3, p. 10).

# Formalization notes

Both directions are stated together as in the paper. Their separate arguments
remain supporting lemmas in the proof package.
-/

universe u

namespace Lax544225.BoundaryCoveringCharacterization

open scoped NNReal
open Semimetric OrderedSemimetric Covering Boundary

/-- In a finite totally ordered semimetric space, covering every proper cut is equivalent to covering its within-side μ-ball from the opposite boundary (Theorem 3, p. 10). -/
axiom statement {S : Type u} [Finite S] [LinearOrder S] (d : Distance S)
    (hd : IsOrdered d (· ≤ ·)) (μ ε : ℝ≥0) (hε : 0 < ε) :
    EveryCutCovered d μ ε ↔ EveryCutBoundaryCovered d μ ε

end Lax544225.BoundaryCoveringCharacterization
