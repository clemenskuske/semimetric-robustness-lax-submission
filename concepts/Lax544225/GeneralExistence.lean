import Lax544225.PartitionRobustness
import Lax544225.Covering

/-!
---
title: Theorem 2 — General existence criterion
type: theorem
---
The trivial partition is the only robust partition exactly when every nonempty proper cut admits a covering point on one side from ε-balls centered on the other side (Theorem 2, p. 9).

# Formalization notes

Both directions are stated together as in the paper. Their separate arguments
remain supporting lemmas in the proof package.
-/

universe u

namespace Lax544225.GeneralExistence

open scoped NNReal
open Semimetric PartitionRobustness Covering

/-- The trivial partition is the only robust partition exactly when every nonempty proper cut admits a covering point on one side from ε-balls centered on the other side (Theorem 2, p. 9). -/
axiom statement {S : Type u} (d : Distance S) (hd : IsSemimetric d)
    (μ ε : ℝ≥0) (hε : 0 < ε) :
    OnlyTrivial d μ ε ↔ EveryCutCovered d μ ε

end Lax544225.GeneralExistence
