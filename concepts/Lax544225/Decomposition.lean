import Lax544225.Balls
import Mathlib.Logic.Relation
import Mathlib.Data.Set.Finite.Basic

/-!
---
title: Closed overlapping decompositions
type: definition
---
A (μ,ε)-decomposition is a finite family of nonempty subsets whose members contain every μ-ball centered in them and which connect every pair of inputs through a finite chain of overlapping members (Definition 11, p. 13).

# Formalization notes

The definition depends only on μ; ε appears in the applications. ReflTransGen encodes a finite chain, including a chain consisting of a single member. Membership of each endpoint member and each link is explicit. Finiteness concerns the family, not the sizes of its members.
-/

universe u

namespace Lax544225.Decomposition

open scoped NNReal

open Semimetric Balls
/-- A finite family of nonempty μ-closed pieces connected by overlaps. -/
def IsDecomposition {S : Type u} (d : Distance S) (D : Set (Set S)) (μ : ℝ≥0) : Prop :=
  D.Finite ∧ (∀ A ∈ D, A.Nonempty) ∧
    (∀ A ∈ D, ∀ x ∈ A, ball d x μ ⊆ A) ∧
    (∀ x y, ∃ A ∈ D, ∃ B ∈ D, x ∈ A ∧ y ∈ B ∧
      Relation.ReflTransGen (fun C E => C ∈ D ∧ E ∈ D ∧ (C ∩ E).Nonempty) A B)

end Lax544225.Decomposition
