#include <iostream>
#include <math.h>

int isSimilar(const std::vector<double>& ListSignatures){
	
	
	double a = 0.19, b = 0.04, c = 0.08, d = 0.08;
	double tolerance=0.2;


	int ListSignaturesSize = ListSignatures.size();
	std::cout << "What is the size ??  " << ListSignaturesSize << std::endl;

	int StartIndex=-1;

	for (int i=0;i<ListSignaturesSize;i++){
		if (ListSignatures.at(i)==0) continue;
		else {
			//std::cout << i << std::endl;
			int ZeroLength=0;
			int Index = i+1;
			while (Index+ZeroLength < ListSignaturesSize && ListSignatures.at(Index+ZeroLength)==0 ) ZeroLength++;
			std::cout << "Zero length " << ZeroLength << std::endl; 
			if (abs(ZeroLength-a*ListSignaturesSize) < (tolerance*ListSignaturesSize)){
				StartIndex=i;
				break;
			} 
		}
	}

	if (StartIndex==-1) return 0;

	std::cout << "Kabeer" << std::endl;	

	std::vector<double> UpdatedListSignatures;

	int Segments[12];
	int CountSegments=0;
	for (int i=StartIndex;i<ListSignaturesSize;i++) UpdatedListSignatures.push_back(ListSignatures.at(i));
	for (int i=0;i<StartIndex;i++) UpdatedListSignatures.push_back(ListSignatures.at(i));
	std::cout << "GEY" << std::endl;
	graph(UpdatedListSignatures, "Updated Graph");
	for (int i=0;i<ListSignaturesSize;i++){
		if (UpdatedListSignatures.at(i)==0) continue;
			
		if (CountSegments > 12) return 0;
		
		int Length=1;
		while ((i+Length)< UpdatedListSignatures.size() && ListSignatures.at(i+Length)==0) Length++;
		Segments[CountSegments]=Length;
		CountSegments++;
	}
	std::cout << "GEY" <<std::endl;
	if (CountSegments < 12) return 0;


	if (abs(Segments[0]-(a*ListSignaturesSize)) > (tolerance*ListSignaturesSize)) return 0;
	if (abs(Segments[1]-(b*ListSignaturesSize)) > (tolerance*ListSignaturesSize)) return 0;
	if (abs(Segments[2]-(c*ListSignaturesSize)) > (tolerance*ListSignaturesSize)) return 0;
	if (abs(Segments[3]-(d*ListSignaturesSize)) > (tolerance*ListSignaturesSize)) return 0;
	if (abs(Segments[4]-(c*ListSignaturesSize)) > (tolerance*ListSignaturesSize)) return 0;
	if (abs(Segments[5]-(b*ListSignaturesSize)) > (tolerance*ListSignaturesSize)) return 0;
	if (abs(Segments[6]-(a*ListSignaturesSize)) > (tolerance*ListSignaturesSize)) return 0;
	if (abs(Segments[7]-(b*ListSignaturesSize)) > (tolerance*ListSignaturesSize)) return 0;
	if (abs(Segments[8]-(c*ListSignaturesSize)) > (tolerance*ListSignaturesSize)) return 0;
	if (abs(Segments[9]-(d*ListSignaturesSize)) > (tolerance*ListSignaturesSize)) return 0;
	if (abs(Segments[10]-(c*ListSignaturesSize)) > (tolerance*ListSignaturesSize)) return 0;
	if (abs(Segments[11]-(b*ListSignaturesSize)) > (tolerance*ListSignaturesSize)) return 0;

	std::cout << "BIG GEY" << std::endl;
	return 1;


}