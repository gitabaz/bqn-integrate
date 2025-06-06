#!/usr/bin/env BQN

rel_tol←1e¯9
abs_tol←0

IsClose ← {
  (|𝕩-𝕨)≤abs_tol⌈rel_tol×𝕨⌈○|𝕩
}

Test ← {
  msg ← ("expected: " ∾ (•Fmt 𝕨) ∾ ", got: " ∾ •Fmt 𝕩)
  •Out "  "∾(𝕨 IsClose◶"Fail: "‿"Pass: " 𝕩)∾ msg
}

int ← •Import "integrate.bqn"


•Out "test Trap"
4.0 Test int.Trap 1‿2‿3
8.0 Test 2 int.Trap 1‿2‿3
8.0 Test 4‿6‿8 int.Trap 1‿2‿3
¯8.0 Test 8‿6‿4 int.Trap 1‿2‿3
# Int[x^2, 0, 1]
0.33340274885464394 Test (÷49) int.Trap ×˜(↕÷-⟜1)50
t←2×π×(↕÷-⟜1)1000
x←•math.Sin t
y←•math.Cos t
3.141571941375841 Test x int.Trap y
