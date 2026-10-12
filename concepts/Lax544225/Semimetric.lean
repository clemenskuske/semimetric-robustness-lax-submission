import Mathlib.Data.NNReal.Basic

/-!
---
title: Semimetric spaces
type: definition
---
A semimetric space is a nonempty set equipped with a symmetric, nonnegative real distance that is zero exactly on equal inputs. No triangle inequality is imposed (Definition 2, p. 3).

# Formalization notes

The codomain ℝ≥0 supplies nonnegativity. The carrier is a type; nonemptiness is part of the predicate. Subspaces carry the restriction of the same distance.
-/

universe u

namespace Lax544225.Semimetric

open scoped NNReal

/-- A nonnegative real-valued distance on a carrier. -/
abbrev Distance (S : Type u) := S → S → ℝ≥0

/-- The defining properties of a semimetric space, including a nonempty carrier. -/
def IsSemimetric {S : Type u} (d : Distance S) : Prop :=
  Nonempty S ∧ (∀ x y, d x y = 0 ↔ x = y) ∧ (∀ x y, d x y = d y x)

/-- The distance inherited by a subset. -/
def restrict {S : Type u} (d : Distance S) (A : Set S) : Distance A :=
  fun x y => d x.val y.val

end Lax544225.Semimetric
