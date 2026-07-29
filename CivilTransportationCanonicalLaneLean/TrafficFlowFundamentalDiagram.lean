import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilTransportationCanonicalLaneLean

structure TrafficFlowFundamentalDiagram where
  density : Type u
  flow : Type v
  speed : Type w
  densityFlowRelation : Prop
  criticalDensity : Prop
  jamDensity : Prop
  freeFlowSpeed : Prop

structure TrafficFlowFundamentalDiagramEvidence (D : TrafficFlowFundamentalDiagram) where
  densityFlowRelationClosed : D.densityFlowRelation
  criticalDensityClosed : D.criticalDensity
  jamDensityClosed : D.jamDensity
  freeFlowSpeedClosed : D.freeFlowSpeed

def TrafficFlowFundamentalDiagramClosed (D : TrafficFlowFundamentalDiagram) : Prop :=
  D.densityFlowRelation ∧ D.criticalDensity ∧ D.jamDensity ∧ D.freeFlowSpeed

theorem trafficFlowFundamentalDiagram_closed_from_evidence
    (D : TrafficFlowFundamentalDiagram) (E : TrafficFlowFundamentalDiagramEvidence D) :
    TrafficFlowFundamentalDiagramClosed D := by
  exact And.intro E.densityFlowRelationClosed
    (And.intro E.criticalDensityClosed
      (And.intro E.jamDensityClosed E.freeFlowSpeedClosed))

end CivilTransportationCanonicalLaneLean
end HautevilleHouse
