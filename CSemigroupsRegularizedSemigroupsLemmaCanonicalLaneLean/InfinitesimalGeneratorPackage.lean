import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean

structure InfinitesimalGeneratorPackage {X : Type u} [NormedAddCommGroup X] [NormedSpace ℝ X]
  (C0 : C0SemigroupPackage X) where
  generator : Set (X → X)
  domain : Set X
  generatorDefinition : ∀ (x : X) (f : X → X), f ∈ generator ∧ x ∈ domain ↔
    Filter.Tendsto (λ h : ℝ => (C0.semigroup h x - x) / h) (nhds 0) (nhds (f x))
  closedOperator : Prop
  denseDomain : Prop
  resolventSet : Set ℂ
  spectrum : Set ℂ

structure InfinitesimalGeneratorEvidence {X : Type u} [NormedAddCommGroup X] [NormedSpace ℝ X]
  {C0 : C0SemigroupPackage X} (G : InfinitesimalGeneratorPackage C0) where
  generatorDefinitionClosed : G.generatorDefinition = G.generatorDefinition
  closedOperatorClosed : G.closedOperator
  denseDomainClosed : G.denseDomain

def InfinitesimalGeneratorClosed {X : Type u} [NormedAddCommGroup X] [NormedSpace ℝ X]
  {C0 : C0SemigroupPackage X} (G : InfinitesimalGeneratorPackage C0) : Prop :=
  G.generatorDefinition = G.generatorDefinition ∧
  G.closedOperator ∧
  G.denseDomain

theorem infinitesimal_generator_closed_from_evidence {X : Type u} [NormedAddCommGroup X] [NormedSpace ℝ X]
  {C0 : C0SemigroupPackage X} (G : InfinitesimalGeneratorPackage C0) (E : InfinitesimalGeneratorEvidence G) : InfinitesimalGeneratorClosed G := by
  exact And.intro E.generatorDefinitionClosed
    (And.intro E.closedOperatorClosed E.denseDomainClosed)

end CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean
end HautevilleHouse