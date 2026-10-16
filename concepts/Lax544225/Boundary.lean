import Lax544225.Covering
import Mathlib.Order.Cover

/-!
---
title: Successor and Boundary
type: definition
---
In a totally ordered semimetric space $(S,<,d)$, $Succ(x,y)$ holds if
$x<y$ and there is no $z$ with $x<z<y$.
For each subset $S'\subseteq S$, its **boundary** is

$$\partial S':=\{x\in S'\mid\exists y\notin S',\ Succ(x,y)\lor Succ(y,x)\},$$

and its **complement boundary** is

$$\overline{\partial}S':=\{x\notin S'\mid\exists y\in S',\ Succ(x,y)\lor Succ(y,x)\}.$$

# Formalization notes

Successor is the standard mathlib cover relation `CovBy`, with the paper's name retained as an alias.

The boundary covering condition restricts the μ-ball to the side containing its center, and uses ε-balls centered in the boundary on the opposite side. This preserves the two distinct boundaries in Theorem 3.
-/

universe u

namespace Lax544225.Boundary

open scoped NNReal

open Semimetric Balls
/-- Consecutive points in a linear order. -/
abbrev Successor {S : Type u} [LinearOrder S] (x y : S) : Prop :=
  CovBy x y

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
