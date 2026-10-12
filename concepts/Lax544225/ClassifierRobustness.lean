import Lax544225.Classifier
import Lax544225.Balls

/-!
---
title: Local and relaxed classifier robustness
type: definition
---
Local ε-robustness means that the ε-ball of an input has its label. Global ε-robustness requires this at every input. Relaxed (μ,ε)-robustness requires every input to have a same-label, locally ε-robust point within distance μ (Definitions 3–4, pp. 3–4).

# Formalization notes

Radii are nonnegative reals. The predicates also make sense at ε=0; the paper’s results below explicitly require ε>0. The same-label requirement is present even when μ>ε.
-/

universe u

namespace Lax544225.ClassifierRobustness

open scoped NNReal

open Classifier Semimetric
/-- Local robustness of the classifier at x. -/
def LocallyRobust {S : Type u} {n : ℕ} (d : Distance S)
    (c : Classifier S n) (ε : ℝ≥0) (x : S) : Prop :=
  ∀ y, d y x ≤ ε → c.label y = c.label x

/-- Local robustness at every input. -/
def GloballyRobust {S : Type u} {n : ℕ} (d : Distance S)
    (c : Classifier S n) (ε : ℝ≥0) : Prop :=
  ∀ x, LocallyRobust d c ε x

/-- Coverage of each input by a same-label locally robust input. -/
def RelaxedRobust {S : Type u} {n : ℕ} (d : Distance S)
    (c : Classifier S n) (μ ε : ℝ≥0) : Prop :=
  ∀ x, ∃ x', d x x' ≤ μ ∧ c.label x = c.label x' ∧ LocallyRobust d c ε x'

end Lax544225.ClassifierRobustness
