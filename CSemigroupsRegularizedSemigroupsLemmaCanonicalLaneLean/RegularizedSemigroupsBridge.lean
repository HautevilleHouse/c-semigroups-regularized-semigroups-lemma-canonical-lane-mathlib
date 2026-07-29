import canonicalLaneMathlib.AdmissibleClass
import CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean.CSemigroupsRegularizedSemigroups

namespace HautevilleHouse
namespace CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean

def bridgeClosed (X : Type u) [TopologicalSpace X] (A : CSemigroupAdmissibleClass X) : Prop :=
  ∀ t, Continuous (A.regularization.regularizedFamily t)

theorem bridge_from_admissible_class (X : Type u) [TopologicalSpace X] (A : CSemigroupAdmissibleClass X) :
    bridgeClosed X A := by
  intro t
  have h := A.admissible t
  exact h.1

def gateClosed (X : Type u) [TopologicalSpace X] (A : CSemigroupAdmissibleClass X) : Prop :=
  ∀ t, A.regularization.approximationProperty t  -- approximation subsumes remainder

theorem gate_from_admissible_class (X : Type u) [TopologicalSpace X] (A : CSemigroupAdmissibleClass X) :
    gateClosed X A := by
  intro t
  have h := A.admissible t
  exact h.2

def ConstrainedCSemigroupClosure (X : Type u) [TopologicalSpace X] (A : CSemigroupAdmissibleClass X) : Prop :=
  bridgeClosed X A ∧ gateClosed X A

theorem constrained_csemigroup_endgame (X : Type u) [TopologicalSpace X] (A : CSemigroupAdmissibleClass X) :
    ConstrainedCSemigroupClosure X A := by
  exact And.intro (bridge_from_admissible_class X A) (gate_from_admissible_class X A)

end CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean
end HautevilleHouse
