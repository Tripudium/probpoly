# Multivariate local conditioning: existing theorem and relative corollary

12 September 2026. Clarification following the author's question about a
multivariate local result.

## What is already proved in the manuscript

Theorems 3.3 and 3.4 of `gaussian-conditioning.tex` are multivariate. For d
independent Gaussian equations from a common finite-dimensional coefficient
Hilbert space, assume the stated positive kernel metric and a deterministic
number N of simple roots almost surely. Sample the system, then one root
uniformly. With evaluation variance S(z), Jacobian J(z), and

\[
H_{jk}(z)=\partial_{\bar z_j}\partial_{z_k}\log S(z),\qquad
A=S^{-1/2}JH^{-1/2},
\]

the absolute coefficient-to-root condition using output metric H is
\(\kappa_H=\|A^{-1}\|_2\). The selected-root matrix A is independent of the
root location and has density proportional to
\(|\det A|^2\exp(-\|A\|_F^2)\). Its Gram matrix has the law of B*B for a
(d+1) by d standard complex Gaussian matrix B. Consequently

\[
\mathbb P_*(\kappa_H>t)\le
\min\{1,d(d+1)/(4t^4)\},\qquad
\lim_{t\to\infty}t^4\mathbb P_*(\kappa_H>t)=d(d+1)/4,
\]

and positive moments are finite exactly below order four. In particular

\[
\mathbb E_*\|A^{-1}\|_F^2=d,\qquad
\mathbb E_*\kappa_H^2\le d.
\]

The exact equality concerns the Frobenius inverse moment, not the spectral
condition's second moment. Degree independence here uses the kernel output
metric, which itself depends on the coefficient space and degrees.

## A relative Euclidean corollary for the box model

**Status: proved below from existing manuscript results; not yet inserted as
a separate corollary in the paper. No novelty claim.**

Let

\[
p_i(z)=\sum_{\alpha\in\{0,\ldots,n\}^d}c_{i,\alpha}z^\alpha,
\qquad i=1,\ldots,d,
\]

with all coefficients independent CN(0,1). Use the Euclidean norm of the full
coefficient array (its Frobenius norm) and Euclidean displacement of the full
root vector. The relative condition is

\[
\kappa_{\mathrm{coeff,rel}}(P,z)
=\sqrt{S(z)}\|J(z)^{-1}\|_2\frac{\|c\|_F}{\|z\|_2}.
\]

For a uniformly selected root, and every fixed d,

\[
\boxed{\mathbb E_*\log\kappa_{\mathrm{coeff,rel}}(P,Z)
=\left(\frac d2-1\right)\log n+O_d(1).}
\]

All logarithms used in the proof are absolutely integrable for each d,n.
This is a logarithmic mean statement, not a bound on the ordinary mean or
on the worst root.

**Proof.** Proposition 4.5 gives

\[
\mathbb E_*\log\kappa_{\mathrm{coeff}}=-\log n+O_d(1).
\]

There are M=d(n+1)^d complex coefficients. The selected-root law preserves
their Gaussian marginal because the root count N=d! n^d is deterministic.
Thus ||c||_F^2 is Gamma(M,1), and

\[
\mathbb E_*\log\|c\|_F=\tfrac12\psi(M),
\]

where psi is the digamma function. This identity follows by differentiating
the Gamma integral with respect to its shape parameter.

Put R_l=|Z_l|^2. Proposition 4.1 and Lemma 4.2 give inversion symmetry and

\[
\mathbb E_*\log R_l=0,\qquad
\mathbb E_*|\log R_l|=\frac{2\log(n+1)}n.
\]

The arithmetic–geometric mean inequality and an elementary upper bound give

\[
\tfrac12\log d+\frac1{2d}\sum_l\log R_l
\le\log\|Z\|_2
\le\tfrac12\log d+\tfrac12\sum_l\log^+R_l.
\]

Therefore the root norm logarithm is absolutely integrable and

\[
\mathbb E_*\log\|Z\|_2=\tfrac12\log d+\varepsilon_{n,d},\qquad
0\le\varepsilon_{n,d}\le\frac{d\log(n+1)}{2n}.
\]

We obtain the exact normalization conversion

\[
\mathbb E_*\log\kappa_{\mathrm{coeff,rel}}
=\mathbb E_*\log\kappa_{\mathrm{coeff}}
+\tfrac12\psi\bigl(d(n+1)^d\bigr)
-\tfrac12\log d-\varepsilon_{n,d}.
\]

Since psi(M)=log M+O(1/M), the asserted corollary follows. No independence
between the coefficient norm, root location, and condition number is required;
only linearity of expectation for integrable logarithms is used.

For the scalar coordinate output z_1, the same leading asymptotic follows
using the scalar statement of Proposition 4.5 and E_* log|Z_1|=0. The norms
and the output must be identified explicitly when making either comparison.

## Interpretation and prior work

The local problem is already controlled in several variables: the missing
systems result concerns an algebraic representation. In two variables the
relative Euclidean local condition has bounded expected logarithm uniformly
in degree. In general fixed dimension its geometric mean has degree scale
n^(d/2-1), up to constants depending on d. This does not bound a resultant,
eliminant, or multiplication-matrix condition number.

There is established sparse-systems precedent in
[Malajovich–Rojas, Theorems 1 and 4](https://arxiv.org/pdf/math/0212179).
Their geometric condition number and event involving some root require an
explicit normalization comparison with our absolute selected-root formulation.
The inverse-singular-value distribution used in the draft comes from classical
Wishart formulas, including
[Kumar–Sambasivam–Anand, Section 2.2](https://arxiv.org/html/1701.07402v2).
Neither a new local-conditioning principle nor priority for the relative box
asymptotic has been established by the present check.

An early systems theorem can legitimately state the existing local law,
together with the Euclidean box corollary. The unresolved method-specific
contribution should then be identified separately.
