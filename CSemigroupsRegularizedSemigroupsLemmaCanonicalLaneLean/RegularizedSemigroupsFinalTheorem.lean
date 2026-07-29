import canonicalLaneMathlib.AdmissibleClass
import CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean.RegularizedSemigroupsBridge

namespace HautevilleHouse
namespace CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean

def ConstrainedRegularizedSemigroupClosure (X : Type u) [TopologicalSpace X] (A : CSemigroupAdmissibleClass X) : Prop :=
  bridgeClosed X A ∧ gateClosed X A

theorem constrained_regularized_semigroup_endgame (X : Type u) [TopologicalSpace X] (A : CSemigroupAdmissibleClass X) :
    ConstrainedRegularizedSemigroupClosure X A := by
  exact And.intro (bridge_from_admissible_class X A) (gate_from_admissible_class X A)

end CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean
end HautevilleHouse
