import HautevilleHouse.CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean.RegularizedSemigroupsPackage

namespace HautevilleHouse
namespace CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean

structure SpectralMappingPackage {G : RegularizedSemigroupsPackage} where
  spectrum : Type
  spectralMappingProperty : Prop
  resolventEstimate : Prop

structure SpectralMappingEvidence {G : RegularizedSemigroupsPackage}
    (S : SpectralMappingPackage G) where
  spectralMappingPropertyClosed : S.spectralMappingProperty
  resolventEstimateClosed : S.resolventEstimate

def SpectralMappingClosed {G : RegularizedSemigroupsPackage}
    (S : SpectralMappingPackage G) : Prop :=
  S.spectralMappingProperty ∧ S.resolventEstimate

theorem spectral_mapping_closed_from_evidence
    {G : RegularizedSemigroupsPackage} (S : SpectralMappingPackage G)
    (E : SpectralMappingEvidence S) : SpectralMappingClosed S := by
  exact And.intro E.spectralMappingPropertyClosed E.resolventEstimateClosed

end CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean
end HautevilleHouse