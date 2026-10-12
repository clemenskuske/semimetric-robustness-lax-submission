import Lax544225.ListSpaces

/-!
---
title: Proposition 1.5 — Padded synchronized maximum lists
type: proposition
---
The padded maximum distance with the unit length penalty and synchronized equal-length order form an ordered semimetric space when the base is additive on chains (Proposition 1.5, p. 8).

-/

universe u

namespace Lax544225.MaximumListSpace

open Semimetric OrderedSemimetric ListSpaces

/-- The padded maximum distance with the unit length penalty and synchronized equal-length order form an ordered semimetric space when the base is additive on chains (Proposition 1.5, p. 8). -/
axiom statement {S : Type u} (d : Distance S) (le : S → S → Prop)
    (hd : IsOrdered d le) (hadd : Additive d le) (pad : S) :
    IsOrdered (maxDistance d pad) (synchronizedListLe d le pad)

end Lax544225.MaximumListSpace
