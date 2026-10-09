# Systems scope and novelty correction

12 September 2026, following the author's objection to the univariate emphasis
of the revised introduction.

## Assessment

The project's intended question concerns the extra conditioning introduced by
algebraic methods for **systems** of polynomial equations. Theorem 1.1 of
`gaussian-conditioning.tex` instead concerns one polynomial with independent
Gaussian coefficients and its ordinary monomial companion matrix. It is a
univariate theorem. The draft's general local framework does not turn it into
a multivariate representation theorem.

The scope drift began in `FIRST-PAPER-SCOPE.md`, which recommended A–C as a paper
with C as its main representation result. The latest introduction made that
choice more visible. That recommendation prioritized a completed special case
over the original systems question. For the author's intended paper, a result
about a specified multivariate algebraic representation remains a completion
criterion. This revises the earlier recommendation; it does not change the
status of the existing proofs.

## What the present draft establishes

**Clarification:** the multivariate local condition number is already controlled
by Theorems 3.3–3.4. In the box model, the existing estimates also imply
`E_* log kappa_coeff,rel = (d/2 - 1) log n + O_d(1)` with Euclidean input and
output norms. A complete short proof is recorded in
[`local-relative-corollary.md`](local-relative-corollary.md). The open systems
problem below concerns the algebraic representation, not local conditioning.

| Component | Scope | Status and limitation |
| --- | --- | --- |
| A: normalized Jacobian law and intrinsic conditioning tail | Systems of d independent complex Gaussian polynomials with a common kernel, under the stated nondegeneracy and root-count assumptions | Proved in the draft using established Gaussian, Kac–Rice, and Wishart ingredients. Does not control a resultant or multiplication representation. |
| B: exact box root laws and coefficient-conditioning scale | d equations of degree at most n in each variable; d fixed as n grows | Proved in the draft. Separates a known local scale from a representation-dependent overlap that remains uncontrolled in several variables. |
| C: companion overlap moments and relative comparison | One polynomial, ordinary unbalanced monomial companion | Proved in the draft. Exact novelty remains unconfirmed. It is a worked special case for the systems program. |
| E: bounded bivariate multiplication overlap | Two Gaussian bidegree-(n,n) equations in a specified quotient basis | Open. Generic basis validity and the uniform overlap estimate must be established. |
| Relative or smoothed conditioning of a multivariate algebraic method | A specified matrix, pencil, or eliminant construction | Not established by A–C. Representation data norms and any smoothing law require additional analysis. |

## Literature check

The author's follow-up identified another essential precedent:
`papers/elisa.pdf`, Bürgisser–Cucker–Rocha Cardozo on characteristic polynomial
conditioning. See [`elisa-comparison.md`](elisa-comparison.md). It directly
studies poor average conditioning after an algebraic transformation and motivates
an eliminant/RUR route for systems alongside the bivariate overlap target.

Broad assertions that Gaussian polynomial roots are well conditioned on average
are not new. In [Armentano–Beltrán, Section 3.1, equation (7)](https://arxiv.org/pdf/1706.06025),
the same scalar Gaussian coefficient ensemble has exactly

\[
\mathbb E_*\mu_{\mathrm{FS}}^2=1,\qquad
\mu_{\mathrm{FS}}(p,z)=
\frac{\|a\|_2\sqrt{\sum_{k=0}^{n}|z|^{2k}}}
{(1+|z|^2)|p'(z)|}.
\]

This uses coefficient perturbations with relative input scaling and the
standard Fubini–Study output metric. It is a different quantity from the
absolute eigenvalue condition number of the induced companion matrix under
arbitrary matrix perturbations.

There is also substantial directly relevant **systems** literature.
[Malajovich–Rojas, *High Probability Analysis of the Condition Number of Sparse
Polynomial Systems*](https://arxiv.org/pdf/math/0212179), Theorem 1, gives a
fourth-power probability bound in the unmixed sparse setting. Their framework
uses Kähler geometry, coefficient norms, and a root metric derived from the
support. Its normalization and its event involving some root differ from our
selected-root absolute condition. Nevertheless it is essential prior work:
neither geometric normalization nor a fourth-power local conditioning tail
should be presented as a new principle. An exact comparison of normalizations
and constants remains appropriate before a novelty claim for A or B.

Deterministic root-versus-companion comparisons are likewise established; see
[De Terán–Dopico–Pérez](https://gauss.uc3m.es/fteran/papers/calcolo2016.pdf), which
also includes random-polynomial numerical experiments. The previous literature
note lists Toh–Trefethen and other relevant sources.

The targeted searches and primary-source checks have not identified the exact
degree-uniform companion tail together with
\(\mathbb E_*\Lambda^2=2\log n+O(1)\) for our particular ensemble and norm.
This is **unconfirmed novelty**, not evidence sufficient to declare a new
theorem in the literature. Conversely, the known average coefficient-condition
identity above does not by itself establish that companion result.

## The unresolved systems quantity

The useful systems reduction already in Section 4 is

\[
\mathbb E_*\log
\frac{\kappa_{\mathrm{eig}}(M_{x_1},Z_1)}
     {\kappa_{\mathrm{coeff}}^{x_1}(P,Z)}
=\log n+\Theta_{n,d}^{\mathcal B}+O_d(1),\qquad
\Theta_{n,d}^{\mathcal B}=\mathbb E_*\log\Lambda_{\mathcal B}(P,Z).
\]

Here the coefficient condition concerns the scalar coordinate output x_1,
and the matrix condition concerns the same output as an eigenvalue of ordinary
multiplication by x_1. Both conditions are absolute; the coefficient norm is
Euclidean and the matrix perturbation norm is spectral. The basis is fixed and
must be valid on a generic coefficient chart, with x_1 separating roots almost
surely. The identity is interpreted in the extended sense if the nonnegative
overlap logarithm has infinite expectation.

Thus A and B determine the local contribution, but do not estimate the term
encoding the algebraic representation. For d=1, C supplies the missing bound.
For d>=2, that is still a substantive research problem. Moreover, the iid
Gaussian coefficient law of C cannot be assumed for the eliminant or
characteristic polynomial obtained from a random multivariate system; that
induced coefficient distribution must be analyzed separately.

## Recommended direction

Restore the systems problem as the organizing question. An early theorem can
state the proved multivariate local law and the above reduction, with its
uncontrolled term explicit. This is a useful structural result, but should not
be advertised as resolving the average conditioning of algebraic system solvers.
Use the companion calculation as an illustration of how the reduction can be
completed in one variable.

The concrete next target remains E from the assessment: for two independent
Gaussian bidegree-(n,n) equations, establish the generic quotient basis

\[
\mathcal B_n=\{x_1^i x_2^j:0\le i<n,\ 0\le j<2n\}
\]

and determine whether

\[
\sup_{n\ge1}\mathbb E_*\log\Lambda_{\mathcal B_n}<\infty.
\]

This is a **target, not a theorem**. A proved degree-dependent estimate would
also be progress; the boundedness conjecture must be tested by proof, not
assumed in the introduction. With boundedness established, the displayed
absolute comparison would become log n + O(1) for that bivariate representation.
The relative version additionally requires its matrix data norm. A fully
normalized bivariate Sylvester/Cayley comparison is an alternative target.

For a systems paper, the completion criterion should therefore be A+B plus
one multivariate representation result, retaining C as supporting material.
The current manuscript is a useful foundation but does not yet meet that
criterion.
