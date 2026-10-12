import Lax544225.Semimetric
import Mathlib.Order.Defs.PartialOrder

/-!
---
title: Ordered semimetric spaces
type: definition
---
An ordered semimetric space has a partial order with d(a,b)+d(b,c)≤d(a,c) whenever a≤b≤c (Definition 9, p. 7). An additive ordered distance satisfies equality on these chains.

# Formalization notes

The order is an explicit non-strict relation. IsPartialOrder provides reflexivity, transitivity, and antisymmetry. The reverse triangle inequality is imposed only on ordered chains. Additivity is an additional property needed for synchronized maximum distances.
-/

universe u

namespace Lax544225.OrderedSemimetric

open Semimetric
/-- The semimetric, partial-order, and ordered-chain distance laws. -/
def IsOrdered {S : Type u} (d : Distance S) (le : S → S → Prop) : Prop :=
  IsSemimetric d ∧ IsPartialOrder S le ∧
    (∀ a b c, le a b → le b c → d a b + d b c ≤ d a c)

/-- Exact additivity of distance along the given ordered chains. -/
def Additive {S : Type u} (d : Distance S) (le : S → S → Prop) : Prop :=
  ∀ a b c, le a b → le b c → d a c = d a b + d b c

end Lax544225.OrderedSemimetric
