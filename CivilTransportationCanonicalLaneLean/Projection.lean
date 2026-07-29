import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilTransportationCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure TransportFlowState where
  networkState : PrimitiveTransportNetwork

def transportFlowProjection : Projection TransportFlowState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem transport_projection_idempotent (x : TransportFlowState) :
    transportFlowProjection.toFun (transportFlowProjection.toFun x) = transportFlowProjection.toFun x := by
  exact transportFlowProjection.idempotent x

end CivilTransportationCanonicalLaneLean
end HautevilleHouse