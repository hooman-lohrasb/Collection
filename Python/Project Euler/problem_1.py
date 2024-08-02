#!/bin/python3
"""
    Description:
        Find the sum of natural numbers that are less than 1000 and are divisible by 3 or 5
"""

# Solution 1
print(
    sum(
        [x for x in range(3, 1000) if x%3==0 or x%5==0]
    )
)


# Solution 2
print(
    sum(
        set(range(3, 1000, 3)) | set(range(5, 1000, 5))
    )
)


# Solution 3
result = 0
for i in range(3, 1000):
    if i % 3 == 0 or i % 5 == 0:
        result += i
print(result)