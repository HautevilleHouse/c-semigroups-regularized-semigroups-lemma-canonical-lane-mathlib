import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean

structure RegularizedSemigroupsPackage where
  generator : Type u
  semigroup : generator → generator → generator
  regularization : generator → generator
  regularizedGenerator : generator
  generationProperty : Prop
  regularizedSemigroupProperty : Prop

structure RegularizedSemigroupsEvidence (P : RegularizedSemigroupsPackage) where
  generationPropertyClosed : P.generationProperty
  regularizedSemigroupPropertyClosed : P.regularizedSemigroupProperty

def RegularizedSemigroupsClosed (P : RegularizedSemigroupsPackage) : Prop :=
  P.generationProperty ∧ P.regularizedSemigroupProperty

theorem regularized_semigroups_closed_from_evidence (P : RegularizedSemigroupsPackage)
    (E : RegularizedSemigroupsEvidence P) : RegularizedSemigroupsClosed P := by
  exact And.intro E.generationPropertyClosed E.regularizedSemigroupPropertyClosed

end CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean
end HautevilleHouse