import CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean

structure RegularizedSemigroupPackage where
  banachSpace : Type u
  generator : Type v
  cSemigroupFamily : Type w
  generationCondition : Prop
  regularizationOperator : Prop
  hilleYosidaEstimate : Prop
  growthBound : Prop
  regularizationFamily : Prop
  coreLemma : Prop
  regularizationFamilyTerm : regularizationFamily
  coreLemmaTerm : coreLemma

structure RegularizedSemigroupEvidence (R : RegularizedSemigroupPackage) where
  generationConditionClosed : R.generationCondition
  regularizationOperatorClosed : R.regularizationOperator
  hilleYosidaEstimateClosed : R.hilleYosidaEstimate
  growthBoundClosed : R.growthBound
  regularizationFamilyClosed : R.regularizationFamily
  coreLemmaClosed : R.coreLemma

def RegularizedSemigroupClosed (R : RegularizedSemigroupPackage) : Prop :=
  R.generationCondition ∧ R.regularizationOperator ∧ R.hilleYosidaEstimate ∧ R.growthBound ∧ R.regularizationFamily ∧ R.coreLemma

theorem regularized_semigroup_closed_from_evidence
    (R : RegularizedSemigroupPackage) (E : RegularizedSemigroupEvidence R) :
    RegularizedSemigroupClosed R := by
  exact And.intro E.generationConditionClosed
    (And.intro E.regularizationOperatorClosed
      (And.intro E.hilleYosidaEstimateClosed
        (And.intro E.growthBoundClosed
          (And.intro E.regularizationFamilyClosed E.coreLemmaClosed))))

end CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean
end HautevilleHouse