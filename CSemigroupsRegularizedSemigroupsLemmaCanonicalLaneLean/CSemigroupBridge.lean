import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean

structure CSemigroupBridge (A : Type u) where
  innerLet : CSemigroupLet A A
  bridgeMap : (A → A) → A → A
  bridgeCondition : ∀ f x, bridgeMap f x = innerLet.semigroupOperation (f x) (innerLet.unit)

def bridgeClosed (B : CSemigroupBridge) : Prop :=
  ∀ f, B.bridgeMap f B.innerLet.unit = f B.innerLet.unit

theorem bridge_closed_holds (B : CSemigroupBridge) : bridgeClosed B := by
  intro f
  calc
    B.bridgeMap f B.innerLet.unit = B.innerLet.semigroupOperation (f B.innerLet.unit) B.innerLet.unit := B.bridgeCondition f B.innerLet.unit
    _ = f B.innerLet.unit := B.innerLet.rightUnit (f B.innerLet.unit)

end CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean
end HautevilleHouse