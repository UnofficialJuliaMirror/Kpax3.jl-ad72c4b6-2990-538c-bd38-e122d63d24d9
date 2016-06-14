# This file is part of Kpax3. License is MIT.

# A1 = [1 0 0 0 0 0;
#       1 0 0 0 0 0;
#       0 0 1 0 0 0;
#       0 0 1 0 0 0;
#       0 0 1 0 0 0;
#       0 0 0 0 0 1]
#
# A2 = [1 0 0 0 0 0;
#       0 1 0 0 0 0;
#       0 0 1 0 0 0;
#       0 0 0 1 0 0;
#       0 0 0 0 1 0;
#       0 0 0 0 1 0]
#
# Each cutpoint greater than 1 has probability 1 / 5 of being selected
#
# COLUMN 2
# If cutpoint == 7, crossover breaks the second child:
#
# B1 = [1 0 0 0 0 0;
#       0 1 0 0 0 0;
#       0 0 1 0 0 0;
#       0 0 0 1 0 0;
#       0 0 0 0 1 0;
#       0 0 0 0 1 0]
#
# B2 = [1 0 0 0 0 0;
#       0 0 0 0 0 0;
#       0 0 1 0 0 0;
#       0 0 1 0 0 0;
#       0 0 1 0 0 0;
#       0 0 0 0 0 1]
#
# Pr(B1 = [1; 2; 3; 4; 5; 5] | cutpoint = 7) = 1
#
# Pr(B2 = [1; 1; 3; 3; 3; 6] | cutpoint = 7) = 1 / 2
# Pr(B2 = [1; 2; 3; 3; 3; 6] | cutpoint = 7) = 1 / 2
#
# COLUMN 3
# If cutpoint == 14, crossover does not break anything
#
# B1 = [1 0 0 0 0 0;
#       1 0 0 0 0 0;
#       0 0 1 0 0 0;
#       0 0 0 1 0 0;
#       0 0 0 0 1 0;
#       0 0 0 0 1 0]
#
# B2 = [1 0 0 0 0 0;
#       0 1 0 0 0 0;
#       0 0 1 0 0 0;
#       0 0 1 0 0 0;
#       0 0 1 0 0 0;
#       0 0 0 0 0 1]
#
# Pr(B1 = [1; 1; 3; 4; 5; 5] | cutpoint = 14) = 1
#
# Pr(B2 = [1; 2; 3; 3; 3; 6] | cutpoint = 14) = 1
#
# COLUMN 4
# If cutpoint == 21, crossover breaks the second child:
#
# B1 = [1 0 0 0 0 0;
#       1 0 0 0 0 0;
#       0 0 1 0 0 0;
#       0 0 0 1 0 0;
#       0 0 0 0 1 0;
#       0 0 0 0 1 0]
#
# B2 = [1 0 0 0 0 0;
#       0 1 0 0 0 0;
#       0 0 1 0 0 0;
#       0 0 0 0 0 0;
#       0 0 0 0 0 0;
#       0 0 0 0 0 1]
#
# Pr(B1 = [1; 1; 3; 4; 5; 5] | cutpoint = 21) = 1
#
# Pr(B2 = [1; 2; 3; 1; 1; 6] | cutpoint = 21) = (1 / 4) * (2 / 5) = 1 / 10
# Pr(B2 = [1; 2; 3; 2; 1; 6] | cutpoint = 21) = (1 / 4) * (1 / 5) = 1 / 20
# Pr(B2 = [1; 2; 3; 3; 1; 6] | cutpoint = 21) = (1 / 4) * (1 / 5) = 1 / 20
# Pr(B2 = [1; 2; 3; 4; 1; 6] | cutpoint = 21) = (1 / 4) * (1 / 5) = 1 / 20
#
# Pr(B2 = [1; 2; 3; 1; 2; 6] | cutpoint = 21) = (1 / 4) * (1 / 5) = 1 / 20
# Pr(B2 = [1; 2; 3; 2; 2; 6] | cutpoint = 21) = (1 / 4) * (2 / 5) = 1 / 10
# Pr(B2 = [1; 2; 3; 3; 2; 6] | cutpoint = 21) = (1 / 4) * (1 / 5) = 1 / 20
# Pr(B2 = [1; 2; 3; 4; 2; 6] | cutpoint = 21) = (1 / 4) * (1 / 5) = 1 / 20
#
# Pr(B2 = [1; 2; 3; 1; 3; 6] | cutpoint = 21) = (1 / 4) * (1 / 5) = 1 / 20
# Pr(B2 = [1; 2; 3; 2; 3; 6] | cutpoint = 21) = (1 / 4) * (1 / 5) = 1 / 20
# Pr(B2 = [1; 2; 3; 3; 3; 6] | cutpoint = 21) = (1 / 4) * (2 / 5) = 1 / 10
# Pr(B2 = [1; 2; 3; 4; 3; 6] | cutpoint = 21) = (1 / 4) * (1 / 5) = 1 / 20
#
# Pr(B2 = [1; 2; 3; 4; 4; 6] | cutpoint = 21) = (1 / 4) * (1 / 5) = 1 / 20
#
# Pr(B2 = [1; 2; 3; 1; 5; 6] | cutpoint = 21) = (1 / 4) * (1 / 5) = 1 / 20
# Pr(B2 = [1; 2; 3; 2; 5; 6] | cutpoint = 21) = (1 / 4) * (1 / 5) = 1 / 20
# Pr(B2 = [1; 2; 3; 3; 5; 6] | cutpoint = 21) = (1 / 4) * (1 / 5) = 1 / 20
# Pr(B2 = [1; 2; 3; 4; 5; 6] | cutpoint = 21) = (1 / 4) * (1 / 5) = 1 / 20
#
# COLUMN 5
# If cutpoint == 28, crossover breaks the second child:
#
# B1 = [1 0 0 0 0 0;
#       1 0 0 0 0 0;
#       0 0 1 0 0 0;
#       0 0 1 0 0 0;
#       0 0 0 0 1 0;
#       0 0 0 0 1 0]
#
# B2 = [1 0 0 0 0 0;
#       0 1 0 0 0 0;
#       0 0 1 0 0 0;
#       0 0 0 1 0 0;
#       0 0 0 0 0 0;
#       0 0 0 0 0 1]
#
# Pr(B1 = [1; 1; 3; 3; 5; 5] | cutpoint = 28) = 1
#
# Pr(B2 = [1; 2; 3; 4; 1; 6] | cutpoint = 28) = 1 / 5
# Pr(B2 = [1; 2; 3; 4; 2; 6] | cutpoint = 28) = 1 / 5
# Pr(B2 = [1; 2; 3; 4; 3; 6] | cutpoint = 28) = 1 / 5
# Pr(B2 = [1; 2; 3; 4; 4; 6] | cutpoint = 28) = 1 / 5
# Pr(B2 = [1; 2; 3; 4; 5; 6] | cutpoint = 28) = 1 / 5
#
# COLUMN 6
# If cutpoint == 35, crossover breaks the first child:
#
# A1 = [1 0 0 0 0 0;
#       1 0 0 0 0 0;
#       0 0 1 0 0 0;
#       0 0 1 0 0 0;
#       0 0 1 0 0 0;
#       0 0 0 0 0 0]
#
# A2 = [1 0 0 0 0 0;
#       0 1 0 0 0 0;
#       0 0 1 0 0 0;
#       0 0 0 1 0 0;
#       0 0 0 0 1 0;
#       0 0 0 0 0 1]
#
# Pr(B1 = [1; 1; 3; 3; 3; 1] | cutpoint = 35) = 2 / 6
# Pr(B1 = [1; 1; 3; 3; 3; 3] | cutpoint = 35) = 3 / 6
# Pr(B1 = [1; 1; 3; 3; 3; 6] | cutpoint = 35) = 1 / 6
#
# Pr(B2 = [1; 2; 3; 4; 5; 6] | cutpoint = 35) = 1
#
# SUMMARY
# Unique partitions that are possible to be obtained from this crossover:
#
# Pr(B1 = [1; 2; 3; 4; 5; 5]) = Pr(B1 = R2) = 1 / 5
# Pr(B1 = [1; 1; 3; 4; 5; 5]) = 2 / 5
# Pr(B1 = [1; 1; 3; 3; 5; 5]) = 1 / 5
# Pr(B1 = [1; 1; 3; 3; 3; 1]) = (1 / 5) * (2 / 6) = 1 / 15
# Pr(B1 = [1; 1; 3; 3; 3; 3]) = (1 / 5) * (3 / 6) = 1 / 10
# Pr(B1 = [1; 1; 3; 3; 3; 6]) = (1 / 5) * (1 / 6) = 1 / 30
#
# Pr(B2 = [1; 1; 3; 3; 3; 6]) = (1 / 5) * (1 / 2) = 1 / 10
# Pr(B2 = [1; 2; 3; 3; 3; 6]) = (1 / 5) * (1 / 2) +
#                               (1 / 5) * 1 +
#                               (1 / 5) * (1 / 10) = 8 / 25
# Pr(B2 = [1; 2; 3; 1; 1; 6]) = (1 / 5) * (1 / 10) = 1 / 50
# Pr(B2 = [1; 2; 3; 2; 1; 6]) = (1 / 5) * (1 / 20) = 1 / 100
# Pr(B2 = [1; 2; 3; 3; 1; 6]) = (1 / 5) * (1 / 20) = 1 / 100
# Pr(B2 = [1; 2; 3; 4; 1; 6]) = (1 / 5) * (1 / 20) +
#                               (1 / 5) * (1 / 5) = 1 / 20
# Pr(B2 = [1; 2; 3; 1; 2; 6]) = (1 / 5) * (1 / 20) = 1 / 100
# Pr(B2 = [1; 2; 3; 2; 2; 6]) = (1 / 5) * (1 / 10) = 1 / 50
# Pr(B2 = [1; 2; 3; 3; 2; 6]) = (1 / 5) * (1 / 20) = 1 / 100
# Pr(B2 = [1; 2; 3; 4; 2; 6]) = (1 / 5) * (1 / 20) +
#                               (1 / 5) * (1 / 5) = 1 / 20
# Pr(B2 = [1; 2; 3; 1; 3; 6]) = (1 / 5) * (1 / 20) = 1 / 100
# Pr(B2 = [1; 2; 3; 2; 3; 6]) = (1 / 5) * (1 / 20) = 1 / 100
# Pr(B2 = [1; 2; 3; 4; 3; 6]) = (1 / 5) * (1 / 20) +
#                               (1 / 5) * (1 / 5) = 1 / 20
# Pr(B2 = [1; 2; 3; 4; 4; 6]) = (1 / 5) * (1 / 20) +
#                               (1 / 5) * (1 / 5) = 1 / 20
# Pr(B2 = [1; 2; 3; 1; 5; 6]) = (1 / 5) * (1 / 20) = 1 / 100
# Pr(B2 = [1; 2; 3; 2; 5; 6]) = (1 / 5) * (1 / 20) = 1 / 100
# Pr(B2 = [1; 2; 3; 3; 5; 6]) = (1 / 5) * (1 / 20) = 1 / 100
# Pr(B2 = [1; 2; 3; 4; 5; 6]) = (1 / 5) * (1 / 20) +
#                               (1 / 5) * (1 / 5) +
#                               (1 / 5) * 1 = 1 / 4

function test_crossover()
  support = GASupport(10, 6)

  R1 = [1; 1; 2; 2; 2; 3]
  R2 = [1; 2; 3; 4; 5; 5]

  N = 1000000

  pr = [1 / 5; 2 / 5; 1 / 5; 1 / 15; 1 / 10; 1 / 30; 1 / 10; 8 / 25; 1 / 50;
        1 / 100; 1 / 100; 1 / 20; 1 / 100; 1 / 50; 1 / 100; 1 / 20; 1 / 100;
        1 / 100; 1 / 20; 1 / 20; 1 / 100; 1 / 100; 1 / 100; 1 / 4]

  tmp = zeros(Float64, length(pr))

  for i in 1:N
    crossover!(R1, R2, support)

    if support.oi.R == [1; 2; 3; 4; 5; 5]
      tmp[ 1] += 1
    elseif support.oi.R == [1; 1; 3; 4; 5; 5]
      tmp[ 2] += 1
    elseif support.oi.R == [1; 1; 3; 3; 5; 5]
      tmp[ 3] += 1
    elseif support.oi.R == [1; 1; 3; 3; 3; 1]
      tmp[ 4] += 1
    elseif support.oi.R == [1; 1; 3; 3; 3; 3]
      tmp[ 5] += 1
    elseif support.oi.R == [1; 1; 3; 3; 3; 6]
      tmp[ 6] += 1
    end

    if support.oj.R == [1; 1; 3; 3; 3; 6]
      tmp[ 7] += 1
    elseif support.oj.R == [1; 2; 3; 3; 3; 6]
      tmp[ 8] += 1
    elseif support.oj.R == [1; 2; 3; 1; 1; 6]
      tmp[ 9] += 1
    elseif support.oj.R == [1; 2; 3; 2; 1; 6]
      tmp[10] += 1
    elseif support.oj.R == [1; 2; 3; 3; 1; 6]
      tmp[11] += 1
    elseif support.oj.R == [1; 2; 3; 4; 1; 6]
      tmp[12] += 1
    elseif support.oj.R == [1; 2; 3; 1; 2; 6]
      tmp[13] += 1
    elseif support.oj.R == [1; 2; 3; 2; 2; 6]
      tmp[14] += 1
    elseif support.oj.R == [1; 2; 3; 3; 2; 6]
      tmp[15] += 1
    elseif support.oj.R == [1; 2; 3; 4; 2; 6]
      tmp[16] += 1
    elseif support.oj.R == [1; 2; 3; 1; 3; 6]
      tmp[17] += 1
    elseif support.oj.R == [1; 2; 3; 2; 3; 6]
      tmp[18] += 1
    elseif support.oj.R == [1; 2; 3; 4; 3; 6]
      tmp[19] += 1
    elseif support.oj.R == [1; 2; 3; 4; 4; 6]
      tmp[20] += 1
    elseif support.oj.R == [1; 2; 3; 1; 5; 6]
      tmp[21] += 1
    elseif support.oj.R == [1; 2; 3; 2; 5; 6]
      tmp[22] += 1
    elseif support.oj.R == [1; 2; 3; 3; 5; 6]
      tmp[23] += 1
    elseif support.oj.R == [1; 2; 3; 4; 5; 6]
      tmp[24] += 1
    end
  end

  tmp /= N

  @test isapprox(tmp, pr, rtol=0.01)

  nothing
end

test_crossover()
