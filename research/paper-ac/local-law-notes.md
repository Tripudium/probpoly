# Local-law section: proof and integration notes

Written 12 September 2026 for the new A–C paper. Source: `local-law.tex` in this directory. Existing manuscripts were not edited.

## Integration

Required macros are the agreed `\C`, `\E`, `\Estar`, `\Pstar`, `\CN`; standard amsmath/amssymb/amsthm and environments `lemma`, `theorem`, `example`, `proof`. All labels use `local-` or `sec:local-law`. No external equation labels are referenced. Root notation is `J_c(z)`, coefficient row represented by transposed column `c_i`, and common evaluation vector is the column `\phi`.

The opening assumptions repeat the essential probabilistic setup deliberately: finite holomorphic basis on an open set U, S>0, H positive definite, deterministic N>=1 simple roots almost surely. The parent can shorten this repetition if the preceding framework already states it fully.

## Covariance convention

This is the most important normalization check. For a derivative row r=Dp, the covariance relevant to right multiplication is E[r* r], whose jk entry is E[overline(∂jp) ∂kp]. Consequently

\[
H_{jk}=\partial_{\bar z_j}\partial_{z_k}\log S,
\quad
H=S^{-1}D\phi^*(I-\phi\phi^*/S)D\phi,
\quad
J\mid P(z)=0\ \overset d=\sqrt S\,G H^{1/2}.
\]

This is consistent with the root tangent norm δz*Hδz and the normalized Jacobian A=S^{-1/2}JH^{-1/2}. The input coefficient norm must use the same orthonormal basis in which the coefficients are standard complex Gaussian. Then κH=√S||H^{1/2}J^{-1}||₂=||A^{-1}||₂ exactly. The opposite mixed-derivative convention in the old draft is transposed relative to its row factorization; it should not be copied.

## Mathematical status

The section has complete short proofs except the classical smallest-Wishart-eigenvalue density, which is cited precisely. Nothing is a conjecture in this section. The hypotheses are explicit rather than hidden in “usual Kac–Rice assumptions”: holomorphic finite Gaussian field, pointwise nondegenerate values, no singular zeros almost surely. Compact exhaustion, marking by the full coefficient array, a monotone-class extension, and truncation handle arbitrary nonnegative Borel marks and the noncompact domain.

The universal induced Ginibre law and root intensity are established mathematics. The paper should present the contribution as their coefficient-condition interpretation in the kernel metric and their use in separating intrinsic and representation conditioning. An exhaustive priority search for this interpretation was not performed.

The direct cofactor proof

\[
\mathbb E_*\|A^{-1}\|_F^2
=\mathbb E\|\operatorname{adj}G\|_F^2/d!
=d^2(d-1)!/d!=d
\]

is shorter and more transparent than citing an inverse-Wishart moment formula. The sharp inverse spectral-norm tail is C_d t^-4 with C_d=d(d+1)/4. Thus positive moments exist exactly for q<4, with bound 4 C_d^{q/4}/(4-q). The normalized dimension-uniform bound uses (d+1)/(4d)<=1/2.

For d=1 the exact tail is 1-exp(-t^-2)(1+t^-2), the second moment is 1, and the asymptotic coefficient is 1/2. This is a useful convention check: CN(0,1) here has density π^-1 exp(-|z|²), with each real component of variance 1/2.

Exact checks with Python rational arithmetic verified that the smallest-eigenvalue density integrates to one and that the binomial coefficient inequality in the tail proof holds for d=1,...,20. A non-real covariance check used φ=(1,z1+i z2,z2) at zero: conditional on p(0)=0, the derivative row is (c1,i c1+c2), giving E[r* r]=[[1,i],[-i,2]]. This agrees with ∂bar_j ∂_k log S and distinguishes the required convention from its transpose.

## Verified primary sources

- Azaïs–Wschebor, *Level Sets and Extrema of Random Processes and Fields* (2009), Theorems 6.2 and 6.4. [Publisher](https://onlinelibrary.wiley.com/doi/book/10.1002/9780470434642), [author-hosted text](https://www.math.univ-toulouse.fr/~azais/styles/other/student/level.pdf). Existing bibliography key: `azais2009level`.
- Fischmann, Bruzda, Khoruzhenko, Sommers, Życzkowski, “Induced Ginibre ensemble of random matrices and quantum operations,” *J. Phys. A* **45** (2012), 075203. [arXiv](https://arxiv.org/abs/1107.5019), DOI 10.1088/1751-8113/45/7/075203. New key: `fischmann2012induced`.
- Kumar, Sambasivam, Anand, “Smallest eigenvalue density for regular or fixed-trace complex Wishart-Laguerre ensemble and entanglement in coupled kicked tops,” *J. Phys. A* **50** (2017), 345201. [Section 2.2, Eq. (15)](https://arxiv.org/html/1701.07402v2#S2.SS2), DOI 10.1088/1751-8121/aa7d0e. New key: `kumar2017smallest`. The normalization in §2 is exp(-tr W), exactly matching standard CN(0,1), and rectangularity α=m-n=1 gives x exp(-dx)L_{d-1}^{(2)}(-x). Do not insert a factor 2 in the exponential.

Suggested new BibTeX entries:

```bibtex
@article{fischmann2012induced,
  author = {Fischmann, Jonit and Bruzda, Wojciech and Khoruzhenko, Boris A. and Sommers, Hans-J{\"u}rgen and {\.{Z}}yczkowski, Karol},
  title = {Induced {Ginibre} ensemble of random matrices and quantum operations},
  journal = {Journal of Physics A: Mathematical and Theoretical},
  volume = {45}, number = {7}, pages = {075203}, year = {2012},
  doi = {10.1088/1751-8113/45/7/075203},
  url = {https://arxiv.org/abs/1107.5019}
}
@article{kumar2017smallest,
  author = {Kumar, Santosh and Sambasivam, Bharath and Anand, Shashank},
  title = {Smallest eigenvalue density for regular or fixed-trace complex {Wishart--Laguerre} ensemble and entanglement in coupled kicked tops},
  journal = {Journal of Physics A: Mathematical and Theoretical},
  volume = {50}, number = {34}, pages = {345201}, year = {2017},
  doi = {10.1088/1751-8121/aa7d0e},
  url = {https://arxiv.org/abs/1701.07402}
}
```
