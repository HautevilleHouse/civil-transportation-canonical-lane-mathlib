import HautevilleHouse.CivilTransportationCanonicalLaneLean.CivilTransportationStatement
import CanonicalLaneMathlibCore
import Mathlib.Topology.Basic

namespace HautevilleHouse
namespace CivilTransportationCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure TransportationNetwork where
  nodes : Type
  edges : Type
  topology : TopologicalSpace (nodes × edges)

structure AdmittedTransportObject where
  network : TransportationNetwork
  flowDemand : Prop
  capacityConstraint : Prop
  equilibriumSolution : Prop
  conclusion : equilibriumSolution

structure TransportationEndgameState where
  object : AdmittedTransportObject

def TransportationWitnessClosed (O : AdmittedTransportObject) : Prop :=
  O.equilibriumSolution

end CivilTransportationCanonicalLaneLean
end HautevilleHouse