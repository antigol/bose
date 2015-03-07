function U = bose(TAU, N)

alpha = 2 / (sqrt(pi) * zeta(3/2));

function z = f(x, u, tau) 
	z = x.^0.5 ./ (exp((x - u) / tau) - 1);
end

U = -ones(size(TAU));

for i=1:length(TAU),
	tau = TAU(i);
	
	Umin = min(U);
	U(i) = Umin;
	
	while U(i) / Umin - 1 < 0.05,
		[U(i), _, info] = fminbnd(@(u) abs(1 - 1/N / (exp(-u/tau)-1) - alpha * quad(@(x) f(x, u, tau), 0, Inf)), Umin, 0, optimset('TolX',1e-15));
		Umin = Umin * 2;
	end
	
	if info~=1,
		display('error');
	end
end

end
