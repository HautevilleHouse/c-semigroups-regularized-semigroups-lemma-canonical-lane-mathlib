import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean

structure RegularizedLemmaPackage {X : Type u} [NormedAddCommGroup X] [NormedSpace ℝ X]
  {C0 : C0SemigroupPackage X} (R : RegularizedSemigroupPackage C0) where
  lemmaStatement : Prop
  lemmaProof : lemmaStatement
  lemmaKeyEstimate : Prop
  lemmaKeyEstimateProof : lemmaKeyEstimate

structure RegularizedLemmaEvidence {X : Type u} [NormedAddCommGroup X] [NormedSpace ℝ X]
  {C0 : C0SemigroupPackage X} {R : RegularizedSemigroupPackage C0}
  (L : RegularizedLemmaPackage R) where
  lemmaStatementClosed : L.lemmaStatement
  lemmaKeyEstimateClosed : L.lemmaKeyEstimate

def RegularizedLemmaClosed {X : Type u} [NormedAddCommGroup X] [NormedSpace ℝ X]
  {C0 : C0SemigroupPackage X} {R : RegularizedSemigroupPackage C0}
  (L : RegularizedLemmaPackage R) : Prop :=
  L.lemmaStatement ∧ L.lemmaKeyEstimate

theorem regularized_lemma_closed_from_evidence {X : Type u} [NormedAddCommGroup X] [NormedSpace ℝ X]
  {C0 : C0SemigroupPackage X} {R : RegularizedSemigroupPackage C0}
  (L : RegularizedLemmaPackage R) (E : RegularizedLemmaEvidence L) : RegularizedLemmaClosed L := by
  exact And.intro E.lemmaStatementClosed E.lemmaKeyEstimateClosed

end CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean
end HautevilleHouse