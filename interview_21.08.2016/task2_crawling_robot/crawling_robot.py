# coding: utf8
import sys

sys.setrecursionlimit(5500)


def get_not_visited_adj(n, m, x, y, visited):
    adj = []
    if x + 1 <= n and ((x + 1), y) not in visited:
        adj.append(((x + 1), y))
    if x - 1 >= 1 and ((x - 1), y) not in visited:
        adj.append(((x - 1), y))
    if y + 1 <= m and (x, y + 1) not in visited:
        adj.append((x, y + 1))
    if y - 1 >= 1 and (x, y - 1) not in visited:
        adj.append(((x, y - 1)))
    return adj


def nc(n, m, x0, y0, x1, y1):
    """
    N - number of cells in matrix
    O(N) = O(N-1)+O(N-1) ~ 2"N #Exponential

    """
    visited = set()

    def f(x, y):
        """
        f(x,y) - number of paths from x0,y0 to x,y

        f(x,y) = sum of f(ax,ay) where (ax,ay) not visited adjacent cells

        """
        # print('f',x,':',y)
        if x == x0 and y == y0:
            # print('f({},{})={}'.format(x, y, 1))
            return 1
        visited.add((x, y))
        adj = get_not_visited_adj(n, m, x, y, visited)
        c = sum(f(ax, ay) for ax, ay in adj)
        visited.remove((x, y))
        # print('f({},{})={}'.format(x, y, c))
        return c

    return f(x1, y1)


if __name__ == "__main__":
    try:
        datafile = sys.argv[1]
    except IndexError:
        exit(
            "please specify input file as command line arg (the only),"
            " for example: ./crawling_robot.py datafile.txt")

    with open(datafile) as f:
        for case in f.readlines():
            print('-----{}'.format(nc(*(int(arg) for arg in case.split(' ')))))
