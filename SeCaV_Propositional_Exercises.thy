theory SeCaV_Propositional_Exercises imports SeCaV begin

section \<open>Exercise 1\<close>

proposition \<open>p \<and> q \<longrightarrow> p\<close> by metis

proposition \<open>(p \<and> q) \<longrightarrow> p\<close> by metis

text \<open>
  Predicate numbers
    0 = p
    1 = q
  \<close>

lemma \<open>\<tturnstile>
  [
    Imp (Con (Pre 0 []) (Pre 1 [])) (Pre 0 [])
  ]
  \<close>
proof -
  from AlphaImp have ?thesis if \<open>\<tturnstile>
    [
      Neg (Con (Pre 0 []) (Pre 1 [])),
      Pre 0 []
    ]
    \<close>
    using that by simp
  with AlphaCon have ?thesis if \<open>\<tturnstile>
    [
      Neg (Pre 0 []),
      Neg (Pre 1 []),
      Pre 0 []
    ]
    \<close>
    using that by simp
  with Ext have ?thesis if \<open>\<tturnstile>
    [
      Pre 0 [],
      Neg (Pre 0 []),
      Neg (Pre 1 [])
    ]
    \<close>
    using that by simp
  with Basic show ?thesis
    by simp
qed


section \<open>Exercise 2\<close>

proposition \<open>p \<and> q \<longrightarrow> q\<close> by metis

proposition \<open>(p \<and> q) \<longrightarrow> q\<close> by metis

text \<open>
  Predicate numbers
    0 = p
    1 = q
  \<close>

lemma \<open>\<tturnstile>
  [
    Imp (Con (Pre 0 []) (Pre 1 [])) (Pre 1 [])
  ]
  \<close>
proof -
  from AlphaImp have ?thesis if \<open>\<tturnstile>
    [
      Neg (Con (Pre 0 []) (Pre 1 [])),
      Pre 1 []
    ]
    \<close>
    using that by simp
  with AlphaCon have ?thesis if \<open>\<tturnstile>
    [
      Neg (Pre 0 []),
      Neg (Pre 1 []),
      Pre 1 []
    ]
    \<close>
    using that by simp
  with Ext have ?thesis if \<open>\<tturnstile>
    [
      Pre 1 [],
      Neg (Pre 1 [])
    ]
    \<close>
    using that by simp
  with Basic show ?thesis
    by simp
qed


section \<open>Exercise 3\<close>

proposition \<open>(p \<longrightarrow> q) \<or> (q \<longrightarrow> r)\<close> by metis

proposition \<open>(p \<longrightarrow> q) \<or> (q \<longrightarrow> r)\<close> by metis

text \<open>
  Predicate numbers
    0 = p
    1 = q
    2 = r
  \<close>

lemma \<open>\<tturnstile>
  [
    Dis (Imp (Pre 0 []) (Pre 1 [])) (Imp (Pre 1 []) (Pre 2 []))
  ]
  \<close>
proof -
  from AlphaDis have ?thesis if \<open>\<tturnstile>
    [
      Imp (Pre 0 []) (Pre 1 []),
      Imp (Pre 1 []) (Pre 2 [])
    ]
    \<close>
    using that by simp
  with AlphaImp have ?thesis if \<open>\<tturnstile>
    [
      Neg (Pre 0 []),
      Pre 1 [],
      Imp (Pre 1 []) (Pre 2 [])
    ]
    \<close>
    using that by simp
  with Ext have ?thesis if \<open>\<tturnstile>
    [
      Imp (Pre 1 []) (Pre 2 []),
      Pre 1 []
    ]
    \<close>
    using that by simp
  with AlphaImp have ?thesis if \<open>\<tturnstile>
    [
      Neg (Pre 1 []),
      Pre 2 [],
      Pre 1 []
    ]
    \<close>
    using that by simp
  with Ext have ?thesis if \<open>\<tturnstile>
    [
      Pre 1 [],
      Neg (Pre 1 [])
    ]
    \<close>
    using that by simp
  with Basic show ?thesis
    by simp
qed

section \<open>Exercise 4\<close>

proposition \<open>(p \<longrightarrow> q) \<longrightarrow> p \<longrightarrow> q\<close> by metis

text \<open>
  Predicate numbers
    0 = p
    1 = q
  \<close>

lemma \<open>\<tturnstile>
  [
    Imp (Imp (Pre 0 []) (Pre 1 [])) (Imp (Pre 0 []) (Pre 1 []))
  ]
  \<close>
proof -
  from AlphaImp have ?thesis if \<open>\<tturnstile>
    [
      Neg (Imp (Pre 0 []) (Pre 1 [])),
      Imp (Pre 0 []) (Pre 1 [])
    ]
    \<close>
    using that by simp
  with Ext have ?thesis if \<open>\<tturnstile>
    [
      Imp (Pre 0 []) (Pre 1 []),
      Neg (Imp (Pre 0 []) (Pre 1 []))
    ]
    \<close>
    using that by simp
  with AlphaImp have ?thesis if \<open>\<tturnstile>
    [
      Neg (Pre 0 []),
      Pre 1 [],
      Neg (Imp (Pre 0 []) (Pre 1 []))
    ]
    \<close>
    using that by simp
  with Ext have ?thesis if \<open>\<tturnstile>
    [
      Neg (Imp (Pre 0 []) (Pre 1 [])),
      Neg (Pre 0 []),
      Pre 1 []
    ]
    \<close>
    using that by simp
  with BetaImp have ?thesis if \<open>\<tturnstile>
    [
      Pre 0 [],
      Neg (Pre 0 []),
      Pre 1 []
    ]
    \<close> and \<open>\<tturnstile>
    [
      Neg (Pre 1 []),
      Neg (Pre 0 []),
      Pre 1 []
    ]
    \<close>
    using that by simp
  with Ext have ?thesis if \<open>\<tturnstile>
    [
      Pre 0 [],
      Neg (Pre 0 [])
    ]
    \<close> and \<open>\<tturnstile>
    [
      Pre 1 [],
      Neg (Pre 1 [])
    ]
    \<close>
    using that by simp
  with Basic show ?thesis
    by simp
qed


section \<open>Exercise 5\<close>

proposition \<open>p \<longrightarrow> (p \<longrightarrow> q) \<longrightarrow> q\<close> by metis

text \<open>
  Predicate numbers
    0 = p
    1 = q
  \<close>

lemma \<open>\<tturnstile>
  [
    Imp (Pre 0 []) (Imp (Imp (Pre 0 []) (Pre 1 [])) (Pre 1 []))
  ]
  \<close>
proof -
  from AlphaImp have ?thesis if \<open>\<tturnstile>
    [
      Neg (Pre 0 []),
      Imp (Imp (Pre 0 []) (Pre 1 [])) (Pre 1 [])
    ]
    \<close>
    using that by simp
  with Ext have ?thesis if \<open>\<tturnstile>
    [
      Imp (Imp (Pre 0 []) (Pre 1 [])) (Pre 1 []),
      Neg (Pre 0 [])
    ]
    \<close>
    using that by simp
  with AlphaImp have ?thesis if \<open>\<tturnstile>
    [
      Neg (Imp (Pre 0 []) (Pre 1 [])),
      Pre 1 [],
      Neg (Pre 0 [])
    ]
    \<close>
    using that by simp
  with BetaImp have ?thesis if \<open>\<tturnstile>
    [
      Pre 0 [],
      Pre 1 [],
      Neg (Pre 0 [])
    ]
    \<close> and \<open>\<tturnstile>
    [
      Neg (Pre 1 []),
      Pre 1 [],
      Neg (Pre 0 [])
    ]
    \<close>
    using that by simp
  with Ext have ?thesis if \<open>\<tturnstile>
    [
      Pre 0 [],
      Neg (Pre 0 [])
    ]
    \<close> and \<open>\<tturnstile>
    [
      Pre 1 [],
      Neg (Pre 1 [])
    ]
    \<close>
    using that by simp
  with Basic show ?thesis
    by simp
qed


section \<open>Exercise 6\<close>

proposition \<open>p \<and> (p \<longrightarrow> q) \<longrightarrow> q\<close> by metis

section \<open>Exercise 7\<close>

proposition \<open>p \<longrightarrow> q \<longrightarrow> p\<close> by metis

section \<open>Exercise 8\<close>

proposition \<open>(p \<longrightarrow> q \<longrightarrow> r) \<longrightarrow> (p \<longrightarrow> q) \<longrightarrow> p \<longrightarrow> r\<close> by metis

section \<open>Exercise 9\<close>

proposition \<open>p \<or> q \<longrightarrow> q \<or> p\<close> by metis

section \<open>Exercise 10\<close>

proposition \<open>p \<or> (p \<longrightarrow> q)\<close> by metis

end
