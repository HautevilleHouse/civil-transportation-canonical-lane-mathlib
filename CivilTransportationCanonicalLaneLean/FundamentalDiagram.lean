import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilTransportationCanonicalLaneLean

structure FundamentalDiagramPackage where
  densityRange : Set ℝ
  flowAsFunctionOfDensity : ℝ → ℝ
  criticalDensity : ℝ
  maxFlow : ℝ
  jamDensity : ℝ
  concaveShape : Prop
  maximumAtCritical : Prop

structure FundamentalDiagramEvidence (F : FundamentalDiagramPackage) where
  concaveShapeClosed : F.concaveShape
  maximumAtCriticalClosed : F.maximumAtCritical

def FundamentalDiagramClosed (F : FundamentalDiagramPackage) : Prop :=
  F.concaveShape ∧ F.maximumAtCritical

theorem fundamental_diagram_closed_from_evidence (F : FundamentalDiagramPackage) (E : FundamentalDiagramEvidence F) :
    FundamentalDiagramClosed F := by
  exact And.intro E.concaveShapeClosed E.maximumAtCriticalClosed

end CivilTransportationCanonicalLaneLean
end HautevilleHouse
