import HautevilleHouse.CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean.CSemigroupDefinitions

namespace HautevilleHouse
namespace CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean

structure RegularizationLemmaPackage (C : CSemigroupPackage) where
  yosidaApproximants : Prop
  convergence : Prop
  limitSemigroup : Prop
  limitSemigroupIsCSemigroup : Prop

structure RegularizationLemmaEvidence (C : CSemigroupPackage) (R : RegularizationLemmaPackage C) where
  yosidaApproximantsClosed : R.yosidaApproximants
  convergenceClosed : R.convergence
  limitSemigroupClosed : R.limitSemigroup
  limitSemigroupIsCSemigroupClosed : R.limitSemigroupIsCSemigroup

def RegularizationLemmaClosed (C : CSemigroupPackage) (R : RegularizationLemmaPackage C) : Prop :=
  R.yosidaApproximants ∧ R.convergence ∧ R.limitSemigroup ∧ R.limitSemigroupIsCSemigroup

theorem regularization_lemma_closed_from_evidence (C : CSemigroupPackage) (R : RegularizationLemmaPackage C)
    (E : RegularizationLemmaEvidence C R) : RegularizationLemmaClosed C R := by
  exact And.intro E.yosidaApproximantsClosed
    (And.intro E.convergenceClosed
      (And.intro E.limitSemigroupClosed E.limitSemigroupIsCSemigroupClosed))

end CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean
end HautevilleHouse