#ifndef HELIPAD_DET_SIGNATURE_MATCHING_H
#define HELIPAD_DET_SIGNATURE_MATCHING_H

int isSimilar(std::vector<double>& ListSignatures, double a, double b, double c, double d, double tolerance){
	
	int ListSignaturesSize = ListSignatures.size();
	int StartIndex=-1;

	for (int i=0;i<ListSignaturesSize;i++){
		if (ListSignatures.at(i)==0) continue;
		else{
			int ZeroLength=0;
			while (i+1+ZeroLength <= ListSignaturesSize-1 && ListSignatures.at(i+1+ZeroLength)==0)
				ZeroLength++;

			if (abs(ZeroLength+2-a*ListSignaturesSize) < (tolerance*ListSignaturesSize)){//
				StartIndex=i;
				break;
			}
		}
	}

	if (StartIndex==-1) return 0;

	std::vector<double> UpdatedListSignatures;

	int Segments[12];
	int CountSegments=0;

	for(int i=StartIndex;i<ListSignaturesSize;i++)
		UpdatedListSignatures.push_back(ListSignatures.at(i));
	for(int i=0;i<StartIndex;i++)
		UpdatedListSignatures.push_back(ListSignatures.at(i));

	int Length;

	for(int i=0;i<ListSignaturesSize;i++){
		if (UpdatedListSignatures.at(i)==0)
			continue;
		if (CountSegments > 11)
			return 0;
		
		Length=0;
		
		while ((i+1+Length) <= ListSignaturesSize-1 && UpdatedListSignatures.at(i+1+Length)==0)
		{
			Length++;
		}
		
		i = i+Length-1;
		Segments[CountSegments]=Length+2;
		CountSegments++;
	}


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

	return 1;
}

#endif