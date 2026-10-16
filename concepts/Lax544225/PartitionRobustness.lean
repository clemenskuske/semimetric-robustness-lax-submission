import Lax544225.Partitions
import Lax544225.Balls

/-!
---
title: (μ,ε)-Robustness of a Partition
type: definition
---
Let $(S,d)$ be a semimetric space. A partition $P:=\{S_1,\dots,S_p\}$ of $S$
is **globally robust** for $\mu\geq0$, $\epsilon>0$ if and only if

$$\forall x\in S\;\exists x'\in B(x,\mu)\;
\left[\bigvee_{i\in[p]}\bigl(\{x\}\cup B(x',\epsilon)\subseteq S_i\bigr)\right].$$

# Formalization notes

Partition validity is a separate hypothesis, not built into the robustness predicate. Triviality of every robust partition quantifies over finite valid partitions. Separation uses a strict inequality because balls are closed.

The auxiliary separation predicate requires $\epsilon<d(x,y)$ for points in distinct parts.
-/

universe u

namespace Lax544225.PartitionRobustness

open scoped NNReal

open Semimetric Partitions Balls
/-- Coverage by monochromatic balls whose centers are μ-close to the input. -/
def Robust {S : Type u} (d : Distance S) (P : Set (Set S)) (μ ε : ℝ≥0) : Prop :=
  ∀ x, ∃ x', x' ∈ ball d x μ ∧ ∃ A ∈ P, x ∈ A ∧ ball d x' ε ⊆ A

/-- Distinct parts are separated by distance strictly greater than ε. -/
def Separated {S : Type u} (d : Distance S) (P : Set (Set S)) (ε : ℝ≥0) : Prop :=
  ∀ A ∈ P, ∀ B ∈ P, A ≠ B → ∀ x ∈ A, ∀ y ∈ B, ε < d x y

/-- Every robust finite partition of the carrier has only the whole carrier as a part. -/
def OnlyTrivial {S : Type u} (d : Distance S) (μ ε : ℝ≥0) : Prop :=
  ∀ P, IsPartition P → Robust d P μ ε → IsTrivial P

end Lax544225.PartitionRobustness
