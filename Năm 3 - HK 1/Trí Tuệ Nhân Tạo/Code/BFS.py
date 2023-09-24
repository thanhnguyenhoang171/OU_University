class Node:
    def __init__(self, name, par=None, w=0):
        self.name=name
        self.par=par
        self.w=w
    
    def display(self):
        print(self.name)
        
    def __lt__(self, other):
        return self.w<other.w;
    
from collections import defaultdict


data = defaultdict(list)

data['A']=['B', 'C', 'D','E']
data['B']=['F','G']
data['F']=['K','L', 'M']
data['G']=['O','P']
data['L']=['H', 'Y']
data['P']=['I']
data['C']=['J', 'K']
data['K']=['Z']
data['D']=['S', 'Q', 'R']
data['E']=['T','W','O','X']


def Equal(O, G):
    return O.name==G.name

def CheckInArray(tmp,Open):
    for x in Open:
        if Equal(tmp,x):
            return True
    return False
        
def Path(O):
    print(O.name)
    if O.par != None:
        Path(O.par)
        
res=0 

def BFS(Start = Node('A'), Goal = Node('I')):
 
    Open = []
    Closed = []
    Open.append(Start)
    while True:
        if len(Open)==0:
            print('Không tìm thấy')
            res+=1
            return
        O=Open.pop(0)
        Closed.append(O)
         # nếu Open mà bằng Goal --> tìm thấy
        if Equal(O,Goal) == True:
             print('Đã tìm thấy')
             Path(O) # xuất ra đường đi từ Start đến Goal
             return
        
            
        for x in data[O.name]:
            tmp=Node(x)
            tmp.par=O
            
            CK_1=CheckInArray(tmp, Open)
            CK_2=CheckInArray(tmp, Closed)
            if not CK_1 and not CK_2:
                Open.append(tmp)
            # nếu mà các con của O.par mà khác Open và Closed thì thêm tmp vào cuối Open
            
            
BFS()
Lien_thong()