import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilTransportationCanonicalLaneLean

structure PrimitiveTransportNetwork where
  nodes : Type
  edges : Type
  origin : edges → nodes
  destination : edges → nodes
  capacity : edges → ℝ
  travelTime : edges → ℝ

structure PrimitiveTravelDemand where
  origin : nodes
  destination : nodes
  volume : ℝ

def networkLoad (net : PrimitiveTransportNetwork) (demand : PrimitiveTravelDemand) : ℝ :=
  demand.volume / net.capacity (some edge) -- placeholder

theorem network_load_nonneg (net : PrimitiveTransportNetwork) (demand : PrimitiveTravelDemand) :
    networkLoad net demand ≥ 0 := by
  positivity

end CivilTransportationCanonicalLaneLean
end HautevilleHouse