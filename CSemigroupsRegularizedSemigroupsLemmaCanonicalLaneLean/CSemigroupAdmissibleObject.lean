import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean

structure CSemigroupSpace where
  carrier : Type
  norm : carrier → ℝ
  isBanach : Prop

structure CSemigroupAdmittedObject where
  space : CSemigroupSpace
  generator : carrier → carrier
  isClosedGenerator : Prop
  generatesCSemigroup : Prop
  conclusion : generatesCSemigroup

structure CSemigroupEndgameState where
  object : CSemigroupAdmittedObject

def CSemigroupWitnessClosed (O : CSemigroupAdmittedObject) : Prop :=
  O.generatesCSemigroup

end CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean
end HautevilleHouse
