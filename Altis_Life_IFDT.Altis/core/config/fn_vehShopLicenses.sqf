/*
	File: fn_vehShopLicenses.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Checks what shop it is and sometimes the vehicle to determine whether or not they have the license.
	
	Returns:
	TRUE if they have the license or are allowed to get that specific vehicle without having that license.
	FALSE if they don't have the license or are not allowed to obtain that vehicle.
*/
private["_veh","_ret"];
_veh = _this select 0;
_ret = false;

if(_veh == "B_Quadbike_01_F") exitWith {true}; //ATV's don't need to require a license anymore.

switch (life_veh_shop select 0) do
{
	case "adm_veh": {_ret = true;};
	case "civ_car": {_ret = license_civ_driver;};
	case "civ_ship": {_ret = license_civ_boat;};
	case "civ_air": {_ret = license_civ_air;};
	case "cop_air": {_ret = license_cop_air;};
	case "donator_car": {_ret = true;};
	case "donator_air": {_ret = true;};
	case "civ_truck":	{_ret = license_civ_truck;};
	case "civ_servt": {_ret = license_civ_driver;};
	case "reb_v": {_ret = true;};
	case "reb_a": {_ret = true;};
	case "reb_b": {_ret = true;};
	case "cop_car": {_ret = true;};
	case "cop_air": {_ret = true;};
	case "fed_car": {_ret = true;};
	case "fed_air": {_ret = true;};
	case "medic_air": {_ret = true;};
	case "medic_car": {_ret = true;};
	case "medic_vehicle": {_ret = true;};
	case "kart_shop": {_ret = license_civ_driver;};
 	case "med_air_hs": {_ret = license_med_air;};
	case "cop_ship": 
	{
		if(_veh == "B_Boat_Armed_01_minigun_F") then
		{
			_ret = license_cop_cg;
		}
			else
		{
			_ret = true;
		};
	};
};

_ret;