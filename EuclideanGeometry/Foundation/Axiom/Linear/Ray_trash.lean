import EuclideanGeometry.Foundation.Axiom.Linear.Ray
import EuclideanGeometry.Foundation.Axiom.Basic.Plane_trash

noncomputable section

namespace EuclidGeom

variable {P : Type _} [EuclideanPlane P] (seg_nd : SegND P)

-- theorem same_extn_of_source_lies_int {seg_nd : SegND P} {A : P} (h : A LiesInt seg_nd) : (SEG_nd A seg_nd.target ) = seg_nd.extension

/-SegND_eq_midpoint_iff_in_seg_and_dist_target_eq_dist_source should be replaced by the following three
  midpoint → liesint seg_nd
  midpoint → dist source = dist target
  lieson ∧ dist source = dist target → midpoint

  by the way in_seg shoud be renamed by current naming system
-/

theorem pt_flip_center_is_midpoint {A B O : P} (h : B = pt_flip A O) : O = (SEG A B).midpoint := by
  unfold Seg.midpoint
  apply (eq_vadd_iff_vsub_eq _ _ _).mpr
  show VEC A O = (1 / 2 : ℝ) • (VEC A B)
  symm
  calc
    _ = (1 / 2 : ℝ) • (VEC A O + VEC O B) := by rw [vec_add_vec]
    _ = VEC A O := by
      rw [← pt_flip_vec_eq h, ← two_smul ℝ, smul_smul]
      simp

end EuclidGeom
