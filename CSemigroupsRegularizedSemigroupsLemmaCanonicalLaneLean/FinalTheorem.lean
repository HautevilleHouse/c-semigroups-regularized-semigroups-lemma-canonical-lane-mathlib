import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean.BridgeLemmas
import HautevilleHouse.CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean

def ConstrainedCSemigroupsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_c_semigroups_endgame (A : AdmissibleClass) :
    ConstrainedCSemigroupsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean
end HautevilleHouse