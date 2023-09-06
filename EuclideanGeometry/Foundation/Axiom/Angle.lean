import EuclideanGeometry.Foundation.Axiom.Ray

noncomputable section
namespace EuclidGeom
/- Define values of oriented angles, in (-π, π], modulo 2 π. -/
/- Define oriented angles, ONLY taking in two rays starting at one point!  And define ways to construct oriented angles, by given three points on the plane, and etc.  -/
class OAngle (P : Type _) [EuclideanPlane P] where 
  start_ray : Ray P
  end_ray : Ray P
  source_eq_source : start_ray.source = end_ray.source

namespace OAngle

def mk_pt_pt_pt {P : Type _} [EuclideanPlane P] (A O B : P) (h₁ : A ≠ O) (h₂ : B ≠ O): OAngle P where
  start_ray := Ray.mk_pt_pt O A h₁
  end_ray := Ray.mk_pt_pt O B h₂
  source_eq_source := rfl

def mk_ray_pt {P : Type _} [EuclideanPlane P] (ray : Ray P) (A : P) (h : A ≠ ray.source ) : OAngle P where
  start_ray := ray
  end_ray := Ray.mk_pt_pt ray.source A h
  source_eq_source := rfl

def value {P : Type _} [EuclideanPlane P] (A : OAngle P): ℝ := StdR2.angle (A.start_ray.direction.vec) (A.end_ray.direction.vec)

def angle_of_three_point_nontriv {P : Type _} [EuclideanPlane P] (A O B : P) (h₁ : A ≠ O) (h₂ : B ≠ O): ℝ := 
(OAngle.mk_pt_pt_pt _ _ _ h₁ h₂).value

def angle_of_two_ray_of_eq_source {P : Type _} [EuclideanPlane P] (start_ray end_ray : Ray P) (h : start_ray.source = end_ray.source) : ℝ := (OAngle.mk start_ray end_ray h).value

end OAngle

scoped notation "OANG" => OAngle.mk_pt_pt_pt

scoped notation "ANG" => OAngle.angle_of_three_point_nontriv

scoped notation "∠" => OANG -- Is this notation really needed?

/- theorem - π < angle.value, angle.value ≤ π,  -/

/- Operations on oriented angles, such a additivity of the evaluation of oriented angles.  -/
/- theorem l1 l2 l3 add angle; sub angle -/
/- theorem O A B C add angle; sub angle-/

/- 90 degree -/

end EuclidGeom