module orbits
  contains
  subroutine MotionEarthSun(n, period, x0, y0, vx0, vy0, eps)
    implicit none
    integer, intent(in) :: n
    real(kind=8), intent(in) :: period, x0, y0, vx0, vy0,eps

    real(kind=8) ::t(0:n),x(0:n),y(0:n),vx(0:n),vy(0:n),r(0:n)
    ! temporary values no need to store them
    real(kind=8)::xhalf,yhalf,vxhalf,vyhalf,rhalf
    real(kind=8)::delta,pi
    integer:: i

      !initial conditions
      !number of times the earh orbits around sun
      ! period =1.0
      !we change delta as we change n.
      delta= period/real(n)
      !calculate pi explicity
      pi= 4.*atan(1.0)
      !define initial conditions at t=0
      !eps = 0.01
      x(0) = x0; y(0)= y0; vx(0)=vx0; vy(0)= vy0

      do i=0,n
      !increment ti
    	t(i) = real(i)*delta
      !find radius r
    	r(i) = sqrt(x(i)*x(i) +y(i)*y(i))
      !define escape for do loop if r becomes too small
      if (r(i) < eps) stop

    	!half step calculations for first set of DEs
    	xhalf = x(i) + delta/2.*vx(i)
    	yhalf = y(i) + delta/2.*vy(i)

    	vxhalf = vx(i) - delta/2.*4.*pi*pi*x(i)/r(i)/r(i)/r(i)
    	vyhalf = vy(i) - delta/2.*4.*pi*pi*y(i)/r(i)/r(i)/r(i)

    	!compute half step radius
    	rhalf = sqrt(xhalf*xhalf + yhalf*yhalf)


    	!compute final two step runga-kutta
    	x(i+1) = x(i) +delta*vxhalf
    	y(i+1) = y(i) +delta*vyhalf
    	vx(i+1) = vx(i) -delta*4.*pi*pi*xhalf/rhalf/rhalf/rhalf
    	vy(i+1) = vy(i) -delta*4.*pi*pi*yhalf/rhalf/rhalf/rhalf

    	!write output to generic file fort.10 can be plotted using xmgrace
    	write(10,*) x(i),y(i)
      end do

  end subroutine MotionEarthSun
end module
