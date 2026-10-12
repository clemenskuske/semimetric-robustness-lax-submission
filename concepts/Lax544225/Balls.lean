import Lax544225.Semimetric
import Mathlib.Data.Set.Lattice

/-!
---
title: Closed balls and neighborhoods
type: definition
---
The closed ball B(x,r) consists of inputs at distance at most r from x. The r-neighborhood of a set is the union of balls centered in that set (Definition 7, p. 5).

# Formalization notes

Closed inequalities are essential: an input at distance exactly ε must have the same label. Ball membership uses d(y,x), matching the paper.
-/

universe u

namespace Lax544225.Balls

open scoped NNReal

open Semimetric
/-- The closed ball centered at x with radius r. -/
def ball {S : Type u} (d : Distance S) (x : S) (r : ℝ≥0) : Set S :=
  {y | d y x ≤ r}

/-- The union of closed r-balls with centers in A. -/
def neighborhood {S : Type u} (d : Distance S) (A : Set S) (r : ℝ≥0) : Set S :=
  {y | ∃ x ∈ A, y ∈ ball d x r}

end Lax544225.Balls
