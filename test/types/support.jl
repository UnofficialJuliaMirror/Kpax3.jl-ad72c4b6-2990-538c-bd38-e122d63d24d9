# This file is part of Kpax3. License is MIT.

function test_support_mcmc_constructor()
  ifile = "data/proper_aa.fasta"
  ofile = "../build/test.bin"
  maxclust = 1

  settings = KSettings(ifile, ofile, maxclust=maxclust)

  x = AminoAcidData(settings)

  (m, n) = size(x.data)

  priorR = EwensPitman(settings.α, settings.θ)
  priorC = AminoAcidPriorCol(x.data, settings.γ, settings.r)

  state = AminoAcidState(x.data, [1; 1; 1; 2; 2; 3], priorR, priorC, settings)

  g = 0
  lp = zeros(Float64, 4, 3, m)
  for b in 1:m, l in 1:state.k
    g = state.cl[l]

    lp[1, g, b] = logmarglik(state.n1s[g, b], state.v[g], priorC.A[1, b],
                             priorC.B[1, b])
    lp[2, g, b] = logmarglik(state.n1s[g, b], state.v[g], priorC.A[2, b],
                             priorC.B[2, b])
    lp[3, g, b] = logmarglik(state.n1s[g, b], state.v[g], priorC.A[3, b],
                             priorC.B[3, b])
    lp[4, g, b] = logmarglik(state.n1s[g, b], state.v[g], priorC.A[4, b],
                             priorC.B[4, b])
  end

  support = MCMCSupport(state, priorC)

  @test support.m == m
  @test support.n == n

  @test support.u == Int[a for a in 1:n]
  @test support.lp == lp
  @test support.vi == 0
  @test support.ni == zeros(Float64, m)
  @test support.ui == zeros(Int, n)
  @test isa(support.wi, KWeight)
  @test support.wi.c == zeros(Float64, m)
  @test support.wi.w == zeros(Float64, 4, m)
  @test support.wi.z == zeros(Float64, 4, m)
  @test support.lpi == zeros(Float64, 4, m)

  @test support.vj == 0
  @test support.nj == zeros(Float64, m)
  @test support.uj == zeros(Int, n)
  @test isa(support.wj, KWeight)
  @test support.wj.c == zeros(Float64, m)
  @test support.wj.w == zeros(Float64, 4, m)
  @test support.wj.z == zeros(Float64, 4, m)
  @test support.lpj == zeros(Float64, 4, m)

  @test support.tmp == zeros(Float64, 4)

  @test support.cl == zeros(Int, n)
  @test support.k == 0

  @test support.lograR == 0.0

  logmlik = 0.0
  tmp = zeros(Float64, 3)
  for b in 1:m
    tmp[1] = priorC.logγ[1]
    tmp[2] = priorC.logγ[2]
    tmp[3] = priorC.logγ[3]

    for l in 1:state.k
      g = state.cl[l]

      tmp[1] += lp[1, g, b]
      tmp[2] += lp[2, g, b]
      tmp[3] += log(exp(priorC.logω[state.k][1] + lp[3, g, b]) +
                    exp(priorC.logω[state.k][2] + lp[4, g, b]))
    end

    logmlik += log(exp(tmp[1]) + exp(tmp[2]) + exp(tmp[3]))
  end

  @test_approx_eq_eps support.logmlik logmlik ε

  @test support.logmlikcandidate == 0.0

  nothing
end

test_support_mcmc_constructor()

function test_support_mcmc_resize()
  ifile = "data/proper_aa.fasta"
  ofile = "../build/test.bin"
  maxclust = 1

  settings = KSettings(ifile, ofile, maxclust=maxclust)

  x = AminoAcidData(settings)

  (m, n) = size(x.data)

  priorR = EwensPitman(settings.α, settings.θ)
  priorC = AminoAcidPriorCol(x.data, settings.γ, settings.r)

  state = AminoAcidState(x.data, [1; 1; 1; 2; 2; 3], priorR, priorC, settings)

  g = 0
  lp = zeros(Float64, 4, 3, m)
  for b in 1:m, l in 1:state.k
    g = state.cl[l]

    lp[1, g, b] = logmarglik(state.n1s[g, b], state.v[g], priorC.A[1, b],
                             priorC.B[1, b])
    lp[2, g, b] = logmarglik(state.n1s[g, b], state.v[g], priorC.A[2, b],
                             priorC.B[2, b])
    lp[3, g, b] = logmarglik(state.n1s[g, b], state.v[g], priorC.A[3, b],
                             priorC.B[3, b])
    lp[4, g, b] = logmarglik(state.n1s[g, b], state.v[g], priorC.A[4, b],
                             priorC.B[4, b])
  end

  support = MCMCSupport(state, priorC)

  # do nothing
  resizesupport!(support, 3)

  @test support.lp == lp

  resizesupport!(support, 6)

  g = 0
  lp = zeros(Float64, 4, 6, m)
  for b in 1:m, l in 1:state.k
    g = state.cl[l]

    lp[1, g, b] = logmarglik(state.n1s[g, b], state.v[g], priorC.A[1, b],
                             priorC.B[1, b])
    lp[2, g, b] = logmarglik(state.n1s[g, b], state.v[g], priorC.A[2, b],
                             priorC.B[2, b])
    lp[3, g, b] = logmarglik(state.n1s[g, b], state.v[g], priorC.A[3, b],
                             priorC.B[3, b])
    lp[4, g, b] = logmarglik(state.n1s[g, b], state.v[g], priorC.A[4, b],
                             priorC.B[4, b])
  end

  @test support.lp == lp

  nothing
end

test_support_mcmc_resize()

function test_support_ga_constructor()
  m = 18
  n = 6

  support = GASupport(m, n)

  @test support.m == m
  @test support.n == n

  @test isa(support.oi, KOffspring)
  @test support.oi.R == zeros(Int, n)
  @test support.oi.v == zeros(Int, n)

  @test isa(support.oj, KOffspring)
  @test support.oj.R == zeros(Int, n)
  @test support.oj.v == zeros(Int, n)

  nothing
end

test_support_ga_constructor()
