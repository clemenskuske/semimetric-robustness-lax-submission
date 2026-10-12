import Lax544225.OrderedSemimetric
import Mathlib.Data.Real.Basic
import Mathlib.Data.Int.Cast.Lemmas

/-!
---
title: Canonical binary floats and their embedding
type: definition
---
A binary format has p fractional mantissa bits and an exponent interval. Its canonical finite values are supplemented by signed zeros, signed infinities, and one NaN. The real embedding φ separates the special values as in Proposition 1 (p. 8).

# Formalization notes

This is the paper’s single-NaN abstraction, matching the supplied Flocq BinarySingleNaN examples, not the full set of IEEE NaN payloads. A finite mantissa is stored as the integer k with m=k·2^(−p); normality means k≥2^p. The independent order puts −∞ first, then negative finite values, −0, +0, positive finite values, +∞, and NaN. It is not defined by φ. The two distances are the absolute and squared differences of φ.
-/

universe u

namespace Lax544225.BinaryFloats

open scoped NNReal

/-- The precision and nonempty exponent interval of a binary format. -/
structure Format where
  /-- Number of fractional bits in the significand. -/
  precision : ℕ
  /-- Least allowed exponent. -/
  minExponent : ℤ
  /-- Greatest allowed exponent. -/
  maxExponent : ℤ
  /-- The exponent interval is nonempty. -/
  exponent_le : minExponent ≤ maxExponent

/-- Canonical data for a nonzero finite number in a format. -/
structure FiniteValue (F : Format) where
  /-- Sign bit: 0 is positive and 1 is negative. -/
  sign : Fin 2
  /-- The exponent of the value. -/
  exponent : ℤ
  /-- The integer significand before scaling by 2^(−p). -/
  mantissa : ℕ
  /-- The exponent is allowed by the format. -/
  exponent_mem : F.minExponent ≤ exponent ∧ exponent ≤ F.maxExponent
  /-- The significand is nonzero and less than 2^(p+1). -/
  mantissa_mem : 0 < mantissa ∧ mantissa < 2 ^ (F.precision + 1)
  /-- A significand below the normal range occurs only at the minimum exponent. -/
  canonical : 2 ^ F.precision ≤ mantissa ∨ exponent = F.minExponent

/-- Canonical finite data and the four signed special values together with one NaN. -/
inductive Value (F : Format)
  /-- A nonzero finite floating-point value. -/
  | finite : FiniteValue F → Value F
  /-- A signed zero. -/
  | zero : Fin 2 → Value F
  /-- A signed infinity. -/
  | infinity : Fin 2 → Value F
  /-- The single, greatest NaN value. -/
  | nan : Value F

/-- The exact ordinary real value of canonical finite data. -/
noncomputable def finiteReal {F : Format} (f : FiniteValue F) : ℝ :=
  (-1 : ℝ) ^ f.sign.val * (2 : ℝ) ^ f.exponent *
    ((f.mantissa : ℝ) * (2 : ℝ) ^ (-(F.precision : ℤ)))

/-- The real embedding including separated signed zeros and bounded special values. -/
noncomputable def phi (F : Format) : Value F → ℝ
  | .finite f => finiteReal f
  | .zero s => if s.val = 0 then 0 else -(2 : ℝ) ^ (F.minExponent - (F.precision : ℤ) - 1)
  | .infinity s => if s.val = 0 then (2 : ℝ) ^ (F.maxExponent + 1)
    else -(2 : ℝ) ^ (F.maxExponent + 1)
  | .nan => (2 : ℝ) ^ (F.maxExponent + 1) + 1

/-- The position of each sign and special-value category in the total order. -/
def category {F : Format} : Value F → ℕ
  | .finite f => if f.sign.val = 0 then 4 else 1
  | .zero s => if s.val = 0 then 3 else 2
  | .infinity s => if s.val = 0 then 5 else 0
  | .nan => 6

/-- The ordinary finite value used to order members within a finite category. -/
noncomputable def withinCategory {F : Format} : Value F → ℝ
  | .finite f => finiteReal f
  | _ => 0

/-- IEEE category order with one positive NaN and exact comparison of finite values. -/
def ieeeLe (F : Format) (x y : Value F) : Prop :=
  category x < category y ∨
    (category x = category y ∧ withinCategory x ≤ withinCategory y)

/-- Absolute embedded distance d₁. -/
noncomputable def absDistance (F : Format) (x y : Value F) : ℝ≥0 :=
  Real.toNNReal (|phi F x - phi F y|)

/-- Squared embedded distance d₂. -/
noncomputable def squareDistance (F : Format) (x y : Value F) : ℝ≥0 :=
  Real.toNNReal ((phi F x - phi F y) ^ 2)

end Lax544225.BinaryFloats
