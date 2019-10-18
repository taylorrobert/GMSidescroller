/// @arg slice
/// @arg sequence
var slice = argument0;
var sequence = argument1; //if multiple types of same tile in a row, we can vary it up




if (slice == G_9SLICE_TOPLEFT) {
	var a = [105];
	if (sequence >= array_length_1d(a)) sequence = 0; 
	return a[sequence];
}
if (slice == G_9SLICE_TOPMID) {
	var a = [106];
	if (sequence >= array_length_1d(a)) sequence = 0; 
	return a[sequence];
}
if (slice == G_9SLICE_TOPRIGHT) {
	var a = [107];
	if (sequence >= array_length_1d(a)) sequence = 0; 
	return a[sequence];
}

if (slice == G_9SLICE_MIDLEFT) {	
	var a = [130];
	if (sequence >= array_length_1d(a)) sequence = 0; 
	return a[sequence];
}
if (slice == G_9SLICE_CENTER) {
	var a = [131];
	if (sequence >= array_length_1d(a)) sequence = 0; 
	return a[sequence];
}
if (slice == G_9SLICE_MIDRIGHT) {
	var a = [132];
	if (sequence >= array_length_1d(a)) sequence = 0; 
	return a[sequence];
}

if (slice == G_9SLICE_BOTTOMLEFT) {
	var a = [155];
	if (sequence >= array_length_1d(a)) sequence = 0; 
	return a[sequence];
}
if (slice == G_9SLICE_BOTTOMMID) {
	var a = [156];
	if (sequence >= array_length_1d(a)) sequence = 0; 
	return a[sequence];
}
if (slice == G_9SLICE_BOTTOMRIGHT) {
	var a = [157];
	if (sequence >= array_length_1d(a)) sequence = 0; 
	return a[sequence];
}

//Inside
if (slice == G_9SLICE_INSIDE_BOTTOMRIGHT) {
	var a = [165];
	if (sequence >= array_length_1d(a)) sequence = 0; 
	return a[sequence];
}

if (slice == G_9SLICE_INSIDE_BOTTOMLEFT) {
	var a = [163];
	if (sequence >= array_length_1d(a)) sequence = 0; 
	return a[sequence];
}

if (slice == G_9SLICE_INSIDE_TOPRIGHT) {
	var a = [115];
	if (sequence >= array_length_1d(a)) sequence = 0; 
	return a[sequence];
}

if (slice == G_9SLICE_INSIDE_TOPLEFT) {
	var a = [113];
	if (sequence >= array_length_1d(a)) sequence = 0; 
	return a[sequence];
}
