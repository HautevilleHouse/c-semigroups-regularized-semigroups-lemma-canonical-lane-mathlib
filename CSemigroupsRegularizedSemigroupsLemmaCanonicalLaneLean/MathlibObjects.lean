import CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure BanachSpace where
  carrier : Type
  norm : carrier → ℝ
  normedAddCommGroup : NormedAddCommGroup carrier

structure C0Semigroup (X : BanachSpace) where
  semigroup : ℝ → (X.carrier → X.carrier)
  strongContinuity : ∀ x, ContinuousAt (λ t => semigroup t x) 0
  semigroupProperty : ∀ s t, semigroup (s + t) = semigroup s ∘ semigroup t
  identityAtZero : semigroup 0 = id

structure SemigroupAdmittedObject where
  space : BanachSpace
  semigroup : C0Semigroup space
  generatorClosed : Prop
  resolventSetNonempty : Prop
  conclusion : generatorClosed ∧ resolventSetNonempty

def SemigroupWitnessClosed (O : SemigroupAdmittedObject) : Prop :=
  O.generatorClosed

end CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean
end HautevilleHouse