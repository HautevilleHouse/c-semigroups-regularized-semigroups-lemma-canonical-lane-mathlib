import HautevilleHouse.CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean.RegularizedSemigroupsPackage

namespace HautevilleHouse
namespace CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  RegularizedSemigroupsClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.conclusion

end CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean
end HautevilleHouse