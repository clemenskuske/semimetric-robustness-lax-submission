import Lax544225.BinaryFloats

/-!
---
title: Proposition 1.2 — Squared float distance
type: proposition
---
The squared difference of φ gives an ordered semimetric space on canonical binary floats with their IEEE category order (Proposition 1.2, p. 8).

-/

universe u

namespace Lax544225.FloatSquaredSpace

open BinaryFloats OrderedSemimetric

/-- The squared difference of φ gives an ordered semimetric space on canonical binary floats with their IEEE category order (Proposition 1.2, p. 8). -/
axiom statement (F : Format) : IsOrdered (squareDistance F) (ieeeLe F)

end Lax544225.FloatSquaredSpace
