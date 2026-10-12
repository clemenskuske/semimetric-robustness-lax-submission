import Lax544225.BinaryFloats

/-!
---
title: Proposition 1.1 — Absolute float distance
type: proposition
---
The absolute difference of φ gives an ordered semimetric space on canonical binary floats with their IEEE category order (Proposition 1.1, p. 8).

-/

universe u

namespace Lax544225.FloatAbsoluteSpace

open BinaryFloats OrderedSemimetric

/-- The absolute difference of φ gives an ordered semimetric space on canonical binary floats with their IEEE category order (Proposition 1.1, p. 8). -/
axiom statement (F : Format) : IsOrdered (absDistance F) (ieeeLe F)

end Lax544225.FloatAbsoluteSpace
