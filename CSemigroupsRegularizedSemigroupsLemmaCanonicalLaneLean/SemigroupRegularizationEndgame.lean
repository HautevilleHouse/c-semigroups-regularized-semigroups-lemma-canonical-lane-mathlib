import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean

structure CSemigroupRegularizationEndgame (A : Type u) where
  cSemigroup : CSemigroupLet A A
  regularization : RegularizedSemigroupLet A A
  endgameProperty : Prop
  endgameProof : endgameProperty

def ClosableSemigroup (C : CSemigroupRegularizationEndgame) : Prop :=
  C.endgameProperty

theorem closable_semigroup_intro (C : CSemigroupRegularizationEndgame) : ClosableSemigroup C := by
  exact C.endgameProof

end CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean
end HautevilleHouse