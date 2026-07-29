import HautevilleHouse.CivilTransportationCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace CivilTransportationCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  TransportationWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end CivilTransportationCanonicalLaneLean
end HautevilleHouse