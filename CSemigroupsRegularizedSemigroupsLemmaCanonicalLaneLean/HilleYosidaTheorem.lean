import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean

structure HilleYosidaTheoremPackage (G : GeneratorClosurePackage)
    (P : RegularizedSemigroupPropertiesPackage) where
  generationTheorem : Prop
  resolventConvergence : Prop
  coreTheorem : Prop
  perturbationStability : Prop

structure HilleYosidaTheoremEvidence {G : GeneratorClosurePackage}
    {P : RegularizedSemigroupPropertiesPackage}
    (H : HilleYosidaTheoremPackage G P) where
  generationTheoremClosed : H.generationTheorem
  resolventConvergenceClosed : H.resolventConvergence
  coreTheoremClosed : H.coreTheorem
  perturbationStabilityClosed : H.perturbationStability

def HilleYosidaTheoremClosed {G : GeneratorClosurePackage}
    {P : RegularizedSemigroupPropertiesPackage}
    (H : HilleYosidaTheoremPackage G P) : Prop :=
  H.generationTheorem ∧ H.resolventConvergence ∧
  H.coreTheorem ∧ H.perturbationStability

theorem hille_yosida_theorem_closed_from_evidence
    {G : GeneratorClosurePackage} {P : RegularizedSemigroupPropertiesPackage}
    (H : HilleYosidaTheoremPackage G P)
    (E : HilleYosidaTheoremEvidence H) : HilleYosidaTheoremClosed H := by
  exact And.intro E.generationTheoremClosed
    (And.intro E.resolventConvergenceClosed
      (And.intro E.coreTheoremClosed E.perturbationStabilityClosed))

end CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean
end HautevilleHouse
