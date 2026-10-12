import Lax544225.ProductSpaces
import Mathlib.Data.List.GetD

/-!
---
title: Padded list distances
type: definition
---
For finite lists, distances compare coordinates through the longer length, padding missing entries by a chosen point. A distance penalty of 1 is added for different lengths. Orders compare only equal-length lists, using the product or synchronized relation (Proposition 1.5, p. 8).

# Formalization notes

The floating-point instance chooses NaN as padding. Without the length penalty, appending NaN would give distance zero between different lists. The list maximum construction uses an additive base distance just as the fixed-length construction does.
-/

universe u

namespace Lax544225.ListSpaces

open scoped NNReal

open Semimetric
open scoped BigOperators
/-- Equal-length lists ordered coordinatewise; other lengths are incomparable. -/
def listLe {S : Type u} (le : S → S → Prop) (pad : S) (f g : List S) : Prop :=
  f.length = g.length ∧ ∀ i < f.length, le (f.getD i pad) (g.getD i pad)

/-- Equal-length coordinatewise order with equal base distances across coordinates. -/
def synchronizedListLe {S : Type u} (d : Distance S) (le : S → S → Prop)
    (pad : S) (f g : List S) : Prop :=
  listLe le pad f g ∧ ∀ i < f.length, ∀ j < f.length,
    d (f.getD i pad) (g.getD i pad) = d (f.getD j pad) (g.getD j pad)

/-- A positive penalty that distinguishes different list lengths. -/
def lengthPenalty {S : Type u} (f g : List S) : ℝ≥0 :=
  if f.length = g.length then 0 else 1

/-- Sum of padded coordinate distances, plus the length penalty. -/
noncomputable def sumDistance {S : Type u} (d : Distance S) (pad : S) : Distance (List S) :=
  fun f g => lengthPenalty f g +
    ∑ i ∈ Finset.range (max f.length g.length), d (f.getD i pad) (g.getD i pad)

/-- Maximum padded coordinate distance, plus the length penalty. -/
noncomputable def maxDistance {S : Type u} (d : Distance S) (pad : S) : Distance (List S) :=
  fun f g => lengthPenalty f g +
    (Finset.range (max f.length g.length)).sup (fun i => d (f.getD i pad) (g.getD i pad))

end Lax544225.ListSpaces
