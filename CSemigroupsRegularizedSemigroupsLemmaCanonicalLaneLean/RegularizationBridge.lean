import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean

structure RegularizedLane (α : Type u) where
  left : α → α
  right : α → α
  projection : Set α → Set α
  regularityProperty : ∀ x, left (right x) = right x ∧ right (left x) = left x

def bridgeRegularization (L : RegularizedLane) : Prop :=
  ∀ x : L.projection (Set.univ), L.left x = x → L.right x = x

theorem bridge_regularization_holds (L : RegularizedLane) : bridgeRegularization L := by
  intro x h
  have hreg := L.regularityProperty x
  exact hreg.2

end CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean
end HautevilleHouse