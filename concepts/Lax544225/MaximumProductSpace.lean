import Lax544225.ProductSpaces

/-!
---
title: Proposition 1.4 — Synchronized maximum products
type: proposition
---
The maximum distance and synchronized order on finite tuples form an ordered semimetric space whenever the base is ordered semimetric and additive on chains (Proposition 1.4, p. 8).

-/

universe u

namespace Lax544225.MaximumProductSpace

open Semimetric OrderedSemimetric ProductSpaces

/-- The maximum distance and synchronized order on finite tuples form an ordered semimetric space whenever the base is ordered semimetric and additive on chains (Proposition 1.4, p. 8). -/
axiom statement {S : Type u} (d : Distance S) (le : S → S → Prop)
    (hd : IsOrdered d le) (hadd : Additive d le) (n : ℕ) :
    IsOrdered (maxDistance d n) (synchronizedLe d le n)

end Lax544225.MaximumProductSpace
