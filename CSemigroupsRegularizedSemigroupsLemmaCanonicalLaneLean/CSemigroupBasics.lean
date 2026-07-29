import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean

structure CSemigroup (A : Type) where
  multiplication : A → A → A
  associativity : ∀ x y z : A, multiplication (multiplication x y) z = multiplication x (multiplication y z)

structure CSemigroupWithIdentity (A : Type) extends CSemigroup A where
  identity : A
  leftIdentity : ∀ x : A, multiplication identity x = x
  rightIdentity : ∀ x : A, multiplication x identity = x

structure CSemigroupAdmittedObject where
  carrier : Type
  cSemigroup : CSemigroupWithIdentity carrier
  property : Prop
  conclusion : property

def CSemigroupWitnessClosed (O : CSemigroupAdmittedObject) : Prop :=
  O.property

end CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean
end HautevilleHouse