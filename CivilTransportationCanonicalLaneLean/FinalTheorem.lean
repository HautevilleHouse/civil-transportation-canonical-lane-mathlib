import canonicalLaneMathlib.AdmissibleClass
import CivilTransportationCanonicalLaneLean.BridgeLemmas
import CivilTransportationCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace CivilTransportationCanonicalLaneLean

def ConstrainedTrafficClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_traffic_endgame (A : AdmissibleClass) :
    ConstrainedTrafficClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CivilTransportationCanonicalLaneLean
end HautevilleHouse
