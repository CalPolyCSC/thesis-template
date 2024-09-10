def fibonacci(n: int) -> int:
"""This function returns the nth Fibonacci number."""
    if n == 0 or n == 1:
        return n
    else:
        return fibonacci(n-1) + fibonacci(n-2)
