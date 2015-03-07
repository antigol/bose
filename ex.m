tau = linspace(1e-2, 3, 100);

N = [1, 2, 5, 10, 1e4];

u = zeros(length(N), length(tau));

for k = 1:length(N),
	u(k,:) = bose(tau, N(k));
end

plot(tau, u);

%legendCell = cellstr(num2str(N, 'N = %-d'));
%legend(legendCell);

legend('N=1', 'N=2', 'N=5', 'N=10', 'N=1e4')

xlabel('temperature')
ylabel('potentiel chimique');
