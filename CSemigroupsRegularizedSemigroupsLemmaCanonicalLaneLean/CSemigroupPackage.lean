import CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean.Basic

/-!
# C-Semigroup Package
-/

namespace HautevilleHouse
namespace CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean

structure CSemigroupPackage where
  space : Type u
  norm : space → ℝ
  semigroupLaw : space → space → space
  identity : space
  associativity : Prop
  continuity : Prop
  growthCondition : Prop

structure CSemigroupEvidence (C : CSemigroupPackage) where
  associativityClosed : C.associativity
  continuityClosed : C.continuity
  growthConditionClosed : C.growthCondition

def CSemigroupClosed (C : CSemigroupPackage) : Prop :=
  C.associativity ∧ C.continuity ∧ C.growthCondition

theorem csemigroup_closed_from_evidence (C : CSemigroupPackage) (E : CSemigroupEvidence C) :
    CSemigroupClosed C := by
  exact And.intro E.associativityClosed (And.intro E.continuityClosed E.growthConditionClosed)

end CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean
end HautevilleHouse