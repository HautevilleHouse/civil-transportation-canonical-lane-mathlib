import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CivilTransportationCanonicalLaneLean.BottleneckCongestion

namespace HautevilleHouse
namespace CivilTransportationCanonicalLaneLean

structure NetworkDesign {D : TrafficFlowFundamentalDiagram}
    {C : CellTransmissionModel D} {A : TrafficAssignment C}
    {B : BottleneckCongestion A} where
  linkCapacityExpansion : Prop
  signalTimingOptimization : Prop
  congestionPricingScheme : Prop
  networkRobustness : Prop

structure NetworkDesignEvidence {D : TrafficFlowFundamentalDiagram}
    {C : CellTransmissionModel D} {A : TrafficAssignment C}
    {B : BottleneckCongestion A} (N : NetworkDesign B) where
  linkCapacityExpansionClosed : N.linkCapacityExpansion
  signalTimingOptimizationClosed : N.signalTimingOptimization
  congestionPricingSchemeClosed : N.congestionPricingScheme
  networkRobustnessClosed : N.networkRobustness

def NetworkDesignClosed {D : TrafficFlowFundamentalDiagram}
    {C : CellTransmissionModel D} {A : TrafficAssignment C}
    {B : BottleneckCongestion A} (N : NetworkDesign B) : Prop :=
  N.linkCapacityExpansion ∧ N.signalTimingOptimization ∧
  N.congestionPricingScheme ∧ N.networkRobustness

theorem networkDesign_closed_from_evidence
    {D : TrafficFlowFundamentalDiagram} {C : CellTransmissionModel D}
    {A : TrafficAssignment C} {B : BottleneckCongestion A}
    (N : NetworkDesign B) (E : NetworkDesignEvidence N) :
    NetworkDesignClosed N := by
  exact And.intro E.linkCapacityExpansionClosed
    (And.intro E.signalTimingOptimizationClosed
      (And.intro E.congestionPricingSchemeClosed E.networkRobustnessClosed))

end CivilTransportationCanonicalLaneLean
end HautevilleHouse
