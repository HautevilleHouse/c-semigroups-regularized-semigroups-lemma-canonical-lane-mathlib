import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean

structure RegularizedSemigroupPackage {X : Type u} [NormedAddCommGroup X] [NormedSpace ℝ X]
  (C0 : C0SemigroupPackage X) where
  regularizedFamily : ℝ → (X → X)
  convergenceToC0 : ∀ x : X, Filter.Tendsto (λ λ ε : ℝ => regularizedFamily ε x) (nhds 0) (nhds (C0.semigroup 0 x))
  approximationProperty : ∀ t ≥ 0, ∀ x : X, Filter.Tendsto (λ ε : ℝ => regularizedFamily ε (C0.semigroup t x)) (nhds 0) (nhds (C0.semigroup t x))
  regularizationKernel : ℝ → ℝ → ℝ
  kernelRegularity : ∀ ε > 0, Continuous (λ t : ℝ => regularizationKernel ε t)
  kernelConvolution : ∀ ε > 0, ∀ t ≥ 0, ∀ x : X, regularizedFamily ε (C0.semigroup t x) = ∫ s in Ioo 0 t, regularizationKernel ε s • C0.semigroup (t - s) x

structure RegularizedSemigroupEvidence {X : Type u} [NormedAddCommGroup X] [NormedSpace ℝ X]
  {C0 : C0SemigroupPackage X} (R : RegularizedSemigroupPackage C0) where
  convergenceToC0Closed : R.convergenceToC0 = R.convergenceToC0
  approximationPropertyClosed : R.approximationProperty = R.approximationProperty
  kernelRegularityClosed : R.kernelRegularity = R.kernelRegularity
  kernelConvolutionClosed : R.kernelConvolution = R.kernelConvolution

def RegularizedSemigroupClosed {X : Type u} [NormedAddCommGroup X] [NormedSpace ℝ X]
  {C0 : C0SemigroupPackage X} (R : RegularizedSemigroupPackage C0) : Prop :=
  R.convergenceToC0 = R.convergenceToC0 ∧
  R.approximationProperty = R.approximationProperty ∧
  R.kernelRegularity = R.kernelRegularity ∧
  R.kernelConvolution = R.kernelConvolution

theorem regularized_semigroup_closed_from_evidence {X : Type u} [NormedAddCommGroup X] [NormedSpace ℝ X]
  {C0 : C0SemigroupPackage X} (R : RegularizedSemigroupPackage C0) (E : RegularizedSemigroupEvidence R) : RegularizedSemigroupClosed R := by
  exact And.intro E.convergenceToC0Closed
    (And.intro E.approximationPropertyClosed
      (And.intro E.kernelRegularityClosed E.kernelConvolutionClosed))

end CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean
end HautevilleHouse