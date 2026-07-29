import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilTransportationCanonicalLaneLean

structure KinematicWaveSolverPackage {G : RoadNetworkPackage}
    {F : TrafficFlowPDEPackage G} {D : FundamentalDiagramPackage G F} where
  waveSpeedFormula : Prop
  characteristicCurves : Prop
  shockFormation : Prop
  entropyCondition : Prop

structure KinematicWaveSolverEvidence {G : RoadNetworkPackage}
    {F : TrafficFlowPDEPackage G} {D : FundamentalDiagramPackage G F}
    (K : KinematicWaveSolverPackage G F D) where
  waveSpeedFormulaClosed : K.waveSpeedFormula
  characteristicCurvesClosed : K.characteristicCurves
  shockFormationClosed : K.shockFormation
  entropyConditionClosed : K.entropyCondition

def KinematicWaveSolverClosed {G : RoadNetworkPackage}
    {F : TrafficFlowPDEPackage G} {D : FundamentalDiagramPackage G F}
    (K : KinematicWaveSolverPackage G F D) : Prop :=
  K.waveSpeedFormula ∧ K.characteristicCurves ∧
  K.shockFormation ∧ K.entropyCondition

theorem kinematic_wave_solver_closed_from_evidence
    {G : RoadNetworkPackage} {F : TrafficFlowPDEPackage G}
    {D : FundamentalDiagramPackage G F} (K : KinematicWaveSolverPackage G F D)
    (E : KinematicWaveSolverEvidence K) : KinematicWaveSolverClosed K := by
  exact And.intro E.waveSpeedFormulaClosed
    (And.intro E.characteristicCurvesClosed
      (And.intro E.shockFormationClosed E.entropyConditionClosed))

end CivilTransportationCanonicalLaneLean
end HautevilleHouse