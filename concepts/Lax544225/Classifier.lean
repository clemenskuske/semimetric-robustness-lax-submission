import Mathlib.Data.Fin.Basic

/-!
---
title: Classifiers
type: definition
---
A classifier on S with n classes is a total surjective function from S to the n labels (Definition 1, p. 3).

# Formalization notes

Fin n labels the classes from 0 to n−1; adding 1 recovers the paper’s labels 1 to n. Surjectivity is retained. Existence of a classifier on a nonempty carrier implies n > 0.
-/

universe u

namespace Lax544225.Classifier

/-- A total classifier in which every label occurs. -/
structure Classifier (S : Type u) (n : ℕ) where
  /-- The label assigned to each input. -/
  label : S → Fin n
  /-- Every class has a representative. -/
  surjective : Function.Surjective label

end Lax544225.Classifier
