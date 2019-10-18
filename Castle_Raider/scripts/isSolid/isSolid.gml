/// @arg collisionTile
var tile = argument[0];

if (tile == SOLID || tile == PLATFORM) return true;
else return false;