import Lax544225.Balls

/-!
---
title: Covering obstructions
type: definition
---
The partition covering condition says that the μ-ball of a point in a part is not covered by ε-balls centered outside that part. The global cut obstruction requires every nonempty proper subset to have a point on one side whose μ-ball is covered from the other side (Theorems 1–2, pp. 6, 9).

# Formalization notes

A proper nonempty subset has both itself and its complement nonempty. Neither the empty cut nor the whole carrier is tested. These predicates describe the covering conditions independently of robustness.
-/

universe u

namespace Lax544225.Covering

open scoped NNReal

open Semimetric Balls
/-- No μ-ball centered in a part is covered by ε-balls from its complement. -/
def Uncovered {S : Type u} (d : Distance S) (P : Set (Set S)) (μ ε : ℝ≥0) : Prop :=
  ∀ A ∈ P, ∀ x ∈ A, ¬ ball d x μ ⊆ neighborhood d Aᶜ ε

/-- Every nontrivial cut admits an opposite-side covering obstruction. -/
def EveryCutCovered {S : Type u} (d : Distance S) (μ ε : ℝ≥0) : Prop :=
  ∀ A : Set S, A.Nonempty → Aᶜ.Nonempty →
    ∃ x, (x ∈ A ∧ ball d x μ ⊆ neighborhood d Aᶜ ε) ∨
      (x ∈ Aᶜ ∧ ball d x μ ⊆ neighborhood d A ε)

end Lax544225.Covering
