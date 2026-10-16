import Lax544225.OrderedSemimetricConstructions
import Lax544225Proofs.FloatEmbedding
import Lax544225Proofs.Lists

universe u

namespace Lax544225Proofs

open Lax544225 Lax544225.Semimetric Lax544225.OrderedSemimetric

/--
---
conclusion: Lax544225.OrderedSemimetricConstructions.statement
---
The five constructions give ordered semimetric spaces.

# Proof strategy

Combine the absolute and squared float embedding lemmas, the sum and synchronized
maximum product lemmas, and their padded-list extensions. Squaring reuses the
absolute-distance result; each list construction reuses its product result.

# Attribution

Proposition 1 of Aleksandrov and Völlinger's supplied FSEN 2027 manuscript.
The construction lemmas retain their individual source attributions.
-/
lemma orderedSemimetricConstructions :
    (∀ F : BinaryFloats.Format,
      IsOrdered (BinaryFloats.absDistance F) (BinaryFloats.ieeeLe F)) ∧
    (∀ F : BinaryFloats.Format,
      IsOrdered (BinaryFloats.squareDistance F) (BinaryFloats.ieeeLe F)) ∧
    (∀ {S : Type u} (d : Distance S) (le : S → S → Prop),
      IsOrdered d le → ∀ n : ℕ,
        IsOrdered (ProductSpaces.sumDistance d n) (ProductSpaces.productLe le n)) ∧
    (∀ {S : Type u} (d : Distance S) (le : S → S → Prop),
      IsOrdered d le → Additive d le → ∀ n : ℕ,
        IsOrdered (ProductSpaces.maxDistance d n) (ProductSpaces.synchronizedLe d le n)) ∧
    ((∀ {S : Type u} (d : Distance S) (le : S → S → Prop),
      IsOrdered d le → ∀ pad : S,
        IsOrdered (ListSpaces.sumDistance d pad) (ListSpaces.listLe le pad)) ∧
     (∀ {S : Type u} (d : Distance S) (le : S → S → Prop),
      IsOrdered d le → Additive d le → ∀ pad : S,
        IsOrdered (ListSpaces.maxDistance d pad) (ListSpaces.synchronizedListLe d le pad))) := by
  exact ⟨FloatEmbedding.floatAbsoluteSpace, FloatEmbedding.floatSquaredSpace,
    sumProductSpace, maximumProductSpace, sumListSpace, maximumListSpace⟩

end Lax544225Proofs
