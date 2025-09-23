def add(x,y):
    return x + y

def sub(x,y):
    return x - y

def multiply(x,y):
    return x * y

def divide(x,y):
    return x / y

def square(val):
    return val ** 2

def cube(val):
    return val ** 3

def fact(n):
    if n < 0:
        raise ValueError("n in factorical can't be negative")
    elif n == 1:
        return 1
    else:
        return n * fact(n-1) # Recursion.









    