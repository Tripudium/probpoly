# Literature check for the A–C paper

12 September 2026. Targeted primary-source check for the draft, with emphasis on
the distinction between random polynomial conditioning and conditioning of the
companion representation. This search does not certify priority.

## Main conclusion

**Subsequent correction:** the earlier search omitted the locally available
Bürgisser–Cucker–Rocha Cardozo paper, `papers/elisa.pdf`, on conditioning of
characteristic polynomials of Gaussian matrices. This is a principal precedent
for average conditioning after algebraic transformations. Its ensemble and
condition number differ from those in the companion theorem. See
[`elisa-comparison.md`](elisa-comparison.md) for the exact statements and the
consequences for the systems project. The scope recommendation is also revised
in [`systems-scope-correction.md`](systems-scope-correction.md).

The strongest candidate contribution remains the degree-uniform companion overlap
moment theorem, especially if paired with a matching logarithmic second moment.
The searches did not locate a theorem proving either
`sup_n E_* Lambda^q < infinity` for `q<2` or `E_* Lambda^2 ~ 2 log n` for the ordinary
Frobenius companion of a complex iid Gaussian Kac polynomial. The exact conditioned
quotient-Gram formula is a useful, explicit statement in its own right. One should
describe these results directly and avoid an unsupported “first” claim.

The following are already established ingredients: scalar coefficient conditioning
with standard Fubini–Study output, complex zero Kac–Rice formulas and kernel
intensities, the induced Ginibre law, and the Wishart smallest-eigenvalue density.
There is a long deterministic literature comparing polynomial and companion
perturbation geometries. The draft should explicitly acknowledge these foundations.

## An essential known scalar comparison

### Follow-up: does Beltrán already analyze the companion ensemble?

14 September 2026. Rechecked the Armentano–Beltrán paper below, especially
Theorem 1.1, Remark 1.4, and Section 3.1. Remark 1.4 explicitly discusses
companion algorithms. Theorem 1.1 perturbs the entries of the coefficient
matrices of a matrix polynomial; scalar coefficient perturbations are its
matrix-size-one specialization, detailed in Section 3.1. It does not average sensitivity to arbitrary perturbations
of the companion matrix induced by those data. The distinction persists
after matching affine/projective output normalizations. In differential
terms, their scalar problem controls the coefficient-to-root derivative
`D eigenvalue(C_p) D companion(p)`, while the overlap is the norm of
`D eigenvalue(C_p)` on the full matrix perturbation space.

A further direct conceptual precedent is Beltrán–Shub,
[*The complexity and geometry of numerically solving polynomial systems*](https://personales.unican.es/beltranc/archivos/ContMath2013.pdf),
Section 9, p. 93, Problem 9.3. Following an explicit discussion of companion
matrices, they ask about average eigenvalue conditioning among matrices with
a given characteristic polynomial. This is a different averaging problem
from selecting one fixed companion representation of a random polynomial,
but it anticipates the project's representation-conditioning motivation.
Its appearance as a question in 2013 does not establish its current status.

The targeted follow-up found no Beltrán theorem giving the draft's specific
companion overlap moments or tail. This is evidence about the works checked,
not a certification of novelty. The distinction between the two perturbation
spaces is firm; priority of the exact companion estimates remains provisional.

Armentano–Beltrán, *The polynomial eigenvalue problem is well conditioned for random
inputs*, SIMAX **40**(1) (2019), 175–193, DOI
[10.1137/17M1139941](https://epubs.siam.org/doi/10.1137/17M1139941).
The [author preprint](https://www.cmat.edu.uy/~diego/documents/arxiv-Matrix_pencils.pdf),
Section 3.1, equation (7), explicitly states

\[
\mu_{\rm FS}(p,z)=
\frac{\|a\|_2\sqrt{\sum_{j=0}^n|z|^{2j}}}
 {(1+|z|^2)|p'(z)|},\qquad
\frac1n\mathbb E\sum_{p(z)=0}\mu_{\rm FS}(p,z)^2=1.
\]

The coefficients are iid standard circular complex Gaussian. Input uses the
coefficient Euclidean norm with relative scaling by `||a||`; output uses standard
Fubini–Study length `|dz|/(1+|z|²)` on `CP¹`. Their Theorem 1.1 treats matrix
polynomials too: with matrix size `m` and degree `n`, the averaged squared condition
is `((n+1)m²−1)/n`. This is conditioning of the polynomial eigenproblem in its
coefficient data, rather than the induced companion matrix under arbitrary matrix
perturbations. Remark 1.4 discusses companion algorithms and concludes with
statements about both polynomial rootfinding and polynomial eigenvalue problems;
Remark 1.5 treats random perturbation directions. Remark 1.4 should not be
described as concerning scalar coefficient perturbations alone.

Projectivizing the input makes no difference to the displayed root derivative:
the derivative annihilates the complex radial direction `C·a`, so restricting it
to `a^perp` leaves its operator norm unchanged. This last observation is an elementary
interpretation of the formula, not a further claim from the source. The paper's
kernel metric `h_n(r)|dz|²` differs from standard Fubini–Study geometry.

## Deterministic polynomial versus companion conditioning

Toh–Trefethen, *Pseudozeros of polynomials and pseudospectra of companion matrices*,
Numerische Mathematik **68** (1994), 403–425. Their
[author PDF](https://people.maths.ox.ac.uk/trefethen/publication/PDF/1994_61.pdf)
builds the comparison through weighted coefficient metrics, polynomial pseudozeros,
matrix pseudospectra, and balancing. It is important conceptual precedent for the
draft's input/representation distinction; it does not establish the Gaussian
degree-uniform overlap moment profile proposed here. Bibliographic year is 1994,
confirmed on the PDF and the [author's publication list](https://blog.nus.edu.sg/mattohkc/papers/).

De Terán–Dopico–Pérez, *Eigenvalue condition numbers and pseudospectra of Fiedler
matrices*, Calcolo **54**(1) (2017), 319–365, DOI
[10.1007/s10092-016-0189-9](https://researchportal.uc3m.es/display/act460877).
The [author manuscript](https://gauss.uc3m.es/fteran/papers/calcolo2016.pdf)
proves deterministic comparisons and records random-polynomial experiments.
Coefficient magnitude and choice of companion matter; the experiments are not
degree-uniform average theorems. This is especially relevant when explaining why
the paper fixes the unbalanced Frobenius companion and the monomial quotient basis.

Alam's *On the sensitivity analysis of eigenvalues*,
[publisher PDF](https://journals.uwyo.edu/index.php/ela/article/download/1497/1497/),
Section 5, gives explicit companion eigenvectors, root/companion condition
comparisons, and equality between structured companion and monic coefficient
conditioning. It is an optional additional citation. Metadata is inconsistent:
the PDF says 2016, pages 223–236, while the journal landing page labels volume 29
as 2015. It was therefore omitted from the minimal BibTeX file.

## Multivariate motivation and limits

Bürgisser–Cucker–Rocha Cardozo,
[*On the condition of characteristic polynomials*](https://arxiv.org/abs/1510.04419),
already establish severe average coefficient-root conditioning for characteristic
polynomials induced by Gaussian matrices. For a uniformly selected eigenvalue,
their Theorem 1 gives an expected log-condition lower bound
`(n-1) log(n)/2 - 1.54 n` with their Gaussian normalization. This is especially
relevant to system eliminants and characteristic polynomials of multiplication
matrices, whose coefficients also have induced, non-Gaussian laws. It does not
supply an iid Gaussian law for those matrices or polynomials.

Noferini–Townsend, *Numerical instability of resultant methods for multidimensional
rootfinding*, SINUM **54**(2) (2016), 719–743, DOI
[10.1137/15M1022513](https://epubs.siam.org/doi/10.1137/15M1022513),
proves worst-case amplification for hidden-variable resultants, including
dimension-exponential effects for Cayley and squaring for bivariate Sylvester.

Graf–Townsend's published title is *Numerical instability of algebraic rootfinders*,
LAA **729** (2026), 308–336, DOI `10.1016/j.laa.2025.10.009`, verified on
[Townsend's publication page](https://alextownsend.net/publications/).
The [preprint](https://arxiv.org/abs/2408.02805) has the older title *Numerical
Instability of Algebraic Rootfinding Methods*. It extends the intermediate
conditioning analysis to further algebraic methods. A fixed-dimension local
framework plus a univariate representation theorem does not answer its
growing-dimension worst cases.

## Gaussian zeros, Palm weighting, and kernel geometry

Bleher–Shiffman–Zelditch, *Universality and scaling of correlations between zeros on
complex manifolds*, Inventiones Mathematicae **142**(2) (2000), 351–395, DOI
`10.1007/s002220000092`. Their
[published author copy](https://math.jhu.edu/~shiffman/publications/44%20universality%202000.pdf),
Theorem 2.1, gives the general complex zero-correlation formula from the joint
value/derivative density. In the square, one-point case its derivative factor is
`|det J|²`. Section 2.2 treats Gaussian conditioning through the block covariance
and its Schur complement. These are appropriate precise references for the
system-level Kac–Rice calculation in A.

Hough–Krishnapur–Peres–Virág, *Zeros of Gaussian Analytic Functions and Determinantal
Point Processes*, University Lecture Series **51**, AMS, 2009.
[Author PDF](https://math.iisc.ac.in/~manju/GAF_book.pdf), Section 2.4,
equation (2.4.8), gives the scalar intensity `(4π)^−1 Delta log K(z,z)`.
Chapter 3, especially Theorem 3.1.1 and Lemma 3.1.2, treats complex Kac–Rice and
the complex change-of-variables determinant square. A mark is inserted in the
same coarea argument; the draft can show that short derivation and use monotone
approximation for nonnegative marks. These sources do not license silently
replacing the root-selected law by ordinary Gaussian conditioning on `P(z)=0`.

For historical context on radial scaling, Bleher–Ridzal's
[*SU(1,1) Random Polynomials*](https://arxiv.org/abs/math-ph/0103037) studies
an `n^−1` radial boundary layer and explicit limiting radial density. This is
optional context for B, rather than evidence of novelty for elementary finite-
degree consequences of the Kac kernel.

## Established random-matrix ingredients for A

Fischmann–Bruzda–Khoruzhenko–Sommers–Życzkowski, *Induced Ginibre ensemble of random
matrices and quantum operations*, J. Phys. A: Math. Theor. **45**(7) (2012),
075203, DOI `10.1088/1751-8113/45/7/075203`.
[Preprint](https://arxiv.org/abs/1107.5019), equations (3)–(4), defines the density
proportional to `det(G*G)^L exp(−Tr G*G)` in the complex case. A's normalized
root Jacobian has `L=1`; its squared singular values match those of a rectangular
`(d+1)×d` standard complex Gaussian matrix. The ensemble is established, and is
not the distribution of the companion matrix.

Kumar–Sambasivam–Anand, *Smallest eigenvalue density for regular or fixed-trace
complex Wishart-Laguerre ensemble and entanglement in coupled kicked tops*,
J. Phys. A: Math. Theor. **50**(34) (2017), 345201, DOI
`10.1088/1751-8121/aa7d0e`.
[Preprint Section 2.2](https://arxiv.org/html/1701.07402v2), equation (15), gives

\[
f_{\lambda_{\min}}(x)=e^{-dx}xL_{d-1}^{(2)}(-x),\qquad x>0,
\]

for rectangularity one. Their equation (17) gives its moments for exponents
greater than `−2`. Therefore the inverse singular-norm fourth-power tail and the
moment threshold `<4` are immediate conditioning consequences of an established
density. They explicitly trace the density to Forrester–Hughes (1994); do not
advertise its distribution as new.

Bourgade–Dubach, *The distribution of overlaps between eigenvectors of Ginibre
matrices*, PTRF **177** (2020), 397–464,
[preprint](https://arxiv.org/abs/1801.01219), is useful overlap context. Its matrix
ensemble is Ginibre, with a different size dependence and eigenvector structure
from a Kac companion. Neither its inverse-Gamma limit nor formulas for Ginibre
overlaps may be imported into C without a separate proof.

## Suggested related-work paragraph

Polynomial root sensitivity and the sensitivity of its companion eigenproblem
have long been compared through pseudozeros, pseudospectra, and structured
perturbations, beginning with Toh–Trefethen and developed further for Fiedler
companions by De Terán–Dopico–Pérez. Armentano–Beltrán established exact average
conditioning formulas for Gaussian polynomial eigenproblems; for scalar
polynomials, the mean squared coefficient condition with standard Fubini–Study
output is one. Our local calculation uses established complex Kac–Rice and
induced Ginibre/Wishart laws to separate the coefficient evaluation geometry
from the Jacobian. The additional question studied here is the unstructured
eigenvalue sensitivity of the companion representation induced by Gaussian
coefficients. The representation is fixed throughout, and the conclusions
concern a uniformly selected root rather than the worst root of each sample.

## Search record and boundaries

Queries combined “random polynomials”, “Kac polynomials”, “Gaussian polynomials”,
“companion matrices”, “eigenvector overlaps”, “condition number”, “moments”,
“expected”, and “average”, followed by author/PDF checks of relevant hits.
No direct precedent for the proposed uniform fractional moments or logarithmic
second moment was located. No claim of an exhaustive citation search follows.
The theoretical reference list should be kept focused; most algorithmic papers
that merely use random coefficients in experiments do not need separate citations.
