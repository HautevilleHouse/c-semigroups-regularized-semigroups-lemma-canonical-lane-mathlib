import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean.CSemigroupsRegularizedSemigroups

namespace HautevilleHouse
namespace CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  CSemigroupsRegularizedSemigroupsClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

end CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean
end HautevilleHouse