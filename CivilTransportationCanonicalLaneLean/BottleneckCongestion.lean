import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CivilTransportationCanonicalLaneLean.TrafficAssignment

namespace HautevilleHouse
namespace CivilTransportationCanonicalLaneLean

structure BottleneckCongestion {D : TrafficFlowFundamentalDiagram}
    {C : CellTransmissionModel D} {A : TrafficAssignment C} where
  bottleneckLocation : Type u
  capacityDrop : Prop
  queueFormation : Prop
  shockwavePropagation : Prop
  capacityRecovery : Prop

structure BottleneckCongestionEvidence {D : TrafficFlowFundamentalDiagram}
    {C : CellTransmissionModel D} {A : TrafficAssignment C}
    (B : BottleneckCongestion A) where
  capacityDropClosed : B.capacityDrop
  queueFormationClosed : B.queueFormation
  shockwavePropagationClosed : B.shockwavePropagation
  capacityRecoveryClosed : B.capacityRecovery

def BottleneckCongestionClosed {D : TrafficFlowFundamentalDiagram}
    {C : CellTransmissionModel D} {A : TrafficAssignment C}
    (B : BottleneckCongestion A) : Prop :=
  B.capacityDrop ∧ B.queueFormation ∧ B.shockwavePropagation ∧ B.capacityRecovery

theorem bottleneckCongestion_closed_from_evidence
    {D : TrafficFlowFundamentalDiagram} {C : CellTransmissionModel D}
    {A : TrafficAssignment C} (B : BottleneckCongestion A)
    (E : BottleneckCongestionEvidence B) : BottleneckCongestionClosed B := by
  exact And.intro E.capacityDropClosed
    (And.intro E.queueFormationClosed
      (And.intro E.shockwavePropagationClosed E.capacityRecoveryClosed))

end CivilTransportationCanonicalLaneLean
end HautevilleHouse
