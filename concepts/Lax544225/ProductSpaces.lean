import Lax544225.OrderedSemimetric
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Data.Finset.Lattice.Fold

/-!
---
title: Product Distances and Orders
type: definition
---
For an ordered semimetric space $(S,<,d)$, the sum distance on $S^n$ is

$$d_3(f,g):=\sum_{i\in[n]}d(f_i,g_i),$$

with the coordinatewise product partial order $<^n$.
The maximum distance is

$$d_4(f,g):=\max_{i\in[n]}d(f_i,g_i),$$

with the synchronized order

$$<^n_*:=\{(f,g)\in S^n\times S^n\mid f<^n g\ \land
\forall i,j\in[n],\ d(f_i,g_i)=d(f_j,g_j)\}.$$

The maximum construction assumes $d(a,c)=d(a,b)+d(b,c)$ whenever
$a\leq b\leq c$. For floating-point tuples, take $S=\mathcal F$.

# Formalization notes

Coordinates are Fin n; n=0 gives the singleton empty tuple. The maximum of no coordinate distances is 0. Non-strict relations include equality, as required of a partial order; the paper’s strict notation denotes their strict part.
-/

universe u

namespace Lax544225.ProductSpaces

open Semimetric
open scoped BigOperators
/-- Coordinatewise order on finite tuples. -/
def productLe {S : Type u} (le : S → S → Prop) (n : ℕ) (f g : Fin n → S) : Prop :=
  ∀ i, le (f i) (g i)

/-- Coordinatewise order restricted to equal distances in every coordinate. -/
def synchronizedLe {S : Type u} (d : Distance S) (le : S → S → Prop) (n : ℕ)
    (f g : Fin n → S) : Prop :=
  productLe le n f g ∧ ∀ i j, d (f i) (g i) = d (f j) (g j)

/-- Sum of the base distances between corresponding coordinates. -/
noncomputable def sumDistance {S : Type u} (d : Distance S) (n : ℕ) : Distance (Fin n → S) :=
  fun f g => ∑ i, d (f i) (g i)

/-- Maximum of the base distances between corresponding coordinates. -/
noncomputable def maxDistance {S : Type u} (d : Distance S) (n : ℕ) : Distance (Fin n → S) :=
  fun f g => Finset.univ.sup (fun i => d (f i) (g i))

end Lax544225.ProductSpaces
