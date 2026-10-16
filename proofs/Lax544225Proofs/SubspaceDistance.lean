import Lax544225.Semimetric

/-! Proof-side notation for the distance inherited by a subset. -/

universe u

namespace Lax544225Proofs

open Lax544225.Semimetric

/-- The distance inherited by a subset. -/
def restrict {S : Type u} (d : Distance S) (A : Set S) : Distance A :=
  fun x y => d x.val y.val

end Lax544225Proofs
