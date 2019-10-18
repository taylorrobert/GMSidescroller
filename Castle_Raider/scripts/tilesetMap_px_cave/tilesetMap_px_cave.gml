/// @arg slice
/// @arg sequence
var slice = argument0;
var sequence = argument1; //if multiple types of same tile in a row, we can vary it up




if (slice == G_9SLICE_TOPLEFT) {
	var a = [729];
	if (sequence >= array_length_1d(a)) sequence = 0; 
	return a[sequence];
}
if (slice == G_9SLICE_TOPMID) {
	var a = [1486, 1487, 1489, 1491, 1493, 1494, 1496, 1497, 1499, 1500];
	if (sequence >= array_length_1d(a)) sequence = 0; 
	return a[sequence];
}
if (slice == G_9SLICE_TOPRIGHT) {
	var a = [721];
	if (sequence >= array_length_1d(a)) sequence = 0; 
	return a[sequence];
}

if (slice == G_9SLICE_MIDLEFT) {	
	var a = [1181, 1178]; //maybe also 1175	
	if (sequence >= array_length_1d(a)) sequence = 0; 
	return a[sequence];
}
if (slice == G_9SLICE_CENTER) {
	var a = [130];
	if (sequence >= array_length_1d(a)) sequence = 0; 
	return a[sequence];
}
if (slice == G_9SLICE_MIDRIGHT) {
	var a = [1295, 1359];
	if (sequence >= array_length_1d(a)) sequence = 0; 
	return a[sequence];
}

if (slice == G_9SLICE_BOTTOMLEFT) {
	var a = [482];
	if (sequence >= array_length_1d(a)) sequence = 0; 
	return a[sequence];
}
if (slice == G_9SLICE_BOTTOMMID) {
	var a = [467, 468, 472, 474, 475];
	if (sequence >= array_length_1d(a)) sequence = 0; 
	return a[sequence];
}
if (slice == G_9SLICE_BOTTOMRIGHT) {
	var a = [456];
	if (sequence >= array_length_1d(a)) sequence = 0; 
	return a[sequence];
}
