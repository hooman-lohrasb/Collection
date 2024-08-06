#
#   Find the largest Prime Factor
#

target = 600_851_475_143


def findTheLargestPrime(target: int):
    value = 0

    for x in range(3, target//2, 2):
        if target%x==0:
            value = x
            break

    could_be_prime = [value]
    for x in range(value, target//value, 2):
        if target%x==0:
            if target//x == could_be_prime[-1]:
                break

            could_be_prime.append(x)
            

    could_be_prime2 = [target//x for x in could_be_prime]
    for x in could_be_prime2:
        could_be_prime.append(x)

    not_prime = []
    for x in could_be_prime:
        for y in range(3, x//2, 2):
            if x%y==0:
                not_prime.append(x)
                break

    result = sorted(set(could_be_prime) - set(not_prime))

    return result[-1]


def Primes(limit: int):

    could_be_prime = [x for x in range(1, limit)]
    # not_prime = [x for x in could_be_prime for y in range(2, x//2+1) if x%y==0]

    not_prime = []
    for x in could_be_prime:
        for y in range(2, x//2+1):
            if x%y==0:
                not_prime.append(x)
                break

    return set(could_be_prime) - set (not_prime)

if __name__=="__main__":
    # result = findTheLargestPrime(target)
    # print(f"{result=}")

    print(Primes(100_000))
