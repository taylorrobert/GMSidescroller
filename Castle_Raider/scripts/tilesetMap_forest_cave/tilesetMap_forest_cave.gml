/// @arg slice
/// @arg sequence
var slice = argument0;
var sequence = argument1; //if multiple types of same tile in a row, we can vary it up

if (slice == G_9SLICE_NONE)
	return 0;

if (slice == G_9SLICE_UNKNOWN) 
	return 388;

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

//hangers and upjuts
if (slice == G_9SLICE_TOPHANGER) {
	var a = [264];
	if (sequence >= array_length_1d(a)) sequence = 0; 
	return a[sequence];
}

if (slice == G_9SLICE_BOTTOMUPJUT) {
	var a = [242];
	if (sequence >= array_length_1d(a)) sequence = 0; 
	return a[sequence];
}

//platform
if (slice == G_PLATFORM_LEFT) {
	var a = [191];
	if (sequence >= array_length_1d(a)) sequence = 0; 
	return a[sequence];
}

if (slice == G_PLATFORM_MID) {
	var a = [218, 219, 220, 221];
	if (sequence >= array_length_1d(a)) sequence = 0; 
	return a[sequence];
}

if (slice == G_PLATFORM_RIGHT) {
	var a = [198];
	if (sequence >= array_length_1d(a)) sequence = 0; 
	return a[sequence];
}

if (slice == G_PLATFORM_WALLLEFT) {
	var a = [194];
	if (sequence >= array_length_1d(a)) sequence = 0; 
	return a[sequence];
}

if (slice == G_PLATFORM_WALLRIGHT) {
	var a = [195];
	if (sequence >= array_length_1d(a)) sequence = 0; 
	return a[sequence];
}
