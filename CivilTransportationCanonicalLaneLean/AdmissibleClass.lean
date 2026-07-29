import HautevilleHouse.CivilTransportationCanonicalLaneLean.CivilTransportationObjects

namespace HautevilleHouse
namespace CivilTransportationCanonicalLaneLean

structure AdmissibleClass where
  object : AdmittedTransportObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  TransportationWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CivilTransportationCanonicalLaneLean
end HautevilleHouse