import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilTransportationCanonicalLaneLean

structure CellTransmissionModelPackage where
  cellLengths : List ℝ
  timeStep : ℝ
  sendingFunction : ℕ → ℝ → ℝ
  receivingFunction : ℕ → ℝ → ℝ
  fluxConservation : Prop
  demandSupplyConsistency : Prop
  inflowOutflowMatching : Prop

structure CellTransmissionModelEvidence (C : CellTransmissionModelPackage) where
  fluxConservationClosed : C.fluxConservation
  demandSupplyConsistencyClosed : C.demandSupplyConsistency
  inflowOutflowMatchingClosed : C.inflowOutflowMatching

def CellTransmissionModelClosed (C : CellTransmissionModelPackage) : Prop :=
  C.fluxConservation ∧ C.demandSupplyConsistency ∧ C.inflowOutflowMatching

theorem cell_transmission_model_closed_from_evidence (C : CellTransmissionModelPackage) (E : CellTransmissionModelEvidence C) :
    CellTransmissionModelClosed C := by
  exact And.intro E.fluxConservationClosed
    (And.intro E.demandSupplyConsistencyClosed E.inflowOutflowMatchingClosed)

end CivilTransportationCanonicalLaneLean
end HautevilleHouse
