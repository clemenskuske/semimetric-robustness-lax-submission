import Lax544225.ProductSpaces

/-!
---
title: Proposition 1.3 — Sum products
type: proposition
---
The sum distance and coordinatewise order on finite tuples form an ordered semimetric space whenever the base is one (Proposition 1.3, p. 8).

-/

universe u

namespace Lax544225.SumProductSpace

open Semimetric OrderedSemimetric ProductSpaces

/-- The sum distance and coordinatewise order on finite tuples form an ordered semimetric space whenever the base is one (Proposition 1.3, p. 8). -/
axiom statement {S : Type u} (d : Distance S) (le : S → S → Prop)
    (hd : IsOrdered d le) (n : ℕ) : IsOrdered (sumDistance d n) (productLe le n)

end Lax544225.SumProductSpace
