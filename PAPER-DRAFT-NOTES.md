# A–C paper draft

12 September 2026.

**Scope correction after author feedback:** the current main theorem is
univariate. The draft proves local results for systems, but does not yet prove
an average-conditioning bound for a multivariate algebraic representation.
The systems objective requires that additional result; A–C alone should not be
treated as completing it. See
[`research/paper-ac/systems-scope-correction.md`](research/paper-ac/systems-scope-correction.md).

## Files and organization

The new manuscript entry point is `gaussian-conditioning.tex`, compiling to
`gaussian-conditioning.pdf`. Its bibliography is `gaussian-conditioning.bib`.
The section sources are in `paper-sections/`. Earlier manuscripts remain available
under their existing names.

The draft now leads with the main theorem before developing the framework:

1. **Introduction.** State the Gaussian companion-conditioning theorem on page 2,
   including the sharp uniform tail, second-moment asymptotic, and relative
   condition-number comparison. Explain its meaning, outline the proof through
   the local Gaussian law and box geometry, and place the results in the literature.
2. **The input–output problems.** Define the coefficient Hilbert space, local root
   branch through the regular incidence set, input Frobenius norm, Euclidean and
   kernel output metrics, scalar-output condition numbers, matrix perturbation
   norm, relative normalizations, and selected-root law. State the composition
   identity separating coefficient-induced errors from arbitrary matrix errors.
3. **The normalized Jacobian at a selected root.** Prove marked Kac–Rice and the
   independence law, then derive the sharp fourth-power tail using the classical
   Wishart smallest-eigenvalue density. Give an elementary cofactor proof of the
   inverse Frobenius moment and a projective normalization check.
4. **The box ensemble.** Derive exact root radii, inversion symmetry, depth tails,
   and uniform metric estimates. Compare multiplication eigenvalue conditioning
   to conditioning of the same scalar coordinate output. Explain the change of
   leading order if residual conditioning replaces coefficient conditioning.
5. **Companion eigenvalues.** Prove the exact tridiagonal Gram-matrix identity,
   uniform overlap tail and moment bounds, second-moment asymptotic, fixed-degree
   integrability threshold, and relative conditioning comparison.
6. **Interpretation and further questions.** Include a reproducible finite-degree
   table and distinguish the established statements from full-algorithm stability,
   worst-root bounds, multivariate interpolation, and smoothing.

## Proof progress beyond the initial scope note

The proposed estimates in A–C have now been written as full proofs, with the
standard Kac–Rice, Gaussian, and Wishart ingredients cited explicitly. Independent
reviews found no remaining substantive proof gap. This is an internally reviewed
research draft, not a formal verification or a substitute for author review.

The companion argument produced stronger statements than originally proposed.
For a complex Gaussian polynomial of degree \(n\), with its monomial companion basis,
and a root selected uniformly after sampling the polynomial:

\[
\mathbb P_*(\Lambda>t)\le\min\{1,Ct^{-2}\},
\qquad
\mathbb E_*\Lambda^2=2\log n+O(1).
\]

Consequently, moments are uniformly bounded in degree precisely for orders
\(0<q<2\). For each fixed degree \(n\ge2\), they are finite precisely for
\(0<q<4\). At degree one the overlap is identically one. The uniform tail follows
from a conditional third-moment estimate and the root-depth law; the exact
second-moment integral establishes sharpness of its exponent uniformly in degree.

The exact finite-degree identity for the absolute logarithmic comparison is

\[
\mathbb E_*\log\frac{\kappa_{\mathrm{eig}}}{\kappa_{\mathrm{coeff}}}
=\mathbb E_*\log\Lambda
 +\frac12\mathbb E_*\log h_n(|Z|^2)+\frac{1-\gamma}{2}.
\]

After explicitly controlling the companion and coefficient data norms, the
relative comparison also equals \(\log n+O(1)\).

## Literature and novelty

The 14 September conditioning-literature audit corrected substantial omissions.
The introduction and local theory now cite the Shub–Smale foundations,
Beltrán–Pardo's exact projective moments and average homotopy analysis,
Bürgisser–Cucker's geometric and smoothed theory, the
Armentano–Beltrán–Bürgisser–Cucker–Shub mean-condition theorem, and
Malajovich–Rojas's sparse-system metrics and tails. Later toric homotopy work,
Lairez's deterministic average complexity, and the characteristic-polynomial
paper by Bürgisser–Cucker–Rocha Cardozo are also acknowledged.

Proposition 2.2 is explicitly presented as a standard derivative calculation.
The paper explains the conversion to classical projective normalization and
identifies the homogeneous inverse Frobenius second moment as already known.
The local fourth-power exponent and homogeneous moment range are not novelty
claims. See the source-by-claim audit in
[`research/paper-ac/conditioning-literature-audit.md`](research/paper-ac/conditioning-literature-audit.md).
The existing discussion of Armentano–Beltrán's scalar identity, the standard
random-matrix distributions, and deterministic representation conditioning
is retained.

The targeted primary-source search did not locate the specific companion moment
profile proved here. This is not an exhaustive priority claim. The manuscript
therefore makes no assertion that an underlying random-matrix law is new and no
unsupported claim of precedence for the companion theorem. A broader novelty
check remains worthwhile before submission.

## Checks and reproducibility

- Three agents independently handled the local law, companion proof, and literature,
  followed by cross-reviews of the complete arguments and integrated framing.
- Exact companion identities were checked symbolically for degrees 1–12, including
  direct matrix checks for degrees 1–5, reversal, the conditional derivative
  variance, and the degree-two integral.
- The local Wishart density normalization and tail coefficient inequality were
  checked in dimensions 1–20. A covariance example with non-real off-diagonal
  entries checked the order of complex derivatives in the kernel metric.
- The table uses deterministic quadrature, with positive-coefficient Horner
  evaluation and independent runs at 30 and 50 decimal digits. Their differences
  were below \(10^{-25}\). This is a numerical consistency check, not a certified
  quadrature error bound. Degrees one and two also agree with exact formulas.
- The final LaTeX build is warning-free, with resolved citations and references.
  Rendered pages were checked for equations, page breaks, table placement, and
  bibliography layout.

Build and reproduce:

```sh
latexmk -pdf -interaction=nonstopmode -halt-on-error gaussian-conditioning.tex
uv run --with sympy python research/paper-ac/check_companion.py
uv run --with mpmath python research/paper-ac/second_moment_table.py
```

Detailed proof reviews, source checks, scripts, and numerical records are retained
in `research/paper-ac/`. The first author-review priorities are the framing in
Sections 1–2, the uniform-versus-fixed-degree distinction in Section 5, and the
interpretation of the relative comparison.

## Clarification of the opening definitions

Following the reader's comment about \(G(z)\), Section 2 now defines the output
metric as a prescribed smooth map \(G:U\to\operatorname{Herm}^{++}_d\), the
associated inner product on root displacements, and the condition number as the
operator norm of the local root derivative. It explicitly explains why only
\(G(z)\), not derivatives of \(G\), enters at the base root. The two choices
\(G=I_d\) and \(G=H\) are introduced before their use in the proposition.

The same pass defines the Jacobian, simple roots, evaluation map, matrix norms,
positive square root, local eigenvalue branch, quotient algebra, and separating
output where they first appear. The projective interpretation of \(H\) is
explained after its explicit definition. The reference Gaussian matrix is now
\(G_0\), so it cannot be confused with the output metric \(G\). The build remains
warning-free; these changes clarify definitions and notation without changing
the mathematical results.

## Introduction restructuring

The reader requested an early theorem to make the paper's destination apparent.
The new `paper-sections/introduction.tex` gives just enough notation to state
Theorem 1.1 before the general input–output framework: the Gaussian polynomial,
the monomial companion matrix, the selected-root law, and the eigenvector overlap.
The relative condition numbers are described before the theorem and given by
explicit formulas immediately afterwards. Theorem 5.1 and Corollary 5.7 provide
the proofs of its two parts.

The abstract now leads with the companion results. The former results-and-literature
subsection at the end of the setup has been incorporated into the introduction,
with the local Gaussian law and box estimates presented as the route to the main
theorem. The detailed metric definitions and the mathematical proofs are preserved.
The new statement was checked against the corresponding body statements; the
LaTeX build has resolved references and citations and no final-pass warnings.

## Matrix-polynomial literature clarification (14 September 2026)

The opening and related-work discussion now distinguish Armentano–Beltrán's
Gaussian matrix-coefficient input from the induced companion-matrix input.
Remark 1.4 is acknowledged as discussing both scalar rootfinding and the
matrix-polynomial eigenvalue problem; the scalar Fubini–Study identity is
identified as a specialization. Writing the companion problem as a pencil does
not supply the independent Gaussian coefficient matrices required by their
average theorem.

The two Barbarino–Noferini papers are now cited for empirical spectral limits
and for the noncentral Gaussian smallest-singular-value bound. The discussion
explains why a fixed-parameter resolvent estimate does not by itself bound the
residue at a selected eigenvalue. Their matrix polynomials remain univariate,
and elimination-induced dependencies still need analysis for our multivariate
goal. The theorem statements and proofs are unchanged.

Detailed source comparisons, exact hypotheses, and an elementary finite-size
Gaussian expected-eigenvalue-measure calculation are recorded in
[`barbarino-noferini-relevance.md`](research/paper-ac/barbarino-noferini-relevance.md).

The revised 25-page PDF builds without warnings or unresolved references.
The introduction, affected section transitions, discussion, table, and
bibliography were checked in rendered pages; the main theorem remains on page 2.
