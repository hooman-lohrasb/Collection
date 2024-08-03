# ---------------------------------- #  
#   Fibonacci sequence               #
#                                    #
#   The values should not exceed 4M  #
# ---------------------------------- #

def FibonacciSequence(x: int, y: int, stop: int):

    even = []
    while x < stop:
        if x%2==0: even.append(x)
        x, y = y, x + y

    print(f"Result: {sum(even)}")


if __name__=="__main__":
    FibonacciSequence(1, 2, 4_000_000)

