import Lax544225.Classifier
import Mathlib.Data.Set.Finite.Basic
import Mathlib.Data.Setoid.Partition

/-!
---
title: Finite partitions and classifier fibers
type: definition
---
A partition is a finite collection of nonempty pairwise disjoint subsets covering S. The trivial partition has the single part S. A classifier induces the collection of its label fibers (Definitions 5–6, p. 5).

# Formalization notes

The family is a set of sets, so enumeration and duplicate parts are absent. Mathlib's `Setoid.IsPartition` supplies nonempty parts and unique membership. Finite families are required even when S is infinite.
-/

universe u

namespace Lax544225.Partitions

open Classifier
/-- A finite partition into nonempty parts with unique membership for every input. -/
def IsPartition {S : Type u} (P : Set (Set S)) : Prop :=
  P.Finite ∧ Setoid.IsPartition P

/-- The partition consisting of the whole carrier as its only part. -/
def IsTrivial {S : Type u} (P : Set (Set S)) : Prop := P = {Set.univ}

/-- The part assigned a particular classifier label. -/
def fiber {S : Type u} {n : ℕ} (c : Classifier S n) (i : Fin n) : Set S :=
  {x | c.label x = i}

/-- The collection of all label fibers. -/
def induced {S : Type u} {n : ℕ} (c : Classifier S n) : Set (Set S) :=
  Set.range (fiber c)

end Lax544225.Partitions
