import Lax544225.Partitions
import Lax544225.Balls

/-!
---
title: Robust and separated partitions
type: definition
---
A partition is (μ,ε)-robust when each input x has a nearby center x′ whose ε-ball and x lie in one part (Definition 8, p. 5). A partition is ε-separated when points in distinct parts are more than ε apart.

# Formalization notes

Partition validity is a separate hypothesis, not built into the robustness predicate. Triviality of every robust partition quantifies over finite valid partitions. Separation uses a strict inequality because balls are closed.
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
