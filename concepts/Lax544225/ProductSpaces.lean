import Lax544225.OrderedSemimetric
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Data.Finset.Lattice.Fold

/-!
---
title: Sum and synchronized maximum product distances
type: definition
---
On n-tuples, the sum distance uses the product partial order. The maximum distance uses the synchronized subrelation of that order: every coordinate changes by the same base distance. The maximum construction requires the base distance to be additive on chains (Proposition 1.3–1.4, p. 8).

# Formalization notes

Coordinates are Fin n; n=0 gives the singleton empty tuple. The maximum of no coordinate distances is 0. Non-strict relations include equality, as required of a partial order; the paper’s strict notation denotes their strict part.
-/

universe u

namespace Lax544225.ProductSpaces

open Semimetric
open scoped BigOperators
/-- Coordinatewise order on finite tuples. -/
def productLe {S : Type u} (le : S → S → Prop) (n : ℕ) (f g : Fin n → S) : Prop :=
  ∀ i, le (f i) (g i)

/-- Coordinatewise order restricted to equal distances in every coordinate. -/
def synchronizedLe {S : Type u} (d : Distance S) (le : S → S → Prop) (n : ℕ)
    (f g : Fin n → S) : Prop :=
  productLe le n f g ∧ ∀ i j, d (f i) (g i) = d (f j) (g j)

/-- Sum of the base distances between corresponding coordinates. -/
noncomputable def sumDistance {S : Type u} (d : Distance S) (n : ℕ) : Distance (Fin n → S) :=
  fun f g => ∑ i, d (f i) (g i)

/-- Maximum of the base distances between corresponding coordinates. -/
noncomputable def maxDistance {S : Type u} (d : Distance S) (n : ℕ) : Distance (Fin n → S) :=
  fun f g => Finset.univ.sup (fun i => d (f i) (g i))

end Lax544225.ProductSpaces
