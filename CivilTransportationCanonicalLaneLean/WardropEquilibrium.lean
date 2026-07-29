import HautevilleHouse.CivilTransportationCanonicalLaneLean.TrafficFlowPDE

namespace HautevilleHouse
namespace CivilTransportationCanonicalLaneLean

structure WardropEquilibriumPackage {G : TransportNetworkGeometryPackage}
    (F : TrafficFlowPDEPackage G) where
  userOptimization : Prop
  pathCostEqualization : Prop
  variationalInequality : Prop
  equilibriumFlow : Prop

structure WardropEquilibriumEvidence {G : TransportNetworkGeometryPackage}
    {F : TrafficFlowPDEPackage G} (W : WardropEquilibriumPackage F) where
  userOptimizationClosed : W.userOptimization
  pathCostEqualizationClosed : W.pathCostEqualization
  variationalInequalityClosed : W.variationalInequality
  equilibriumFlowClosed : W.equilibriumFlow

def WardropEquilibriumClosed {G : TransportNetworkGeometryPackage}
    {F : TrafficFlowPDEPackage G} (W : WardropEquilibriumPackage F) : Prop :=
  W.userOptimization ∧ W.pathCostEqualization ∧
  W.variationalInequality ∧ W.equilibriumFlow

theorem wardrop_equilibrium_closed_from_evidence
    {G : TransportNetworkGeometryPackage} {F : TrafficFlowPDEPackage G}
    (W : WardropEquilibriumPackage F) (E : WardropEquilibriumEvidence W) :
    WardropEquilibriumClosed W := by
  exact And.intro E.userOptimizationClosed
    (And.intro E.pathCostEqualizationClosed
      (And.intro E.variationalInequalityClosed E.equilibriumFlowClosed))

end CivilTransportationCanonicalLaneLean
end HautevilleHouse