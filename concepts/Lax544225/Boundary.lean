import Lax544225.Covering
import Mathlib.Order.Interval.Set.Basic

/-!
---
title: Successors and cut boundaries
type: definition
---
In a total order, y is the immediate successor of x when x<y and no point lies strictly between them. The boundary of a subset consists of its points adjacent to a point outside it. The complement boundary is the boundary of the complement (Section 5.2, p. 10).

# Formalization notes

The boundary covering condition restricts the μ-ball to the side containing its center, and uses ε-balls centered in the boundary on the opposite side. This preserves the two distinct boundaries in Theorem 3.
-/

universe u

namespace Lax544225.Boundary

open scoped NNReal

open Semimetric Balls
/-- Consecutive points in a linear order. -/
def Successor {S : Type u} [LinearOrder S] (x y : S) : Prop :=
  x < y ∧ ¬ ∃ z, x < z ∧ z < y

/-- Points of A adjacent to its complement in the ambient order. -/
def boundary {S : Type u} [LinearOrder S] (A : Set S) : Set S :=
  {x | x ∈ A ∧ ∃ y ∈ Aᶜ, Successor x y ∨ Successor y x}

/-- Every nontrivial cut has a side-restricted μ-ball covered by the opposite boundary. -/
def EveryCutBoundaryCovered {S : Type u} [LinearOrder S] (d : Distance S)
    (μ ε : ℝ≥0) : Prop :=
  ∀ A : Set S, A.Nonempty → Aᶜ.Nonempty →
    ∃ x, (x ∈ A ∧ ball d x μ ∩ A ⊆ neighborhood d (boundary Aᶜ) ε) ∨
      (x ∈ Aᶜ ∧ ball d x μ ∩ Aᶜ ⊆ neighborhood d (boundary A) ε)

end Lax544225.Boundary
