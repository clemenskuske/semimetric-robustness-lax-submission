import Lax544225.PartitionRobustness
import Lax544225.Covering

/-!
---
title: Theorem 1 — Covering characterization of robustness
type: theorem
---
A finite partition is (μ,ε)-robust exactly when no μ-ball centered in a part is covered by ε-balls from its complement (Theorem 1, p. 6).

# Formalization notes

Both directions are stated together as in the paper. Their separate arguments
remain supporting lemmas in the proof package.
-/

universe u

namespace Lax544225.CoveringCharacterization

open scoped NNReal
open Semimetric Partitions PartitionRobustness Covering

/-- A finite partition is (μ,ε)-robust exactly when no μ-ball centered in a part is covered by ε-balls from its complement (Theorem 1, p. 6). -/
axiom statement {S : Type u} (d : Distance S) (hd : IsSemimetric d) (P : Set (Set S))
    (hP : IsPartition P) (μ ε : ℝ≥0) (hε : 0 < ε) :
    Robust d P μ ε ↔ Uncovered d P μ ε

end Lax544225.CoveringCharacterization
