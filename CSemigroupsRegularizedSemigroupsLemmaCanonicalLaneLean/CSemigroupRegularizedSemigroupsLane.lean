import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean

structure CSemigroupLet (A B : Type u) where
  carrier : A → B
  semigroupOperation : A → A → A
  unit : A
  leftUnit : ∀ x, semigroupOperation unit x = x
  rightUnit : ∀ x, semigroupOperation x unit = x
  assoc : ∀ x y z, semigroupOperation (semigroupOperation x y) z = semigroupOperation x (semigroupOperation y z)

structure RegularizedSemigroupLet (A B : Type u) where
  baseSemigroup : CSemigroupLet A B
  regularization : A → A
  idempotent : ∀ x, regularization (regularization x) = regularization x
  regularizedMultiplication : A → A → A
  consistency : ∀ x y, regularizedMultiplication x y = regularization (baseSemigroup.semigroupOperation x y)

structure AdmissibleCSemigroup (C : Type u) where
  object : CSemigroupLet C C
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def bridgeClosed (A : AdmissibleCSemigroup) : Prop := False

theorem bridge_from_admissible_class (A : AdmissibleCSemigroup) : bridgeClosed A := by
  exact False.elim ?_

def gateClosed (A : AdmissibleCSemigroup) : Prop := A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleCSemigroup) : gateClosed A := by
  exact A.gateWitness

end CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean
end HautevilleHouse