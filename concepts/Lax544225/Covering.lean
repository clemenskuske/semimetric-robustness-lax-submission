import Lax544225.Balls

/-!
---
title: Covering Conditions
type: definition
---
The covering conditions ask whether a small ball on one side of a partition or cut can be covered by larger balls centered on the other side.

**Definition from the paper.**

Let $(S,d)$ be a semimetric space, $P$ a partition of $S$, and
$\mu\geq0$, $\epsilon>0$. The partition covering condition is

$$\forall S_i\in P\;\forall x\in S_i,\quad
B(x,\mu)\not\subseteq\bigcup_{x^*\in S\setminus S_i}B(x^*,\epsilon).$$

The cut covering condition requires that for every nonempty proper subset
$S'\subset S$, there exists $x\in S$ such that either

$$x\in S'\quad\text{and}\quad
B(x,\mu)\subseteq\bigcup_{x'\in S\setminus S'}B(x',\epsilon),$$

or

$$x\in S\setminus S'\quad\text{and}\quad
B(x,\mu)\subseteq\bigcup_{x'\in S'}B(x',\epsilon).$$

# Formalization notes

A proper nonempty subset has both itself and its complement nonempty. Neither the empty cut nor the whole carrier is tested. These predicates describe the covering conditions independently of robustness.
-/

universe u

namespace Lax544225.Covering

open scoped NNReal

open Semimetric Balls
/-- No μ-ball centered in a part is covered by ε-balls from its complement. -/
def Uncovered {S : Type u} (d : Distance S) (P : Set (Set S)) (μ ε : ℝ≥0) : Prop :=
  ∀ A ∈ P, ∀ x ∈ A, ¬ ball d x μ ⊆ neighborhood d Aᶜ ε

/-- Every nontrivial cut admits an opposite-side covering obstruction. -/
def EveryCutCovered {S : Type u} (d : Distance S) (μ ε : ℝ≥0) : Prop :=
  ∀ A : Set S, A.Nonempty → Aᶜ.Nonempty →
    ∃ x, (x ∈ A ∧ ball d x μ ⊆ neighborhood d Aᶜ ε) ∨
      (x ∈ Aᶜ ∧ ball d x μ ⊆ neighborhood d A ε)

end Lax544225.Covering
