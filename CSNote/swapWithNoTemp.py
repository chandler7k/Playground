import cmath
def swapa(&a,&b):
    a = a ^ b
    b = b ^ a
    a = a ^ b


if __name__ == "__main__":
    a = 2
    b = 6
    swapa(a,b)
    print(a)
    print(b)