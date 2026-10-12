import Lax544225.ListSpaces

/-!
---
title: Proposition 1.5 — Padded sum lists
type: proposition
---
The padded sum distance with the unit length penalty and equal-length coordinatewise order form an ordered semimetric space (Proposition 1.5, p. 8).

-/

universe u

namespace Lax544225.SumListSpace

open Semimetric OrderedSemimetric ListSpaces

/-- The padded sum distance with the unit length penalty and equal-length coordinatewise order form an ordered semimetric space (Proposition 1.5, p. 8). -/
axiom statement {S : Type u} (d : Distance S) (le : S → S → Prop) (hd : IsOrdered d le)
    (pad : S) : IsOrdered (sumDistance d pad) (listLe le pad)

end Lax544225.SumListSpace
