# Finite-Element-Method
本人学习何晓明老师（密苏里科技大学）课程后，整理的详细代码和作业习题
## 1D_Poisson equation
一维Poisson方程的形式为
$$
-\frac{d}{dx}(c(x)\frac{du(x)}{dx})=f(x)
$$
* 任务：求解1维Poisson方程
  $$
  -\frac{d}{dx}(e(x)\frac{du(x)}{dx})=-e(x)[cos(x)-2sin(x)-xcos(x)-xsin(x)],\quad,0\leq x \leq 1
  $$
  $$
  u(0)=0,u(1)=cos(1)
  $$
* 功能：可供用户选择线性元或者二次元求解
