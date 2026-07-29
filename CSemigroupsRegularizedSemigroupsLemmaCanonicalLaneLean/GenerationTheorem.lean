import CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean.RegularizedSemigroup

namespace HautevilleHouse
namespace CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean

structure GenerationTheoremPackage {X : BanachSpace} (T : C0Semigroup X) where
  generator : X.carrier → X.carrier
  domainDense : Prop
  resolventRepresentation : ∀ λ > 0, (λ • id - generator)⁻¹ = ∫ t, exp(-λ t) • T.semigroup t
  hilleYosidaEstimate : Prop

def GenerationTheoremClosed {X : BanachSpace} {T : C0Semigroup X} (P : GenerationTheoremPackage T) : Prop :=
  P.domainDense ∧ P.hilleYosidaEstimate

theorem generation_theorem_from_package {X : BanachSpace} {T : C0Semigroup X} (P : GenerationTheoremPackage T) (h : P.domainDense ∧ P.hilleYosidaEstimate) : GenerationTheoremClosed P := h

end CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean
end HautevilleHouse