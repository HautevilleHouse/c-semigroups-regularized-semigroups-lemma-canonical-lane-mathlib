import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean.CSemigroupsRegularizedSemigroups
import HautevilleHouse.CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean.GeneratorConditions
import HautevilleHouse.CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean.RegularizationOperator

namespace HautevilleHouse
namespace CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean

structure FunctionalCalculusPackage {P : CSemigroupsRegularizedSemigroupsPackage}
    {G : GeneratorConditionsPackage P} {R : RegularizationOperatorPackage P} where
  hilleYosidaEstimate : Prop
  eulerFormula : Prop
  postWidderInversion : Prop
  approximationByResolvents : Prop

structure FunctionalCalculusEvidence {P : CSemigroupsRegularizedSemigroupsPackage}
    {G : GeneratorConditionsPackage P} {R : RegularizationOperatorPackage P}
    (F : FunctionalCalculusPackage G R) where
  hilleYosidaEstimateClosed : F.hilleYosidaEstimate
  eulerFormulaClosed : F.eulerFormula
  postWidderInversionClosed : F.postWidderInversion
  approximationByResolventsClosed : F.approximationByResolvents

def FunctionalCalculusClosed {P : CSemigroupsRegularizedSemigroupsPackage}
    {G : GeneratorConditionsPackage P} {R : RegularizationOperatorPackage P}
    (F : FunctionalCalculusPackage G R) : Prop :=
  F.hilleYosidaEstimate ∧ F.eulerFormula ∧ F.postWidderInversion ∧ F.approximationByResolvents

theorem functional_calculus_closed_from_evidence
    {P : CSemigroupsRegularizedSemigroupsPackage} {G : GeneratorConditionsPackage P}
    {R : RegularizationOperatorPackage P} (F : FunctionalCalculusPackage G R)
    (E : FunctionalCalculusEvidence F) : FunctionalCalculusClosed F := by
  exact And.intro E.hilleYosidaEstimateClosed
    (And.intro E.eulerFormulaClosed
      (And.intro E.postWidderInversionClosed E.approximationByResolventsClosed))

end CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean
end HautevilleHouse