import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CivilTransportationCanonicalLaneLean

structure ReviewerGate where
  gateName : String
  threshold : ℝ
  modelValidated : Bool

def bridgeCertification (gates : List ReviewerGate) : Bool :=
  gates.all (fun g => g.modelValidated)

theorem bridge_certification_complete (gates : List ReviewerGate) (h : bridgeCertification gates) :
    ∀ g ∈ gates, g.modelValidated := by
  intro g hg
  have := h
  exact (by
    unfold bridgeCertification at this
    exact (List.all_mem_of_all this hg))

end CivilTransportationCanonicalLaneLean
end HautevilleHouse