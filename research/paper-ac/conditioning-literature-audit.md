# Conditioning literature audit

14 September 2026. Scope: the active manuscript `gaussian-conditioning.tex`,
especially Proposition 2.2 and the multivariate local law. This is a targeted
attribution audit, not an exhaustive bibliographic or priority search.

## Assessment

The previous draft substantially under-acknowledged polynomial-system
conditioning. Its local derivative formula is standard. The homogeneous
counterparts of its moments are known, and fourth-power tails have classical
sparse-system precedents. The presentation must distinguish the convenience
of a common-kernel formulation from a claim to discover local conditioning.

## Sources and their roles

| Source | Relevance and manuscript action |
| --- | --- |
| Shub–Smale, *Complexity of Bézout's theorem* I–III (1993); [author publication list](https://sites.google.com/site/shubmichael/publications), [Part I](https://doi.org/10.1090/S0894-0347-1993-1175980-4) | Foundational projective conditioning, geometry of ill-posedness, and probabilistic estimates. Added to the introduction and projective normalization comparison. Part II is a book chapter, not a journal article. |
| Bürgisser–Cucker, [*Condition: The Geometry of Numerical Algorithms*](https://link.springer.com/book/10.1007/978-3-642-38896-5) (2013) | Chapter 14 provides the general geometric framework; Chapters 16–18 treat polynomial systems. Added immediately before Proposition 2.2. |
| Beltrán–Pardo, [*Smale's 17th problem*](https://personales.unican.es/beltranc/archivos/AffSmale17JAMS.pdf) (2009) | Average polynomial-time randomized system solving. Added as the algorithmic context for average conditioning. |
| Beltrán–Pardo, [*Fast linear homotopy*](https://personales.unican.es/beltranc/archivos/FastLinearHomotopy.pdf) (2011) | Sections 5–6 integrate over the solution variety. Sections 7–8 compute exact operator moments below order four; Theorem 23 in the linked author manuscript treats nonlinear systems. Added to the introduction and local-law discussion. |
| Bürgisser–Cucker, [*On a problem posed by Steve Smale*](https://annals.math.princeton.edu/2011/174-3/p08) (2011) | Smoothed analysis of homogeneous polynomial solving. Added so the discussion does not suggest that smoothed local theory is unexplored. |
| Armentano–Beltrán–Bürgisser–Cucker–Shub, [*Condition length and complexity for the solution of polynomial systems*](https://shub.ccny.cuny.edu/articles/2016-Condition_length_and_complexity_for_the_solution_of_polynomial_systems.pdf) (2016) | Theorem 2 gives the directly corresponding Frobenius mean and its noncentered bound; Remark 5 explains the coarea determinant weight. Explicitly cross-referenced in Section 3. |
| Malajovich–Rojas, [*High probability analysis of the condition number of sparse polynomial systems*](https://people.tamu.edu/~rojas/poly.pdf) (2004) | Theorem 1 includes a fourth-power worst-root tail; Theorem 4 gives the geometric condition-number comparison; Theorem 2 treats root density. Their multiprojective normalization needs care. Added near the kernel metric and local tail. |
| Malajovich, [*Homotopy on toric varieties and the condition metric*](https://doi.org/10.1007/s10208-018-9375-2) (2019), [*Renormalization*](https://doi.org/10.1093/imanum/drac039) (2023) | Later sparse-system condition metrics and continuation complexity. Added as context, without claiming a theorem-by-theorem comparison of these longer works. |
| Lairez, [*A deterministic algorithm to compute approximate roots of polynomial systems in polynomial average time*](https://arxiv.org/abs/1507.05485) (2017) | Acknowledges the subsequent deterministic average-complexity result. |
| Bürgisser–Cucker–Rocha Cardozo, [*On the condition of characteristic polynomials*](https://arxiv.org/abs/1510.04419) (2015) | This is `papers/elisa.pdf`. Added to the introduction as prior work on conditioning under an induced coefficient law. See the separate [comparison note](elisa-comparison.md). |

The existing Armentano–Beltrán (2019), Toh–Trefethen, Noferini–Townsend,
Graf–Townsend, Kac–Rice, and random-matrix references remain relevant.

## Normalizations: the bridge used in the paper

The following is our conversion of the classical formulas into the draft's
notation. It is essential to the comparison, rather than a new theorem.
For common homogeneous degree \(n\), use the Bombieri–Weyl orthonormal
monomials \(\sqrt{n!/\alpha!}X^\alpha\). Dehomogenization gives

\[
S(z)=(1+\|z\|^2)^n,\qquad H=nG_{\rm FS},\qquad
A=S^{-1/2}JH^{-1/2}.
\]

Hence the degree-normalized projective operator and Frobenius conditions are

\[
\mu=\|c\|_F\|A^{-1}\|_2=\|c\|_F\kappa_H,
\qquad \mu_F=\|c\|_F\|A^{-1}\|_F.
\]

At the root \([1:0:\cdots:0]\), this follows from the normalized tangent
Jacobian \(J/\sqrt n\); unitary invariance gives the general case. The
absolute coefficient derivative into standard Fubini–Study distance is
\(\kappa_H/\sqrt n\). Affine relative conditioning introduces the different
factor \(\|c\|_F/\|z\|_2\).

This comparison applies to the common-degree invariant model. The general
homogeneous literature also handles unequal degrees, whereas our exact
independence law assumes one common kernel. Neither hypothesis set contains
the other in its entirety.

Input-sphere and Gaussian averages also require conversion. If the complex
coefficient dimension is \(M\), the Gaussian radius satisfies
\(\mathbb E\|c\|_F^{-2}=1/(M-1)\). Uniform root selection leaves this radius
independent of the coefficient direction. Consequently

\[
\mathbb E_*\kappa_H^2
=\frac{\mathbb E_{\text{sphere},*}\mu^2}{M-1}.
\]

More generally the radial factor for order \(q\), when \(q<2M\), is
\(\Gamma(M-q/2)/\Gamma(M)\). This is why raw spherical and Gaussian
moment formulas cannot be compared without their input scaling. The paper
states the needed convention bridge without adding another moment theorem.

## Consequences for positioning

- Present Proposition 2.2 and the local probability machinery as background
  with short self-contained proofs tailored to the chosen metrics.
- Do not use the local fourth-power exponent, the homogeneous moment range,
  or the inverse Frobenius second moment as standalone novelty claims.
- Any claim about the general common-kernel formulation needs a separate
  priority comparison. The audit establishes close precedents, not its novelty.
- The main research question remains quantitative conditioning of specified
  multivariate algebraic representations under induced distributions. The
  draft's proved representation theorem is still univariate.
- Further contextual sources include Dedieu's general and sparse-system
  condition theory and Malajovich's 2025 [*Infinity* preprint](https://arxiv.org/abs/2506.17086).
  These were identified but not fully compared here; they are not used to
  support a novelty claim or a new mathematical assertion in the manuscript.

Edits preserve the reader's current Section 2 definitions and the preceding
clarification about the base locus \(S=0\). No existing proof or main theorem
has been altered; the changes concern attribution, normalization comparisons,
and the scope of the discussion.

## Validation

The revised manuscript compiles to 24 pages with all citations and references
resolved, no LaTeX box warnings, and no BibTeX warnings. Rendered pages covering
the revised introduction, Proposition 2.2, the normalization comparisons,
local-law attribution, discussion, and complete bibliography were inspected.
The preceding Section 2 edits were preserved.
