1.EM算法--期望最大算法
用于解决概率生成模型
针对具有隐变量的混合模型的参数估计问题
EM算法是一个迭代的算法，\theta_{t+1}=argmax_\theta int_z log(p(x,z|\theta))p(z|x,\theta)dz
=E_z|x\theta[log p(x,z|\theta)]
log p(x|\theta)=log p(x,z|\theta)/p(z|x)
log p(x|\theta)=....
等式两边同时对于q(z)计算期望
左边=\int_z p(z|x,\theta) log p(x|\theta)dz=log p(x|\theta)
右边=\int_z p(z|x,\theta)log p(x,z|\theta)dz-\int_Z p(z|x,\theta) log p(z|x,\theta)dz
第一部分设为Q(\theta,\theta^(t)),第二部分H...
Q(t+1)>=Q(t)
H(t+1)<=Q(t)(KL divergence或者E[logx <= log E(x)])，收敛可证，log p(x|\theta_(t+1))>=log p(x|\theta(t))
log p(x|\theta)=ELBO + KL(q||p)   KL...>=0
log p(x|\theta)>=ELBO
EM公式的想法是，使得ELBO变得最大，argmax_\theta，寻找\theta的最大值
log p(x|\theta)=log \int_z p(x,z|\theta)dz=log \int_z p(x,z|\theta)/q(z) q(z) dz=log E_{q(z)}[P(x,z|\theta)/q(z)]
>= E_{q(z)}[log p(x,z|\theta)/q(z)]
然后利用jensen inequlity，对于凸函数，t属于[0,1] c=ta+(1-t)b f(c)>=tf(a)+(1-t)f(b)
取等时，p(x,z|\theta)/q(z)=C;q(z)=p(z|x,\theta)

2.GEM
\hat \theta = argmax_\theta P(x|\theta)
从狭义到广义；狭义EM是广义EM的一个特例
生成模型：假设存在一个z，z影响x（计算最大似然函数的时候由于不知道p(x)）
GMM HMM在不同的z的假设上建立，
ELBO=E_q(z) [log p(x,z|\theta)/q(z)]
KL(q||p)=\int q(z) log q(z)/p(z|x,\theta)dz
p(z|x,\theta)可能无法计算
广义EM
E-step:q^(t+1)=argmax_q ELBO(q,\theta^(t))
M-step:\theta^(t+1)=argmax ELBO(q^(t+1),\theta)
（这里的迭代方法可以理解为坐标上升法SMO：先固定一个维度，优化，然后再固定另一个维度；梯度上升法：沿梯度上升）
ELBO函数可以进行变形=E_q[log P(x,z)-log q]=E_q[log p(x,z)]-E_q[log q]
因此，ELBO函数可以写成一部分加上熵函数
迭代中的问题，如果后验无法计算，需要使用变分方法，基于平均场的VI--变分EM VBEM
MCEM

 
