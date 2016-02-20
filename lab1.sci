//1
function [x]=foo(a, b)
  x = 4*exp(-3*a) + b^(2*%pi)
endfunction
printf("1: %f\n", foo(8, 3.9))

//2
k = [1:1:10]
a = 2.6
printf("2: %f\n", sum(k*a^2))

//3
s = [3 5 2.5 59.4 6.4 25 2.2 35 0.5 0 5.6]
n = sqrt(sum(s .^ 2))
printf("3: %f\n", n)

//4
v = [15 12 5 6]
s = poly(v, "x", "coeff")
printf("4: %s\n", pol2str(s))

//5
v = [4 5]
p = poly(v, "x", "roots")
printf("5: %s\n", pol2str(p))

//6
f = [0:0.1:1]
x = exp(f*%pi*%i)
result = freq(p, 1, x)
printf("6:\n")
disp(result)

//7
s = poly(0, 's')
A = [
  s+s.^2+s.^3, s+4*s.^2;
  (s+7)/s.^2, 4/(s-3)
]
printf("7:\n")
disp(A)

//8
d = det(A)
printf("8:\n")
disp(d)

//9
printf("9/numer:\n")
disp(numer(A))
printf("9/denom:\n")
disp(denom(A))

//10
function [x]=bar(x, y, z)
  x = eye(x, y) * rand(y, z)
endfunction
printf("10:\n")
disp(bar(4,5,6))

//11
t = 0:0.01:%pi/2
s = sin(2*%pi*t) + 0.25*sin(2*%pi*3*t)
sn = s + 0.3*sin(2*%pi*20*t)
plot(t, s, t, sn)
