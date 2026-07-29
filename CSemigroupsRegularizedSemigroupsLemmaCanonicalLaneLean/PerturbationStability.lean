import CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean.ResolventEstimate

namespace HautevilleHouse
namespace CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean

structure PerturbationStabilityPackage {R : RegularizedSemigroupPackage}
    (E : ResolventEstimatePackage R) where
  boundedPerturbation : Prop
  mildPerturbation : Prop
  stabilityEstimate : Prop
  perturbedGeneratorClosed : Prop
  boundedPerturbationTerm : boundedPerturbation
  mildPerturbationTerm : mildPerturbation
  stabilityEstimateTerm : stabilityEstimate
  perturbedGeneratorClosedTerm : perturbedGeneratorClosed

structure PerturbationStabilityEvidence {R : RegularizedSemigroupPackage}
    {E : ResolventEstimatePackage R} (P : PerturbationStabilityPackage E) where
  boundedPerturbationClosed : P.boundedPerturbation
  mildPerturbationClosed : P.mildPerturbation
  stabilityEstimateClosed : P.stabilityEstimate
  perturbedGeneratorClosedClosed : P.perturbedGeneratorClosed

def PerturbationStabilityClosed {R : RegularizedSemigroupPackage}
    {E : ResolventEstimatePackage R} (P : PerturbationStabilityPackage E) : Prop :=
  P.boundedPerturbation ∧ P.mildPerturbation ∧ P.stabilityEstimate ∧ P.perturbedGeneratorClosed

theorem perturbation_stability_closed_from_evidence
    {R : RegularizedSemigroupPackage} {E : ResolventEstimatePackage R}
    (P : PerturbationStabilityPackage E) (Ev : PerturbationStabilityEvidence P) :
    PerturbationStabilityClosed P := by
  exact And.intro Ev.boundedPerturbationClosed
    (And.intro Ev.mildPerturbationClosed
      (And.intro Ev.stabilityEstimateClosed Ev.perturbedGeneratorClosedClosed))

end CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean
end HautevilleHouse