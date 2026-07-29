import CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean.CSemigroupsCore

namespace HautevilleHouse
namespace CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean

structure RegularizedSemigroupsLemmaPackage (X : Type u) [TopologicalSpace X] where
  csemigroup : CSemigroup X
  regularizedSemigroup : RegularizedSemigroup X
  approximationProperty : Prop
  convergenceRate : Prop
  errorBound : Prop

structure RegularizedSemigroupsLemmaEvidence {X : Type u} [TopologicalSpace X]
    (P : RegularizedSemigroupsLemmaPackage X) where
  approximationPropertyClosed : P.approximationProperty
  convergenceRateClosed : P.convergenceRate
  errorBoundClosed : P.errorBound

def RegularizedSemigroupsLemmaClosed {X : Type u} [TopologicalSpace X]
    (P : RegularizedSemigroupsLemmaPackage X) : Prop :=
  P.approximationProperty ∧ P.convergenceRate ∧ P.errorBound

theorem regularized_semigroups_lemma_closed_from_evidence
    {X : Type u} [TopologicalSpace X] (P : RegularizedSemigroupsLemmaPackage X)
    (E : RegularizedSemigroupsLemmaEvidence P) : RegularizedSemigroupsLemmaClosed P := by
  exact And.intro E.approximationPropertyClosed
    (And.intro E.convergenceRateClosed E.errorBoundClosed)

end CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean
end HautevilleHouse