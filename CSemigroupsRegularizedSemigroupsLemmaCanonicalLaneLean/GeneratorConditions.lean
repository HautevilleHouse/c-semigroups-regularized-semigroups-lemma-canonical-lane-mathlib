import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean.CSemigroupsRegularizedSemigroups

namespace HautevilleHouse
namespace CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean

structure GeneratorConditionsPackage {P : CSemigroupsRegularizedSemigroupsPackage} where
  resolventEstimates : Prop
  domainDensity : Prop
  closedOperator : Prop
  spectrumCondition : Prop

structure GeneratorConditionsEvidence {P : CSemigroupsRegularizedSemigroupsPackage} (G : GeneratorConditionsPackage P) where
  resolventEstimatesClosed : G.resolventEstimates
  domainDensityClosed : G.domainDensity
  closedOperatorClosed : G.closedOperator
  spectrumConditionClosed : G.spectrumCondition

def GeneratorConditionsClosed {P : CSemigroupsRegularizedSemigroupsPackage} (G : GeneratorConditionsPackage P) : Prop :=
  G.resolventEstimates ∧ G.domainDensity ∧ G.closedOperator ∧ G.spectrumCondition

theorem generator_conditions_closed_from_evidence
    {P : CSemigroupsRegularizedSemigroupsPackage} (G : GeneratorConditionsPackage P)
    (E : GeneratorConditionsEvidence G) : GeneratorConditionsClosed G := by
  exact And.intro E.resolventEstimatesClosed
    (And.intro E.domainDensityClosed
      (And.intro E.closedOperatorClosed E.spectrumConditionClosed))

end CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean
end HautevilleHouse