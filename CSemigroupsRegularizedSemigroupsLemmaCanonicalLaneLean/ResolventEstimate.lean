import CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean.RegularizedSemigroupCore

namespace HautevilleHouse
namespace CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean

structure ResolventEstimatePackage (R : RegularizedSemigroupPackage) where
  resolventSet : Prop
  resolventBound : Prop
  sectorialEstimate : Prop
  resolventEquation : Prop
  resolventSetTerm : resolventSet
  resolventBoundTerm : resolventBound
  sectorialEstimateTerm : sectorialEstimate
  resolventEquationTerm : resolventEquation

structure ResolventEstimateEvidence {R : RegularizedSemigroupPackage} (E : ResolventEstimatePackage R) where
  resolventSetClosed : E.resolventSet
  resolventBoundClosed : E.resolventBound
  sectorialEstimateClosed : E.sectorialEstimate
  resolventEquationClosed : E.resolventEquation

def ResolventEstimateClosed {R : RegularizedSemigroupPackage} (E : ResolventEstimatePackage R) : Prop :=
  E.resolventSet ∧ E.resolventBound ∧ E.sectorialEstimate ∧ E.resolventEquation

theorem resolvent_estimate_closed_from_evidence
    {R : RegularizedSemigroupPackage} (E : ResolventEstimatePackage R)
    (Ev : ResolventEstimateEvidence E) : ResolventEstimateClosed E := by
  exact And.intro Ev.resolventSetClosed
    (And.intro Ev.resolventBoundClosed
      (And.intro Ev.sectorialEstimateClosed Ev.resolventEquationClosed))

end CSemigroupsRegularizedSemigroupsLemmaCanonicalLaneLean
end HautevilleHouse