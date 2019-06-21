#ifndef HELIPAD_DET_SIGNATURE_MATCHING_H
#define HELIPAD_DET_SIGNATURE_MATCHING_H

int isSimilar(std::vector<double>& signature, std::vector<cv::Point>& contour, double a, double b, double c, double d, double tolerance){
	
	int signature_size = signature.size();
	int start_index=-1;

	for (int i=0;i<signature_size;i++){
		if (signature.at(i)==0) continue;
		else{
			int zero_length=0;
			while (i+1+zero_length <= signature_size-1 && signature.at(i+1+zero_length)==0)
				zero_length++;

			if (abs(zero_length+2-a*signature_size) < (tolerance*signature_size)){//
				start_index=i;
				break;
			}
		}
	}

	if (start_index==-1) return 0;

	std::vector<double> updated_signature;

	int segments[12];
	int count_segments=0;

	for(int i=start_index;i<signature_size;i++)
		updated_signature.push_back(signature.at(i));
	for(int i=0;i<start_index;i++)
		updated_signature.push_back(signature.at(i));

	int length;

	int c1=start_index,c2,c7,c8;

	for(int i=0;i<signature_size;i++){
		if (updated_signature.at(i)==0)
			continue;
		if (count_segments > 11)
			return 0;
		
		length=0;
		
		while ((i+1+length) <= signature_size-1 && updated_signature.at(i+1+length)==0)
		{
			length++;
		}
		
		segments[count_segments]=length+2;
		count_segments++;

		if(count_segments==2)
			c2 = (i+start_index)%signature_size;

		if(count_segments==7)
			c7 = (i+start_index)%signature_size;
		
		if(count_segments==8)
			c8 = (i+start_index)%signature_size;
		
		i = i + length - 1;
	}

	if (count_segments < 12) return 0;

	double m1 = (contour.at(c1).y - contour.at(c2).y)*1.0/(contour.at(c1).x - contour.at(c2).x);
	double m2 = (contour.at(c7).y - contour.at(c8).y)*1.0/(contour.at(c7).x - contour.at(c8).x);
	if(fabs((m1 - m2)/(1 + m1*m2)) > tan(89.0*CV_PI/180))	return 0;

	if (abs(segments[0]-(a*signature_size)) > (tolerance*signature_size)) return 0;
	if (abs(segments[1]-(b*signature_size)) > (tolerance*signature_size)) return 0;
	if (abs(segments[2]-(c*signature_size)) > (tolerance*signature_size)) return 0;
	if (abs(segments[3]-(d*signature_size)) > (tolerance*signature_size)) return 0;
	if (abs(segments[4]-(c*signature_size)) > (tolerance*signature_size)) return 0;
	if (abs(segments[5]-(b*signature_size)) > (tolerance*signature_size)) return 0;
	if (abs(segments[6]-(a*signature_size)) > (tolerance*signature_size)) return 0;
	if (abs(segments[7]-(b*signature_size)) > (tolerance*signature_size)) return 0;
	if (abs(segments[8]-(c*signature_size)) > (tolerance*signature_size)) return 0;
	if (abs(segments[9]-(d*signature_size)) > (tolerance*signature_size)) return 0;
	if (abs(segments[10]-(c*signature_size)) > (tolerance*signature_size)) return 0;
	if (abs(segments[11]-(b*signature_size)) > (tolerance*signature_size)) return 0;

	return 1;
}

#endif
