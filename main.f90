program orbital
  !Written by Retief Lubbe u11361850 on 25th April 2018
  !This program is to describe the motion of the earth and sun by Runga-Kutta method
  !Important things things to note we reduce the equations of motions to 4 differental equations (2 for x and 2 for y).
  ! we reduce the units of the mass
  use orbits
  implicit none
  integer n
  real(kind=8) :: pi
  pi= 4.*atan(1.0)
  ! Call subroutine that computes motion of earth around sun.
  ! Note we use 1.0_8 to force double precision here.
  ! variables are: n (steps), period, x initial, y initial, vx initial vy initial
  ! subroutine sits in orbit.f90
  call MotionEarthSun(4000,10.0_8,1.0_8, 0.0_8, 0.0_8, pi*2._8, 0.001_8)
  !2.68_8
end program orbital
