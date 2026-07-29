import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean.CSemigroupBasics

namespace HautevilleHouse
namespace CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean

structure RegularizedSemigroup (A : Type) extends CSemigroupWithIdentity A where
  regularizer : A → A → A
  regularizationProperty : ∀ x y : A, regularizer x y = multiplication (multiplication x y) (regularizer x y)

structure RegularizedSemigroupLemmaPackage (A : Type) (R : RegularizedSemigroup A) where
  closureUnderRegularizer : Prop
  lemmaStatement : Prop
  evidence : closureUnderRegularizer → lemmaStatement

structure RegularizedSemigroupEvidence {A : Type} {R : RegularizedSemigroup A} (P : RegularizedSemigroupLemmaPackage A R) where
  closureUnderRegularizerClosed : P.closureUnderRegularizer
  lemmaStatementClosed : P.lemmaStatement

def RegularizedSemigroupLemmaClosed {A : Type} {R : RegularizedSemigroup A} (P : RegularizedSemigroupLemmaPackage A R) : Prop :=
  P.closureUnderRegularizer ∧ P.lemmaStatement

theorem regularized_semigroup_lemma_closed_from_evidence
    {A : Type} {R : RegularizedSemigroup A} (P : RegularizedSemigroupLemmaPackage A R)
    (E : RegularizedSemigroupEvidence P) : RegularizedSemigroupLemmaClosed P := by
  exact And.intro E.closureUnderRegularizerClosed E.lemmaStatementClosed

end CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean
end HautevilleHouse