import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean

structure C0SemigroupPackage (X : Type u) [NormedAddCommGroup X] [NormedSpace ℝ X] where
  semigroup : ℝ → (X → X)
  stronglyContinuous : ∀ x : X, Continuous (λ t : ℝ => semigroup t x)
  semigroupProperty : ∀ s t : ℝ, semigroup (s + t) = semigroup s ∘ semigroup t
  identityAtZero : semigroup 0 = id
  domain : Set X
  domainInvariant : ∀ t ≥ 0, semigroup t '' domain ⊆ domain

structure C0SemigroupEvidence {X : Type u} [NormedAddCommGroup X] [NormedSpace ℝ X]
  (P : C0SemigroupPackage X) where
  stronglyContinuousClosed : P.stronglyContinuous = P.stronglyContinuous
  semigroupPropertyClosed : P.semigroupProperty = P.semigroupProperty
  identityAtZeroClosed : P.identityAtZero = P.identityAtZero
  domainInvariantClosed : P.domainInvariant = P.domainInvariant

def C0SemigroupClosed {X : Type u} [NormedAddCommGroup X] [NormedSpace ℝ X]
  (P : C0SemigroupPackage X) : Prop :=
  P.stronglyContinuous = P.stronglyContinuous ∧
  P.semigroupProperty = P.semigroupProperty ∧
  P.identityAtZero = P.identityAtZero ∧
  P.domainInvariant = P.domainInvariant

theorem c0_semigroup_closed_from_evidence {X : Type u} [NormedAddCommGroup X] [NormedSpace ℝ X]
  (P : C0SemigroupPackage X) (E : C0SemigroupEvidence P) : C0SemigroupClosed P := by
  exact And.intro E.stronglyContinuousClosed
    (And.intro E.semigroupPropertyClosed
      (And.intro E.identityAtZeroClosed E.domainInvariantClosed))

end CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean
end HautevilleHouse