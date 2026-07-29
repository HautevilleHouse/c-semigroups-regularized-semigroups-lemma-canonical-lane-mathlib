import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean

structure CSemigroup (X : Type u) [TopologicalSpace X] where
  family : ℕ → (X → X)
  continuity : ∀ n, Continuous (family n)
  semigroupProperty : ∀ n m x, family n (family m x) = family (n + m) x
  strongContinuity : ∀ x, ContinuousAt (λ t : ℕ × X => family t.1 x) (0, x)

structure RegularizedSemigroup (X : Type u) [TopologicalSpace X] where
  baseSemigroup : CSemigroup X
  regularizer : ℕ → (X → X)
  regularizationProperty : ∀ n x, baseSemigroup.family n x = regularizer n (baseSemigroup.family n x)
  regularityCondition : ∀ n, Continuous (regularizer n)

structure CSemigroupAdmittedObject where
  carrier : Type u
  topology : TopologicalSpace carrier
  csemigroup : CSemigroup carrier
  regularizedSemigroup : RegularizedSemigroup carrier
  lemmaConclusion : Prop
  conclusion : lemmaConclusion

def CSemigroupWitnessClosed (O : CSemigroupAdmittedObject) : Prop :=
  O.lemmaConclusion

end CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean
end HautevilleHouse