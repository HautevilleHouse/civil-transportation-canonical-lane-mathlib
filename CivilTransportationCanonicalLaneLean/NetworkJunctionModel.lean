import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilTransportationCanonicalLaneLean

structure NetworkJunctionModelPackage {G : RoadNetworkPackage}
    {F : TrafficFlowPDEPackage G} {D : FundamentalDiagramPackage G F}
    {K : KinematicWaveSolverPackage G F D} {S : GodunovSchemePackage G F D K} where
  junctionTopology : Type u
  supplyDemandRules : Prop
  flowDistributionMatrix : Prop
  invariantPreservation : Prop

structure NetworkJunctionModelEvidence {G : RoadNetworkPackage}
    {F : TrafficFlowPDEPackage G} {D : FundamentalDiagramPackage G F}
    {K : KinematicWaveSolverPackage G F D} {S : GodunovSchemePackage G F D K}
    (J : NetworkJunctionModelPackage G F D K S) where
  junctionTopologyClosed : J.junctionTopology
  supplyDemandRulesClosed : J.supplyDemandRules
  flowDistributionMatrixClosed : J.flowDistributionMatrix
  invariantPreservationClosed : J.invariantPreservation

def NetworkJunctionModelClosed {G : RoadNetworkPackage}
    {F : TrafficFlowPDEPackage G} {D : FundamentalDiagramPackage G F}
    {K : KinematicWaveSolverPackage G F D} {S : GodunovSchemePackage G F D K}
    (J : NetworkJunctionModelPackage G F D K S) : Prop :=
  J.junctionTopology ∧ J.supplyDemandRules ∧
  J.flowDistributionMatrix ∧ J.invariantPreservation

theorem network_junction_model_closed_from_evidence
    {G : RoadNetworkPackage} {F : TrafficFlowPDEPackage G}
    {D : FundamentalDiagramPackage G F} {K : KinematicWaveSolverPackage G F D}
    {S : GodunovSchemePackage G F D K} (J : NetworkJunctionModelPackage G F D K S)
    (E : NetworkJunctionModelEvidence J) : NetworkJunctionModelClosed J := by
  exact And.intro E.junctionTopologyClosed
    (And.intro E.supplyDemandRulesClosed
      (And.intro E.flowDistributionMatrixClosed E.invariantPreservationClosed))

end CivilTransportationCanonicalLaneLean
end HautevilleHouse