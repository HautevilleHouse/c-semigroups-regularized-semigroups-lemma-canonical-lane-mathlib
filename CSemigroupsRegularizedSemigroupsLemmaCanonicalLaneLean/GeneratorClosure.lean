import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean

structure GeneratorClosurePackage where
  generatorDomain : Prop
  resolventSet : Prop
  hilleYosidaEstimate : Prop
  denseDomain : Prop

structure GeneratorClosureEvidence (G : GeneratorClosurePackage) where
  generatorDomainClosed : G.generatorDomain
  resolventSetClosed : G.resolventSet
  hilleYosidaEstimateClosed : G.hilleYosidaEstimate
  denseDomainClosed : G.denseDomain

def GeneratorClosureClosed (G : GeneratorClosurePackage) : Prop :=
  G.generatorDomain ∧ G.resolventSet ∧ G.hilleYosidaEstimate ∧ G.denseDomain

theorem generator_closure_closed_from_evidence (G : GeneratorClosurePackage)
    (E : GeneratorClosureEvidence G) : GeneratorClosureClosed G := by
  exact And.intro E.generatorDomainClosed
    (And.intro E.resolventSetClosed
      (And.intro E.hilleYosidaEstimateClosed E.denseDomainClosed))

end CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean
end HautevilleHouse
