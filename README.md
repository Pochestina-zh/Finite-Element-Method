# Finite-Element-Method
本人学习何晓明老师（密苏里科技大学）课程后，整理的详细代码和作业习题
## 1D_Poisson equation
* 求解1维Poisson方程
  $$
  -\frac{d}{dx}(c(x)\frac{du(x)}{dx})=f(x),\quad,0\leq x \leq 1
  $$
  $$
  u(0)=0,u(1)=cos(1)
  $$
* 程序可供用户选择线性元或者二次元求解
方法一：

$$ f(x)=\left\{
\begin{aligned}
x & = & \cos(t) \\
y & = & \sin(t) \\
z & = & \frac xy
\end{aligned}
\right.
$$

方法二：
$$ F^{HLLC}=\left\{
\begin{array}{rcl}
F_L       &      & {0      <      S_L}\\
F^*_L     &      & {S_L \leq 0 < S_M}\\
F^*_R     &      & {S_M \leq 0 < S_R}\\
F_R       &      & {S_R \leq 0}
\end{array} \right. $$

方法三:
$$f(x)=
\begin{cases}
0& \text{x=0}\\
1& \text{x!=0}
\end{cases}$$
