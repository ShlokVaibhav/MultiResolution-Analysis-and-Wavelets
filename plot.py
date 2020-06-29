import pandas as pd
from mpl_toolkits.mplot3d import Axes3D  # noqa: F401 unused import
import matplotlib.pyplot as plt
from matplotlib import cm
from matplotlib.ticker import LinearLocator, FormatStrFormatter
import numpy as np
df=pd.read_excel('b.xlsx')
dftemp=[list(df.columns)]
df1=pd.DataFrame(dftemp,columns=df.columns)
frames=[df1,df]
df2=pd.concat(frames)
fig = plt.figure()
ax = fig.gca(projection='3d')
aaaa=5555
X = np.arange(-5, 5, 15)
Y = np.arange(-5, 5, 1000)
X, Y = np.meshgrid(X, Y)
Z = df2.to_numpy()

# Plot the surface.
surf = ax.plot_surface(X,Y,Z, cmap=cm.coolwarm,
                       linewidth=0, antialiased=False)

# Customize the z axis.
ax.set_zlim(0, 1.01)
ax.set_xlim(-5,5)
ax.set_ylim(-5,5)

# Add a color bar which maps values to colors.
fig.colorbar(surf, shrink=0.5, aspect=5)
plt.show()
