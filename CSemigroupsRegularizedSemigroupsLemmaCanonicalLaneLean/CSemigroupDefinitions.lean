import HautevilleHouse.CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean

structure CSemigroupPackage where
  space : Type u
  norm : space → ℝ
  semigroup : ℝ → space → space
  stronglyContinuous : Prop
  semigroupProperty : Prop
  generator : space → space
  resolvent : ℝ → space → space
  generatorClosed : Prop

structure CSemigroupEvidence (C : CSemigroupPackage) where
  stronglyContinuousClosed : C.stronglyContinuous
  semigroupPropertyClosed : C.semigroupProperty
  generatorClosedClosed : C.generatorClosed

def CSemigroupClosed (C : CSemigroupPackage) : Prop :=
  C.stronglyContinuous ∧ C.semigroupProperty ∧ C.generatorClosed

theorem c_semigroup_closed_from_evidence (C : CSemigroupPackage) (E : CSemigroupEvidence C) :
    CSemigroupClosed C := by
  exact And.intro E.stronglyContinuousClosed
    (And.intro E.semigroupPropertyClosed E.generatorClosedClosed)

end CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean
end HautevilleHouse