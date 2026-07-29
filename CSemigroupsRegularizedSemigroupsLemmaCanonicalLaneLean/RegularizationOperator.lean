import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean.CSemigroupsRegularizedSemigroups

namespace HautevilleHouse
namespace CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean

structure RegularizationOperatorPackage {P : CSemigroupsRegularizedSemigroupsPackage} where
  regularizationFamily : Type w
  commutationRelation : Prop
  injectivity : Prop
  rangeDensity : Prop
  inversionFormula : Prop

structure RegularizationOperatorEvidence {P : CSemigroupsRegularizedSemigroupsPackage}
    (R : RegularizationOperatorPackage P) where
  commutationRelationClosed : R.commutationRelation
  injectivityClosed : R.injectivity
  rangeDensityClosed : R.rangeDensity
  inversionFormulaClosed : R.inversionFormula

def RegularizationOperatorClosed {P : CSemigroupsRegularizedSemigroupsPackage}
    (R : RegularizationOperatorPackage P) : Prop :=
  R.commutationRelation ∧ R.injectivity ∧ R.rangeDensity ∧ R.inversionFormula

theorem regularization_operator_closed_from_evidence
    {P : CSemigroupsRegularizedSemigroupsPackage} (R : RegularizationOperatorPackage P)
    (E : RegularizationOperatorEvidence R) : RegularizationOperatorClosed R := by
  exact And.intro E.commutationRelationClosed
    (And.intro E.injectivityClosed
      (And.intro E.rangeDensityClosed E.inversionFormulaClosed))

end CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean
end HautevilleHouse