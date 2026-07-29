import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilTransportationCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  carriedRemainder : String

def sourceRepository : String := "civil-transportation-canonical-lane"
def sourceDescription : String := "Civil Transportation Theorem: feasible flow with minimized cost"

def sourceTheoremStatement : TheoremStatement :=
  { sourceKey := sourceRepository
    theoremName := sourceRepository
    theoremObject := sourceDescription
    classicalBoundary := "classical boundary remains open"
    carriedRemainder := "unrestricted classical closure carried"
  }

theorem theorem_statement_source_key_checked :
    sourceTheoremStatement.sourceKey = sourceRepository := by
  unfold sourceTheoremStatement
  rfl

theorem theorem_statement_carried_remainder_recorded :
    sourceTheoremStatement.carriedRemainder = "unrestricted classical closure carried" := by
  unfold sourceTheoremStatement
  rfl

end CivilTransportationCanonicalLaneLean
end HautevilleHouse