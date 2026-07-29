import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilTransportationCanonicalLaneLean

structure ShockWavePackage where
  upstreamDensity : ℝ
  downstreamDensity : ℝ
  shockSpeed : ℝ
  rankineHugoniotCondition : Prop
  entropyCondition : Prop
  stability : Prop

structure ShockWaveEvidence (S : ShockWavePackage) where
  rankineHugoniotConditionClosed : S.rankineHugoniotCondition
  entropyConditionClosed : S.entropyCondition
  stabilityClosed : S.stability

def ShockWaveClosed (S : ShockWavePackage) : Prop :=
  S.rankineHugoniotCondition ∧ S.entropyCondition ∧ S.stability

theorem shock_wave_closed_from_evidence (S : ShockWavePackage)
    (E : ShockWaveEvidence S) : ShockWaveClosed S := by
  exact And.intro E.rankineHugoniotConditionClosed
    (And.intro E.entropyConditionClosed E.stabilityClosed)

end CivilTransportationCanonicalLaneLean
end HautevilleHouse
