import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilTransportationCanonicalLaneLean

structure TrafficAssignmentPackage where
  originDestinationMatrix : Type u
  routeSet : Type v
  linkCostFunction : Type w
  userEquilibrium : Prop
  systemOptimum : Prop
  wardropPrinciple : Prop
  convexCostFunction : Prop

structure TrafficAssignmentEvidence (T : TrafficAssignmentPackage) where
  userEquilibriumClosed : T.userEquilibrium
  systemOptimumClosed : T.systemOptimum
  wardropPrincipleClosed : T.wardropPrinciple
  convexCostFunctionClosed : T.convexCostFunction

def TrafficAssignmentClosed (T : TrafficAssignmentPackage) : Prop :=
  T.userEquilibrium ∧ T.systemOptimum ∧ T.wardropPrinciple ∧ T.convexCostFunction

theorem traffic_assignment_closed_from_evidence (T : TrafficAssignmentPackage)
    (E : TrafficAssignmentEvidence T) : TrafficAssignmentClosed T := by
  exact And.intro E.userEquilibriumClosed
    (And.intro E.systemOptimumClosed
      (And.intro E.wardropPrincipleClosed E.convexCostFunctionClosed))

end CivilTransportationCanonicalLaneLean
end HautevilleHouse
