# Comparison with Bürgisser–Cucker–Rocha Cardozo

12 September 2026.

Source: `papers/elisa.pdf`, *On the condition of characteristic polynomials*,
Peter Bürgisser, Felipe Cucker, and Elisa Rocha Cardozo,
[arXiv:1510.04419v2](https://arxiv.org/abs/1510.04419v2), 23 November 2015.
The local PDF has 15 pages. The text was read throughout, with the main statements,
condition definition, and norm discussion also inspected in rendered pages.

This paper should have been included in the earlier literature assessment. It
is a direct precedent for the project's central question about conditioning
after an algebraic transformation, not merely background on random roots.

## Main result and exact comparison of conventions

Their random input is an n by n complex Ginibre matrix A, with independent
standard real and imaginary parts, so E|A_ij|^2 = 2. The intermediate polynomial
is its monic characteristic polynomial chi_A. Polynomial errors are measured
in the Euclidean coefficient norm in the monomial basis, relative to the input
norm; root errors are relative to the root modulus. Their equation (3), page 4,
is exactly our scalar relative coefficient condition formula:

\[
\operatorname{cond}(q,\lambda)
=\frac{\|q\|_2\sqrt{\sum_{k=0}^{n}|\lambda|^{2k}}}
{|\lambda|\,|q'(\lambda)|}.
\]

Sample A first and then one of its n eigenvalues uniformly. Theorem 1, page 3,
gives

\[
\mathbb E_*\log\operatorname{cond}(\chi_A,\lambda)
\ge \tfrac12(n-1)\log n-1.54n.
\]

Theorem 2, page 4, gives

\[
\mathbb E_*\operatorname{cond}(\chi_A,\lambda)^2\ge2^n(n-1)!.
\]

Theorem 1 also gives a linear lower bound for the minimum of the indexed
expectations under the radial labeling used in the paper. This should not be
rewritten as a lower bound on the expectation of the minimum over roots, or as
a high-probability statement. The exact constants above belong to their entry
variance convention; rescaling the matrix rescales the polynomial variable,
which matters for a fixed monomial coefficient norm.

## Why this does not establish our companion moment theorem

| Feature | Bürgisser–Cucker–Rocha Cardozo | Current companion section |
| --- | --- | --- |
| Random input | Matrix A with independent Gaussian entries | Polynomial p with independent Gaussian coefficients |
| Algebraic transformation | A maps to its characteristic polynomial chi_A | p maps to the ordinary companion matrix C_p |
| Intermediate perturbations | Arbitrary polynomial coefficient errors | Arbitrary matrix entry errors |
| Main quantity | Relative coefficient-to-root conditioning of chi_A | Companion overlap Lambda and its comparison with coefficient conditioning |
| Relevant law | Polynomial law induced by the Ginibre matrix | Matrix law induced by the Gaussian polynomial |

The identity chi_(C_p) = p/a_n does not identify these experiments. A Gaussian
matrix is not a random companion matrix, and its characteristic coefficients
are not independent Gaussian coefficients. Nor is the eigenvector overlap
determined by the spectrum alone. Thus their theorem neither proves nor
contradicts the proposed companion moment profile. It does establish that
average conditioning of an algebraically induced representation is already
a developed research question. Novelty cannot rest on that broad viewpoint.

## What transfers to the systems project

For a system P with N simple roots z_1,...,z_N, let g be a fixed scalar
polynomial output separating the roots. Set lambda_j = g(z_j) and define the
monic eliminant

\[
q_P(t)=\prod_{j=1}^{N}(t-\lambda_j).
\]

It is the characteristic polynomial of multiplication by g on the reduced
quotient algebra. This is the direct analogue of the characteristic-polynomial
construction in the source. The law of q_P is induced by P and must be analyzed
as such; neither Gaussian coefficient statistics nor Ginibre eigenvalue
statistics can be substituted without proof.

There is a useful exact deterministic decomposition. Write
K_N(r) = sum_(k=0)^N r^k and assume all lambda_j are distinct and nonzero. Then

\[
\begin{aligned}
\frac1N\sum_{j=1}^{N}\log\kappa_{\mathrm{coeff,rel}}(q_P,\lambda_j)
={}&\log\|q_P\|_2
+\frac1{2N}\sum_{j=1}^{N}\log K_N(|\lambda_j|^2)
-\frac1N\sum_{j=1}^{N}\log|\lambda_j|\\
&-\frac1N\sum_{j\ne k}\log|\lambda_j-\lambda_k|.
\end{aligned}
\]

This follows directly from the condition formula and
q_P'(lambda_j) = product_(k != j)(lambda_j-lambda_k). It needs no independence
assumption. It separates a coefficient norm, evaluation and output scales, and
the logarithmic energy of projected pairs of roots. The source's proof of
Theorem 1 uses lower bounds on these factors and Kostlan's radial law; its
proof of Theorem 2 uses cancellation of derivative factors against the
Vandermonde square in the Ginibre eigenvalue density.

For our system-induced root process the pair-energy term suggests using
two-point Kac–Rice. The coefficient norm is an additional global quantity and
must also be estimated. The random-projection identity in Part F of the original
assessment is compatible with this approach. To obtain a comparison with the
original system problem, subtract the logarithm of the relative coefficient
condition for the same scalar output g. A condition bound for q_P by itself is
not that ratio and does not control numerical formation of q_P.

This makes eliminants/RUR a substantive alternative to the bivariate overlap
target. The source supplies a model analysis and a conceptual precedent, not a
ready-made systems theorem. The local one-point Jacobian law is still useful,
but cannot determine these global representation quantities.

## Norms and scope of the comparison

Section 4.1 distinguishes normwise and componentwise coefficient perturbations.
Its componentwise findings are numerical experiments (10,000 matrices per size,
n = 2,...,100), not an analogue of Theorems 1–2. We should preserve that distinction
and specify the perturbation norm at every intermediate stage.

The comparison above uses the affine normwise condition in equation (3).
Transferring the projective discussion in Section 4.2 would require a separate
normalization check against the precise derivative norm in our setup; it is not
needed for the present conclusion.

## Consequence for the manuscript

The systems introduction should identify this paper as a principal precedent:
good average conditioning for an original random input does not guarantee good
conditioning after passing to polynomial coefficients. The research question
is which multivariate algebraic representations create such amplification,
under their actual induced distributions and stated perturbation norms.
Keep the univariate companion result as a special case, with its exact novelty
still subject to checking. The present PDF has not been edited during this
source-comparison turn.
