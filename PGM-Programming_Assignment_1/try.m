function = try()
C = FactorProduct(FACTORS.INPUT(1),FACTORS.INPUT(2))
D = FactorProduct(FACTORS.INPUT(3),C)

product = 1;
for i = (1:(length(FACTORS.INPUT)-1))
	product = product*FactorProduct(FACTORS.INPUT(i),FACTORS.INPUT(i+1))
end

