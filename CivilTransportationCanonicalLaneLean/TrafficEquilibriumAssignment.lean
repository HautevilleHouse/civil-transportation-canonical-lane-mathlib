import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilTransportationCanonicalLaneLean

structure TrafficEquilibriumAssignmentPackage {G : RoadNetworkPackage}
    {F : TrafficFlowPDEPackage G} {D : FundamentalDiagramPackage G F}
    {K : KinematicWaveSolverPackage G F D} {S : GodunovSchemePackage G F D K}
    {J : NetworkJunctionModelPackage G F D K S} where
  userEquilibriumCondition : Prop
  systemOptimalCondition : Prop
  wardropFirstPrinciple : Prop
  wardropSecondPrinciple : Prop

structure TrafficEquilibriumAssignmentEvidence {G : RoadNetworkPackage}
    {F : TrafficFlowPDEPackage G} {D : FundamentalDiagramPackage G F}
    {K : KinematicWaveSolverPackage G F D} {S : GodunovSchemePackage G F D K}
    {J : NetworkJunctionModelPackage G F D K S}
    (E : TrafficEquilibriumAssignmentPackage G F D K S J) where
  userEquilibriumConditionClosed : E.userEquilibriumCondition
  systemOptimalConditionClosed : E.systemOptimalCondition
  wardropFirstPrincipleClosed : E.wardropFirstPrinciple
  wardropSecondPrincipleClosed : E.wardropSecondPrinciple

def TrafficEquilibriumAssignmentClosed {G : RoadNetworkPackage}
    {F : TrafficFlowPDEPackage G} {D : FundamentalDiagramPackage G F}
    {K : KinematicWaveSolverPackage G F D} {S : GodunovSchemePackage G F D K}
    {J : NetworkJunctionModelPackage G F D K S}
    (E : TrafficEquilibriumAssignmentPackage G F D K S J) : Prop :=
  E.userEquilibriumCondition ∧ E.systemOptimalCondition ∧
  E.wardropFirstPrinciple ∧ E.wardropSecondPrinciple

theorem traffic_equilibrium_assignment_closed_from_evidence
    {G : RoadNetworkPackage} {F : TrafficFlowPDEPackage G}
    {D : FundamentalDiagramPackage G F} {K : KinematicWaveSolverPackage G F D}
    {S : GodunovSchemePackage G F D K} {J : NetworkJunctionModelPackage G F D K S}
    (E : TrafficEquilibriumAssignmentPackage G F D K S J)
    (Ev : TrafficEquilibriumAssignmentEvidence E) : TrafficEquilibriumAssignmentClosed E := by
  exact And.intro Ev.userEquilibriumConditionClosed
    (And.intro Ev.systemOptimalConditionClosed
      (And.intro Ev.wardropFirstPrincipleClosed Ev.wardropSecondPrincipleClosed))

end CivilTransportationCanonicalLaneLean
end HautevilleHouse