function [U, Nrel] = bose(TAU, N)

c = 2 / (sqrt(pi) * zeta(3/2));

function z = f(x, u, tau) 
	z = sqrt(x) ./ (exp((x - u) / tau) - 1);
end

U = zeros(size(TAU));
Nrel = zeros(size(TAU));

for i=1:length(TAU),
	tau = TAU(i);
	
	[U(i), ignore, info] = fminbnd(@(u) ...
		abs(1 - 1/N / (exp(-u/tau)-1) - c * integral(@(x) f(x, u, tau) ...
			, 0, Inf)), -10, 0, optimset('TolX',1e-5));
	
	if info~=1,
		display('error');
	end
	
	dN2 = 1/(2*cosh(U(i)/tau)-2) + 2*N/(sqrt(pi) * zeta(3/2)) * ...
		integral(@(x) sqrt(x)./(2*cosh((x-U(i))/tau)-2), 0, Inf);
	
	Nrel(i) = sqrt(dN2) / N;
end
end
