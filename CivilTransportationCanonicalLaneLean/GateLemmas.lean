import HautevilleHouse.CivilTransportationCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace CivilTransportationCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end CivilTransportationCanonicalLaneLean
end HautevilleHouse