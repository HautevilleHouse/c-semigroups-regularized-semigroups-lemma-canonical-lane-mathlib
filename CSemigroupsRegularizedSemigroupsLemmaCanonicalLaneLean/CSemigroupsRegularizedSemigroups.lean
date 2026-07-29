import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean

structure CSemigroup (X : Type u) [TopologicalSpace X] where
  family : Time → (X → X)
  stronglyContinuous : ∀ f ∈ family, Continuous f
  semigroupProperty : ∀ s t, family (s + t) = family s ∘ family t
  continuityInTime : ∀ x, Continuous (λ t => family t x)

structure Regularization (X : Type u) [TopologicalSpace X] (A : CSemigroup X) where
  regularizedFamily : Time → (X → X)
  approximationProperty : ∀ t, ∀ x, Filter.Tendsto (λ s => A.family s (regularizedFamily (t - s) x)) (Filter.atTop) (Filter.principal {A.family t x})
  strongContinuity : ∀ f ∈ regularizedFamily, Continuous f

def CSemigroupAdmissible (X : Type u) [TopologicalSpace X] (A : CSemigroup X) (R : Regularization X A) : Prop :=
  ∀ t, Continuous (R.regularizedFamily t) ∧ R.approximationProperty t

structure CSemigroupAdmissibleClass (X : Type u) [TopologicalSpace X] where
  csemigroup : CSemigroup X
  regularization : Regularization X csemigroup
  admissible : CSemigroupAdmissible X csemigroup regularization

end CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean
end HautevilleHouse
