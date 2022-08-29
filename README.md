---
KNN ruby implementation
___

this is a K-nearest-neighbours ruby implementation.

### Input format
	x0,x1,x2,…xn|v0
	y0,y1,y2,…yn|v1
	z0,z1,z2,…zn|v2
	
### How to use?

	knn = KNN.new
	knn.train "path/to/sample/file"
	knn.categorize <vector>, k
for more info, please refer `spec/knn_spec.rb`.
