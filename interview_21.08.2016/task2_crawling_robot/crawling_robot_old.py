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
    cache = {}

    def f(x, y):
        """
        f(x,y) - number of paths from x0,y0 to x,y

        f(x,y) = sum of f(ax,ay) where (ax,ay) not visited adjacent cells

        """
        # print('f',x,':',y)
        if x == x0 and y == y0:
            #print('f({},{})={}'.format(x, y, 1))
            return 1

        # try:
        #     c = cache[(frozenset(visited), x, y)]
        #     print("cache hit!")
        #     return c
        # except KeyError:
        #     pass

        visited.add((x, y))
        adj = get_not_visited_adj(n, m, x, y, visited)
        c = sum(f(ax, ay) for ax, ay in adj)
        #cache[(frozenset(visited), x, y)] = c
        #print(cache)
        visited.remove((x, y))
        # try:
        #     del cache[(x,y)]
        #     print("DEL!")
        # except KeyError:
        #     pass
        #print('f({},{})={}'.format(x, y, c))
        return c

    return f(x1, y1)

# def nc_no_recursion(n, m, x0, y0, x1, y1):
#     visited = set()
#     cache = {}
#
#     childs = {}
#
#     root = (None,(x1,y1))
#     cnode = root
#
#     def f(x,y):
#         if x == x0 and y==y0:
#             return 1
#         try:
#             return cache[(x, y)]
#         except KeyError:
#             return '?'
#
#
#     while True:
#         x,y = cnode[1]
#         visited.add((x, y))
#         adj = get_not_visited_adj(n, m, x, y, visited)
#         #print(adj)
#
#         for ax,ay in adj:
#             childs.setdefault((x,y),set()).add((cnode,(ax,ay)))
#
#         #print(childs)
#         try:
#             cnode = next(c for c in childs[(x,y)] if f(c[1][0],c[1][1]) == '?')
#         except StopIteration:
#             #print("stop!")
#             cache[(x,y)] = sum(f(c[1][0],c[1][1]) for c in childs[(x,y)])
#             visited.remove((x, y))
#             parent = cnode[0]
#
#             if parent == None:
#                 return cache[cnode[1]]
#             cnode = parent


#print(nc_no_recursion(2, 2, 2, 2, 1, 1))
#print(nc_no_recursion(3, 3, 2, 2, 1, 1))

#print(nc(3, 3, 2, 2, 1, 1))
#print(nc(6, 6, 2, 2, 1, 1))



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
