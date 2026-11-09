import Lax544225Proofs.Basic
import Lax544225Proofs.Existence
import Mathlib.Tactic.FinCases
import Mathlib.Tactic.NormNum

/-! Exact finite model for the revised manuscript's `{0,2,4,6}` example. -/

namespace Lax544225Proofs.FourPointExample

open scoped NNReal
open Lax544225 Semimetric Partitions PartitionRobustness Balls

/-- The four real coordinates 0, 2, 4, and 6. -/
private def coordinate (i : Fin 4) : ℝ := 2 * (i.val : ℝ)

/-- Euclidean distance on the four even integer coordinates. -/
private def distance (x y : Fin 4) : ℝ≥0 :=
  Real.toNNReal |coordinate x - coordinate y|

private def firstHalf : Set (Fin 4) := {x | x.val < 2}
private def partition : Set (Set (Fin 4)) := {firstHalf, firstHalfᶜ}

private lemma coordinate_range :
    Set.range coordinate = ({0, 2, 4, 6} : Set ℝ) := by
  ext x
  constructor
  · rintro ⟨i, rfl⟩
    fin_cases i <;> norm_num [coordinate]
  · intro hx
    simp only [Set.mem_insert_iff, Set.mem_singleton_iff] at hx
    rcases hx with rfl | rfl | rfl | rfl
    · exact ⟨0, by norm_num [coordinate]⟩
    · exact ⟨1, by norm_num [coordinate]⟩
    · exact ⟨2, by norm_num [coordinate]⟩
    · exact ⟨3, by norm_num [coordinate]⟩

private lemma distance_semimetric : IsSemimetric distance := by
  refine ⟨inferInstance, ?_, ?_⟩
  · intro x y
    fin_cases x <;> fin_cases y <;> norm_num [distance, coordinate]
  · intro x y
    simp [distance, coordinate, abs_sub_comm]

private lemma distance_le_one_eq {x y : Fin 4} (h : distance x y ≤ 1) : x = y := by
  fin_cases x <;> fin_cases y <;>
    (first | rfl | norm_num [distance, coordinate] at h)

private lemma partition_valid : IsPartition partition := by
  apply Existence.cut_partition firstHalf
  · exact ⟨0, by norm_num [firstHalf]⟩
  · exact ⟨3, by norm_num [firstHalf]⟩

private lemma partition_robust (μ : ℝ≥0) :
    Robust distance distance_semimetric partition partition_valid μ 1 := by
  intro x
  by_cases hx : x.val < 2
  · refine ⟨x, ?_, firstHalf, by simp [partition], hx, ?_⟩
    · change distance x x ≤ μ
      rw [(distance_semimetric.2.1 x x).2 rfl]
      exact zero_le
    · intro y hy
      change distance y x ≤ 1 at hy
      have : y = x := distance_le_one_eq hy
      change y.val < 2
      rw [this]
      exact hx
  · refine ⟨x, ?_, firstHalfᶜ, by simp [partition], hx, ?_⟩
    · change distance x x ≤ μ
      rw [(distance_semimetric.2.1 x x).2 rfl]
      exact zero_le
    · intro y hy
      change distance y x ≤ 1 at hy
      have : y = x := distance_le_one_eq hy
      change ¬ y.val < 2
      rw [this]
      exact hx

private lemma partition_nontrivial : ¬ IsTrivial partition := by
  intro h
  have hmem : firstHalf ∈ partition := by simp [partition]
  rw [h] at hmem
  have hwhole : firstHalf = Set.univ := Set.mem_singleton_iff.mp hmem
  have h3 : (3 : Fin 4) ∈ firstHalf := hwhole ▸ Set.mem_univ _
  norm_num [firstHalf] at h3

/-- The `{0,2,4,6}` example has a nontrivial robust partition for every μ. -/
lemma exists_nontrivial_robust_partition (μ : ℝ≥0) :
    ∃ P : Set (Set (Fin 4)), ∃ hP : IsPartition P,
      Robust distance distance_semimetric P hP μ 1 ∧ ¬ IsTrivial P :=
  ⟨partition, partition_valid, partition_robust μ, partition_nontrivial⟩

end Lax544225Proofs.FourPointExample
