memo = {}

def fibonacci(num,cou=0):
  if num < 0:
    return
  if num in memo.keys():
    return memo[num], cou
  if num == 0:
    memo[0] = 0
    return memo[0],cou+1
  if num == 1:
    memo[1] = 1
    return memo[1],cou+1
  else:
    fib1,cou1 = fibonacci(num-1,cou)
    fib2,cou2 = fibonacci(num-2,cou)
    memo[num] = fib1 + fib2
    cou = cou1 + cou2 + 2
    return memo[num],cou

num = int(input("What number of Fibonacci do you want to calculate? "))
print(f"Fibonacci number {num}: Count:")
print(fibonacci(num))