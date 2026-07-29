import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilTransportationCanonicalLaneLean

structure GodunovSchemePackage {G : RoadNetworkPackage}
    {F : TrafficFlowPDEPackage G} {D : FundamentalDiagramPackage G F}
    {K : KinematicWaveSolverPackage G F D} where
  riemannSolver : Prop
  numericalFlux : Prop
  CFLcondition : Prop
  convergenceOrder : Prop

structure GodunovSchemeEvidence {G : RoadNetworkPackage}
    {F : TrafficFlowPDEPackage G} {D : FundamentalDiagramPackage G F}
    {K : KinematicWaveSolverPackage G F D}
    (S : GodunovSchemePackage G F D K) where
  riemannSolverClosed : S.riemannSolver
  numericalFluxClosed : S.numericalFlux
  CFLconditionClosed : S.CFLcondition
  convergenceOrderClosed : S.convergenceOrder

def GodunovSchemeClosed {G : RoadNetworkPackage}
    {F : TrafficFlowPDEPackage G} {D : FundamentalDiagramPackage G F}
    {K : KinematicWaveSolverPackage G F D}
    (S : GodunovSchemePackage G F D K) : Prop :=
  S.riemannSolver ∧ S.numericalFlux ∧
  S.CFLcondition ∧ S.convergenceOrder

theorem godunov_scheme_closed_from_evidence
    {G : RoadNetworkPackage} {F : TrafficFlowPDEPackage G}
    {D : FundamentalDiagramPackage G F} {K : KinematicWaveSolverPackage G F D}
    (S : GodunovSchemePackage G F D K) (E : GodunovSchemeEvidence S) :
    GodunovSchemeClosed S := by
  exact And.intro E.riemannSolverClosed
    (And.intro E.numericalFluxClosed
      (And.intro E.CFLconditionClosed E.convergenceOrderClosed))

end CivilTransportationCanonicalLaneLean
end HautevilleHouse