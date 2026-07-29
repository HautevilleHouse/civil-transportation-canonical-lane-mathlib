import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilTransportationCanonicalLaneLean

structure QueueingModelPackage where
  arrivalRate : ℝ
  serviceRate : ℝ
  numberOfServers : ℕ
  queueLength : ℝ
  waitingTime : ℝ
  stabilityCondition : Prop
  littleSLaw : Prop
  steadyStateDistribution : Prop

structure QueueingModelEvidence (Q : QueueingModelPackage) where
  stabilityConditionClosed : Q.stabilityCondition
  littleSLawClosed : Q.littleSLaw
  steadyStateDistributionClosed : Q.steadyStateDistribution

def QueueingModelClosed (Q : QueueingModelPackage) : Prop :=
  Q.stabilityCondition ∧ Q.littleSLaw ∧ Q.steadyStateDistribution

theorem queueing_model_closed_from_evidence (Q : QueueingModelPackage)
    (E : QueueingModelEvidence Q) : QueueingModelClosed Q := by
  exact And.intro E.stabilityConditionClosed
    (And.intro E.littleSLawClosed E.steadyStateDistributionClosed)

end CivilTransportationCanonicalLaneLean
end HautevilleHouse
