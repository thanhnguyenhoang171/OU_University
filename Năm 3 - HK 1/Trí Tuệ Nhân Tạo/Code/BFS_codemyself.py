from collections import defaultdict
class Graph:
    def __init__(self):
        self.graph=defaultdict(list)
        
    def add_edge(self, vertex_1, vertex_2):
        self.graph[vertex_1].append(vertex_2)
        self.graph[vertex_2].append(vertex_1)
        
graph_G = Graph()

graph_G.add_edge('A', 'B')
graph_G.add_edge('A', 'C')
graph_G.add_edge('B', 'D')
graph_G.add_edge('B', 'E')
graph_G.add_edge('E', 'G')
graph_G.add_edge('D', 'F')
graph_G.add_edge('G', 'H')
graph_G.add_edge('F', 'H')
graph_G.add_edge('F', 'C')
graph_G.add_edge('H', 'I')

def equal(vertex_1, vertex_2):
    return vertex_1==vertex_2

def find_path(parent, start_vertex, end_vertex):
    current_vertex=end_vertex
    path = [end_vertex]
    while current_vertex != start_vertex:
        current_vertex = parent[current_vertex]
        path.insert(0, current_vertex)
    return path

def count_connected_components(graph_G):
    visited = {}
    for vertex in graph_G.graph:
        visited[vertex]=False
    count = 0
    for vertex in visited:
        if not visited[vertex]:
            BFS(graph_G, )
def BFS(graph_G, start_vertex, end_vertex):
    if start_vertex not in graph_G.graph and end_vertex not in graph_G.graph:
        print (f"Vertex {start_vertex} or {end_vertex} don't exist in graph")
        return
    
    visited = []
    queue = []
    parent = {}
    
    visited.append(start_vertex)
    visited[start_vertex]=True
    queue.append(start_vertex)
    
    while len(queue) != 0:
        m = queue.pop(0)
        
        for neighbor in graph_G.graph[m]:
            if neighbor not in visited:
                visited.append(neighbor)
                visited[neighbor]=True
                queue.append(neighbor)
                parent[neighbor]=m
                
        if equal(m, end_vertex):
            print("Order visited:", " -> ".join(visited))
            path=find_path(parent, start_vertex, end_vertex)
            return path
        
start_vt = input("Enter start vertex: ")
end_vt = input("Enter end vertex: ")


path = BFS(graph_G, start_vt, end_vt)
if path:
    print("Path from A to I:", " -> ".join(path))
else:
    print("No path found.")
