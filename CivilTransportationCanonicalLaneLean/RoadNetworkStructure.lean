import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilTransportationCanonicalLaneLean

structure RoadNetworkPackage where
  roadSegments : Type u
  intersections : Type v
  connectivityGraph : Type w
  segmentLengths : roadSegments → ℝ
  capacity : roadSegments → ℝ
  freeFlowSpeed : roadSegments → ℝ
  graphConnected : Prop
  finiteSegments : Prop
  finiteIntersections : Prop

structure RoadNetworkEvidence (N : RoadNetworkPackage) where
  graphConnectedClosed : N.graphConnected
  finiteSegmentsClosed : N.finiteSegments
  finiteIntersectionsClosed : N.finiteIntersections

def RoadNetworkClosed (N : RoadNetworkPackage) : Prop :=
  N.graphConnected ∧ N.finiteSegments ∧ N.finiteIntersections

theorem road_network_closed_from_evidence (N : RoadNetworkPackage)
    (E : RoadNetworkEvidence N) : RoadNetworkClosed N := by
  exact And.intro E.graphConnectedClosed
    (And.intro E.finiteSegmentsClosed E.finiteIntersectionsClosed)

end CivilTransportationCanonicalLaneLean
end HautevilleHouse
