import CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean.RegularizedSemigroupsLemma

namespace HautevilleHouse
namespace CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean

structure CRegularizedSemigroupPackage (X : Type u) [TopologicalSpace X] where
  csemigroup : CSemigroup X
  regularizedSemigroup : RegularizedSemigroup X
  lemmaPackage : RegularizedSemigroupsLemmaPackage X
  lemmaEvidence : RegularizedSemigroupsLemmaEvidence lemmaPackage

def CRegularizedSemigroupPackageClosed (X : Type u) [TopologicalSpace X]
    (P : CRegularizedSemigroupPackage X) : Prop :=
  RegularizedSemigroupsLemmaClosed P.lemmaPackage

theorem c_regularized_semigroup_package_closed_from_evidence
    {X : Type u} [TopologicalSpace X] (P : CRegularizedSemigroupPackage X) :
    CRegularizedSemigroupPackageClosed X P := by
  exact regularized_semigroups_lemma_closed_from_evidence P.lemmaPackage P.lemmaEvidence

end CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean
end HautevilleHouse