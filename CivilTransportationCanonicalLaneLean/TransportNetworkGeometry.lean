import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace CivilTransportationCanonicalLaneLean

structure TransportNetworkGeometryPackage where
  graph : Type u
  topology : TopologicalSpace graph
  costFunction : Type v
  demandMatrix : Type w
  capacity : Type x
  finiteGraph : Prop
  costSmooth : Prop
  demandFeasible : Prop
  capacityPositive : Prop

structure TransportNetworkGeometryEvidence (G : TransportNetworkGeometryPackage) where
  finiteGraphClosed : G.finiteGraph
  costSmoothClosed : G.costSmooth
  demandFeasibleClosed : G.demandFeasible
  capacityPositiveClosed : G.capacityPositive

def TransportNetworkGeometryClosed (G : TransportNetworkGeometryPackage) : Prop :=
  G.finiteGraph ∧ G.costSmooth ∧
  G.demandFeasible ∧ G.capacityPositive

theorem transport_network_geometry_closed_from_evidence
    (G : TransportNetworkGeometryPackage) (E : TransportNetworkGeometryEvidence G) :
    TransportNetworkGeometryClosed G := by
  exact And.intro E.finiteGraphClosed
    (And.intro E.costSmoothClosed
      (And.intro E.demandFeasibleClosed E.capacityPositiveClosed))

end CivilTransportationCanonicalLaneLean
end HautevilleHouse