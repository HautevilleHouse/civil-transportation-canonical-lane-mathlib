import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilTransportationCanonicalLaneLean

structure MacroscopicFundamentalDiagramPackage where
  networkAggregatedFlow : ℝ → ℝ
  networkAggregatedDensity : ℝ → ℝ
  scatterObservation : Set (ℝ × ℝ)
  scatterBounded : Prop
  capacityDrop : Prop
  hysteresis : Prop
  scattederedValidation : Prop

structure MacroscopicFundamentalDiagramEvidence (M : MacroscopicFundamentalDiagramPackage) where
  scatterBoundedClosed : M.scatterBounded
  capacityDropClosed : M.capacityDrop
  hysteresisClosed : M.hysteresis
  scattederedValidationClosed : M.scattederedValidation

def MacroscopicFundamentalDiagramClosed (M : MacroscopicFundamentalDiagramPackage) : Prop :=
  M.scatterBounded ∧ M.capacityDrop ∧ M.hysteresis ∧ M.scattederedValidation

theorem macroscopic_fundamental_diagram_closed_from_evidence (M : MacroscopicFundamentalDiagramPackage) (E : MacroscopicFundamentalDiagramEvidence M) :
    MacroscopicFundamentalDiagramClosed M := by
  exact And.intro E.scatterBoundedClosed (And.intro E.capacityDropClosed (And.intro E.hysteresisClosed E.scattederedValidationClosed))

end CivilTransportationCanonicalLaneLean
end HautevilleHouse
