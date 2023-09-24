from collections import defaultdict
import queue

# thêm ưu tiên về trọng số (weight)
class Graph:
    def __init__(self):
        self.graph = defaultdict(dict)

    def add_edge(self, vertex1, vertex2, weight):
        self.graph[vertex1][vertex2] = weight
        self.graph[vertex2][vertex1] = weight  # undirected graph


def path(parent, start_vertex, end_vertex):
    path = [end_vertex]
    while end_vertex != start_vertex:
        end_vertex = parent[end_vertex]
        path.append(end_vertex)
    return path[::-1]  # Reverse the path to get it from start to end


def BFS(undirected_graph, start, end):
    if start not in undirected_graph.graph or end not in undirected_graph.graph:
        # Either start or end vertex is not in the graph
        print(f"{start} or {end} vertex doesn't exist in graph")
        return

    visited = set()
    visited_nodes = []  # Danh sách các đỉnh đã duyệt
    priority_queue=queue.PriorityQueue()#queue = []
    parent = {}

    #visited.add(start)
    priority_queue.put((0, start)) # Priortity queue with (weight, vertex)
    #queue.append(start)
    parent[start] = None  # start vertex has no parent

    while not priority_queue.empty(): #while queue:
        #current_vertex = queue.pop(0)
        current_weight, current_vertex = priority_queue.get()
      
        if current_vertex == end:
            # Return the path
            path_result=path(parent, start, end)
            print(f"Các đỉnh đã duyệt: {' -> '.join(visited_nodes)}")
            return path_result

        # Explore all neighbors of the current vertex
        # for neighbor in undirected_graph.graph[current_vertex]:
        for neighbor, weight in undirected_graph.graph[current_vertex].items():
            if neighbor not in visited:
                visited.add(neighbor)
                # Thêm đỉnh đã duyệt vào danh sách
                visited_nodes.append(neighbor)
                priority_queue.put((current_weight + weight, neighbor))#queue.append(neighbor)
                parent[neighbor] = current_vertex

    # If the target vertex is not reachable from the start vertex, return None
    return None


# Create the graph
undirected_graph = Graph()

# Add edges with weights to the graph
undirected_graph.add_edge('A', 'B', 2)
undirected_graph.add_edge('A', 'C', 3)
undirected_graph.add_edge('B', 'D', 1)
undirected_graph.add_edge('B', 'E', 4)
undirected_graph.add_edge('C', 'F', 2)
undirected_graph.add_edge('D', 'F', 5)
undirected_graph.add_edge('E', 'G', 2)
undirected_graph.add_edge('F', 'H', 3)
undirected_graph.add_edge('G', 'H', 1)
undirected_graph.add_edge('H', 'I', 2)

start_vertex = 'A'
target_vertex = 'I'

path_result = BFS(undirected_graph, start_vertex, target_vertex)

if path_result:
    print(
        f"Shortest path from {start_vertex} to {target_vertex}: {' -> '.join(path_result)}")
else:
    print(f"There is no path from {start_vertex} to {target_vertex}.")
