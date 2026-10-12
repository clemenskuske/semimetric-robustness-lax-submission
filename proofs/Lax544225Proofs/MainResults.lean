import Lax544225.CoveringCharacterization
import Lax544225.GeneralExistence
import Lax544225.BoundaryCoveringCharacterization
import Lax544225.BoundaryExistence
import Lax544225Proofs.Basic
import Lax544225Proofs.Existence
import Lax544225Proofs.OrderedBounds

universe u

namespace Lax544225Proofs.MainResults

open scoped NNReal
open Lax544225 Semimetric Partitions PartitionRobustness Covering
  OrderedSemimetric Boundary

/--
---
conclusion: Lax544225.CoveringCharacterization.statement
---
Theorem 1: robustness is equivalent to failure of opposite-part coverage.

# Proof strategy

Combine the two supporting implications. A robust center avoids the
ε-neighborhood of the complement of its part. Conversely, an uncovered μ-ball
supplies a center whose ε-ball stays within the selected part.

# Attribution

Theorem 1 of Aleksandrov and Völlinger, *Relaxing Global Classifier Robustness
on Semimetric Spaces*, supplied FSEN 2027 manuscript, p. 6.
-/
theorem coveringCharacterization {S : Type u} (d : Distance S)
    (hd : IsSemimetric d) (P : Set (Set S)) (hP : IsPartition P)
    (μ ε : ℝ≥0) (hε : 0 < ε) :
    Robust d P μ ε ↔ Uncovered d P μ ε :=
  ⟨Basic.robustToUncovered d hd P hP μ ε hε,
    Basic.uncoveredToRobust d hd P hP μ ε hε⟩

/--
---
conclusion: Lax544225.GeneralExistence.statement
---
Theorem 2: only-trivial robustness is equivalent to coverage of every proper cut.

# Proof strategy

Combine the two cut arguments, using Theorem 1. An uncovered proper cut and its
complement give a nontrivial robust partition. In the converse direction, a
proper part of a robust partition contradicts coverage of that cut.

# Attribution

Theorem 2 of Aleksandrov and Völlinger, *Relaxing Global Classifier Robustness
on Semimetric Spaces*, supplied FSEN 2027 manuscript, p. 9.
-/
theorem generalExistence {S : Type u} (d : Distance S) (hd : IsSemimetric d)
    (μ ε : ℝ≥0) (hε : 0 < ε) :
    OnlyTrivial d μ ε ↔ EveryCutCovered d μ ε :=
  ⟨Existence.trivialityToCutCovering d hd μ ε hε,
    Existence.cutCoveringToTriviality d hd μ ε hε⟩

/--
---
conclusion: Lax544225.BoundaryCoveringCharacterization.statement
---
Theorem 3: cut covering is equivalent to covering from opposite boundaries.

# Proof strategy

Combine the two supporting implications. Between a covered within-side point
and an opposite-side center, choose a consecutive boundary crossing. The ordered
antitriangle law bounds distance to that boundary. To recover whole-ball
coverage, opposite-side points cover themselves with their own ε-balls.

# Attribution

Theorem 3 of Aleksandrov and Völlinger, *Relaxing Global Classifier Robustness
on Semimetric Spaces*, supplied FSEN 2027 manuscript, p. 10.
-/
theorem boundaryCoveringCharacterization {S : Type u} [Finite S] [LinearOrder S]
    (d : Distance S) (hd : IsOrdered d (· ≤ ·)) (μ ε : ℝ≥0) (hε : 0 < ε) :
    EveryCutCovered d μ ε ↔ EveryCutBoundaryCovered d μ ε :=
  ⟨OrderedBounds.cutToBoundaryCovering d hd μ ε hε,
    OrderedBounds.boundaryToCutCovering d hd μ ε hε⟩

/--
---
conclusion: Lax544225.BoundaryExistence.statement
---
Corollary 1: only-trivial robustness is equivalent to opposite-boundary covering.

# Proof strategy

Combine the two supporting compositions of Theorem 2 with Theorem 3. The
general existence criterion converts triviality to cut covering, and the
boundary characterization converts cut covering to boundary covering.

# Attribution

Corollary 1 of Aleksandrov and Völlinger, *Relaxing Global Classifier Robustness
on Semimetric Spaces*, supplied FSEN 2027 manuscript, pp. 10–11.
-/
lemma boundaryExistence {S : Type u} [Finite S] [LinearOrder S]
    (d : Distance S) (hd : IsOrdered d (· ≤ ·)) (μ ε : ℝ≥0) (hε : 0 < ε) :
    OnlyTrivial d μ ε ↔ EveryCutBoundaryCovered d μ ε :=
  ⟨OrderedBounds.trivialityToBoundaryCovering d hd μ ε hε,
    OrderedBounds.boundaryCoveringToTriviality d hd μ ε hε⟩

end Lax544225Proofs.MainResults
