import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean

structure RegularizedSemigroup (A : Type u) where
  carrier : A
  mult : A → A → A
  reg : A → A
  idempotent : A → A
  regularityCondition : ∀ x, idempotent x = reg (mult x (reg x)) ∧ reg (mult (reg x) x) = reg x

def regularizedClosure (R : RegularizedSemigroup) : Prop :=
  ∀ x, R.reg (R.reg x) = R.reg x

theorem regularized_closure_holds (R : RegularizedSemigroup) : regularizedClosure R := by
  intro x
  exact R.regularityCondition x

end CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean
end HautevilleHouse