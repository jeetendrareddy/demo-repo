from queue import Queue
graph = {
  '8' : ['6','7'],
  '6' : ['5', '2'],
  '7' : ['1','3'],
  '5' : [],
  '2' : ['9'],
  '1' :[],
  '3' :[],
  '9' :[]


}
visited = {}
level = {}
parent = {}
output = []
queue = Queue() 
for node in graph.keys():
    visited[node] = False
    parent[node] = None
    level[node] = -1  #infinity
#print(visited)
#print(node)
#print(level)

s = "8"
visited[s] = True
level[s] = 0
queue.put(s) #adding in the queue

while not queue.empty():   #if the queue is not empty
    u = queue.get()        #removing the left element in the queue
    output.append(u)       #adding the element into array
    for v in graph[u]:     #goes through the graph
        if not visited[v]: #if the node is not visited
            visited[v] = True #mark it as visited
            parent[v] = u   #New parent element
            level[v] = level[u]+1 #New level of the node
            queue.put(v)  #adding in the queue
print(output) 
