import numpy as np

# fungsi sigmoid
def nonlin(x,deriv=False):

    if(deriv==True):

        return x*(1-x)

    return 1/(1+np.exp(-x))

# input dataset
X = np.array([  [0,0,1],
                [0,1,1],
                [1,0,1],
                [1,1,1] ])

# output dataset            
y = np.array([[0,0,1,1]]).T

# membuat angka acak untuk perhitungan
np.random.seed(1)

# inisialisasi bobot secara acak dengan mean 0
syn0 = 2*np.random.random((3,1)) - 1

for iter in range(100):
    l0 = X
    l1 = nonlin(np.dot(l0,syn0))
    l1_error = y - l1
    l1_delta = l1_error * nonlin(l1,True)
    syn0 += np.dot(l0.T,l1_delta)

print ("Output Setelah Pelatihan:")

print (l1)

