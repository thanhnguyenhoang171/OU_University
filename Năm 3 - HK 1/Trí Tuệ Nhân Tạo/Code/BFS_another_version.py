from collections import defaultdict


class Graph:
    def __init__(self):
        self.graph = defaultdict(list)

    def add_edge(self, vertex_1, vertex_2):
        # undirected graph
        self.graph[vertex_1].append(vertex_2)
        self.graph[vertex_2].append(vertex_1)


def find_path(parent, start_vertex, end_vertex):
    path = [end_vertex]
    current_vertex = end_vertex
    while current_vertex != start_vertex:
        current_vertex = parent[current_vertex]
        path.insert(0, current_vertex)
    return path


def BFS(graph_G, start_vertex, end_vertex):
    if start_vertex not in graph_G.graph or end_vertex not in graph_G.graph:
        print(
            f"Đỉnh bắt đầu {start_vertex} hoặc đỉnh kết thúc {end_vertex} không thuộc đồ thị")
        return

    visited = []
    queue = []
    parent = {}

    visited.append(start_vertex)
    queue.append(start_vertex)

    while queue:
        m = queue.pop(0)

        for neighbor in graph_G.graph[m]:
            if neighbor not in visited:
                visited.append(neighbor)
                queue.append(neighbor)
                parent[neighbor] = m

        if m == end_vertex:
            # Find and return the path
            path = find_path(parent, start_vertex, end_vertex)
            return path


graph_G = Graph()

graph_G.add_edge('A', 'B')
graph_G.add_edge('A', 'C')
graph_G.add_edge('B', 'D')
graph_G.add_edge('B', 'E')
graph_G.add_edge('C', 'F')
graph_G.add_edge('D', 'F')
graph_G.add_edge('E', 'G')
graph_G.add_edge('F', 'H')
graph_G.add_edge('G', 'H')
graph_G.add_edge('H', 'I')

# Example usage:
start_VT = input("Enter start vertex: ")
end_VT = input("Enter end vertex: ")
path = BFS(graph_G, start_VT, end_VT)
if path:
    print("Path from A to I:", " -> ".join(path))
else:
    print("No path found.")
