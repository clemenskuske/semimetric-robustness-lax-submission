import Lax544225.BinaryFloats
import Lax544225.ProductSpaces
import Lax544225.ListSpaces

/-!
---
title: Proposition 1 — Ordered semimetric constructions
type: proposition
---
The following are ordered semimetric spaces:

1. Canonical binary floats with absolute embedded distance and the IEEE category order.
2. Canonical binary floats with squared embedded distance and the same order.
3. Finite sum products with the coordinatewise order.
4. Finite maximum products with the synchronized order, provided the base distance
   is additive along ordered chains.
5. The padded finite-list extensions of the sum and synchronized maximum
   constructions, with a unit penalty for unequal lengths and comparisons only
   between lists of equal length. The maximum construction requires the same
   base additivity.

The product and list constructions apply to any ordered semimetric base space.
For the floating-point list instances, the padding value is NaN.
-/

universe u

namespace Lax544225.OrderedSemimetricConstructions

open Semimetric OrderedSemimetric

/-- The five ordered semimetric constructions of Proposition 1. -/
axiom statement :
    (∀ F : BinaryFloats.Format,
      IsOrdered (BinaryFloats.absDistance F) (BinaryFloats.ieeeLe F)) ∧
    (∀ F : BinaryFloats.Format,
      IsOrdered (BinaryFloats.squareDistance F) (BinaryFloats.ieeeLe F)) ∧
    (∀ {S : Type u} (d : Distance S) (le : S → S → Prop),
      IsOrdered d le → ∀ n : ℕ,
        IsOrdered (ProductSpaces.sumDistance d n) (ProductSpaces.productLe le n)) ∧
    (∀ {S : Type u} (d : Distance S) (le : S → S → Prop),
      IsOrdered d le → Additive d le → ∀ n : ℕ,
        IsOrdered (ProductSpaces.maxDistance d n) (ProductSpaces.synchronizedLe d le n)) ∧
    ((∀ {S : Type u} (d : Distance S) (le : S → S → Prop),
      IsOrdered d le → ∀ pad : S,
        IsOrdered (ListSpaces.sumDistance d pad) (ListSpaces.listLe le pad)) ∧
     (∀ {S : Type u} (d : Distance S) (le : S → S → Prop),
      IsOrdered d le → Additive d le → ∀ pad : S,
        IsOrdered (ListSpaces.maxDistance d pad) (ListSpaces.synchronizedListLe d le pad)))

end Lax544225.OrderedSemimetricConstructions
