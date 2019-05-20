boolean [string] equipment_names()
{
	boolean [string] ret;
	string inv = visit_url("inventory.php");
	matcher item_matcher = create_matcher("class=\"ircm\">(.*?)</b>", inv);
	while(item_matcher.find())
	{
		ret[item_matcher.group(1)] = true;
	}
	return ret;
}

boolean[string] filter(boolean[string] items, string substring)
{
	boolean[string] ret;
	foreach name in items
	{
		if (contains_text(name, substring))
		{
			ret[name] = true;
		}
	}
	return ret;
}

int modifier_from(string itname, int[string] mods)
{
	int ret = 0;
	foreach modname, mod in mods
	{
		if (contains_text(itname, modname))
		{
			ret += mod;
		}
	}
	return ret;
}

// BEGIN MODIFIER(ITEM) FUNCTIONS

// Column 1

int item_from(string itname)
{
	int[string] mods;
	mods["blinking"] = 5;
	mods["auspicious"] = 10;
	mods["Inspector's"] = 15;
	mods["of the detective"] = 20;
	mods["Sherlock's"] = 25;

	return modifier_from(itname, mods);
}

int meat_from(string itname)
{
	int[string] mods;
	mods["miser's"] = 10;
	mods["greedy"] = 20;
	mods["avaricious"] = 30;
	mods["executive"] = 40;
	mods["of the businessman"] = 50;

	return modifier_from(itname, mods);
}

int ml_from(string itname)
{
	int[string] mods;
	// mods["blinking"] = 5;
	mods["manspreader"] = 10;
	mods["mansplainer's"] = 15;
	mods["of Leguizamo"] = 20;
	mods["Jim Carey's"] = 25;

	return modifier_from(itname, mods);
}

int init_from(string itname)
{
	int[string] mods;
	mods["zippy"] = 20;
	mods["lightning-fast"] = 40;
	mods["of the cheetah"] = 60;
	mods["Usain Bolt's"] = 80;
	mods["of Flo-Jo"] = 100;

	return modifier_from(itname, mods);
}

int weight_from(string itname)
{
	int[string] mods;
	mods["friendly"] = 3;
	mods["of the empath"] = 5;
	mods["Temple Grandin's"] = 7;

	return modifier_from(itname, mods);
}

int famxp_from(string itname)
{
	int[string] mods;
	mods["dog trainer's"] = 1;
	mods["lion tamer's"] = 2;

	return modifier_from(itname, mods);
}

int spelldmg_from(string itname)
{
	int[string] mods;
	// TODO, uh, spading looks a little sparse here
	mods["of the dark arts"] = 100;

	return modifier_from(itname, mods);
}

// COLUMN 2

/*
Intentionally skipping, because I don't expect them to be used
* % Experience
* Stats per fight
* DR
* DA
* % chance of critical hit
* % chance of spell critical hit
*/

int adv_from(string itname)
{
	int[string] mods;
	mods["of the early riser"] = 7;
	mods["up-at-dawn"] = 5;
	mods["prompt"] = 3;
	return modifier_from(itname, mods);
}

// COLUMN 3

int muscle_from(string itname)
{
	int[string] mods;
	mods["strapping"] = 5;
	mods["beefy"] = 10;
	mods["weightlifter's"] = 15;
	mods["of the ox"] = 20;
	mods["beefcake's"] = 25;

	int st = my_basestat($stat[muscle]);
	mods["boxer's"] = 0.1 * st;
	mods["brawny"] = 0.2 * st;
	mods["of the brute"] = 0.3 * st;

	return modifier_from(itname, mods);
}

int mysticality_from(string itname)
{
	int[string] mods;
	mods["brainy"] = 5;
	mods["thinker's"] = 10;
	mods["of wisdom"] = 15;
	mods["of the wise owl"] = 20;
	mods["wizardly"] = 25;

	int st = my_basestat($stat[mysticality]);
	mods["sage"] = 0.1 * st;
	mods["TODO_UNKNOWN"] = 0.2 * st;
	mods["Rosewater's"] = 0.3 * st;

	return modifier_from(itname, mods);
}

int moxie_from(string itname)
{
	int[string] mods;
	mods["cool"] = 5;
	mods["slick"] = 10;
	mods["smooth"] = 15;
	mods["of the cougar"] = 20;
	mods["stylish"] = 25;

	int st = my_basestat($stat[moxie]);
	mods["groovy"] = 0.1 * st;
	mods["supercool"] = 0.2 * st;
	mods["smartaleck's"] = 0.3 * st;

	return modifier_from(itname, mods);
}

// Columns 4 and 5

int colddmg_from(string itname)
{
	int[string] mods;
	mods["of chilblains"] = 25;
	mods["nippy"] = 10;
	mods["chilly"] = 5;

	mods["Jack Frost's"] = 50;
	mods["of the blizzard"] = 25;
	mods["frosty"] = 10;
	return modifier_from(itname, mods);
}

int hotdmg_from(string itname)
{
	int[string] mods;
	mods["scorching"] = 25;
	mods["sizzling"] = 10;
	mods["toasty"] = 5;

	mods["of incineration"] = 50;
	mods["of the brazier"] = 25;
	mods["flame-wreathed"] = 10;
	return modifier_from(itname, mods);
}

int sleazedmg_from(string itname)
{
	int[string] mods;
	mods["Jeselnik's"] = 25;
	mods["ribald"] = 10;
	mods["scandalous"] = 5;

	mods["of mayonnaise"] = 50;
	mods["lard-coated"] = 25;
	return modifier_from(itname, mods);
}

int spookydmg_from(string itname)
{
	int[string] mods;
	mods["horrifying"] = 25;
	mods["gravedigger's"] = 10;
	mods["frightening"] = 5;

	mods["of doom"] = 50;
	mods["of horror"] = 25;
	mods["of terror"] = 10;
	return modifier_from(itname, mods);
}

int stenchdmg_from(string itname)
{
	int[string] mods;
	mods["of the sewer"] = 25;
	mods["foul-smelling"] = 10;
	mods["nasty"] = 5;

	mods["of the overflowing toilet"] = 50;
	mods["stanky"] = 25;
	mods["smelly"] = 10;
	return modifier_from(itname, mods);
}

// COLUMN 6 (resistances)

int coldres_from(string itname)
{
	int[string] mods;
	mods["wool"] = 1;
	mods["knitted"] = 3;
	mods["double-paned"] = 5;

	return modifier_from(itname, mods);
}

int hotres_from(string itname)
{
	int[string] mods;
	mods["flame-retardant"] = 1;
	mods["fireproof"] = 3;
	mods["asbestos-lined"] = 5;

	return modifier_from(itname, mods);
}

int sleazeres_from(string itname)
{
	int[string] mods;
	mods["family-friendly"] = 1;
	mods["censurious"] = 3;
	mods["of temperance"] = 5;

	return modifier_from(itname, mods);
}

int spookyres_from(string itname)
{
	int[string] mods;
	mods["reassuring"] = 1;
	mods["of courage"] = 3;
	mods["of bravery"] = 5;

	return modifier_from(itname, mods);
}

int stenchres_from(string itname)
{
	int[string] mods;
	mods["aromatic"] = 1;
	mods["rosewater-soaked"] = 3;
	mods["perfumed"] = 5;

	return modifier_from(itname, mods);
}

// END MODIFIER(ITEM) FUNCTIONS

void print_list(boolean[string] list)
{
	foreach name in list
	{
		print(name);
	}
}

int[string] filter(string function, boolean[string] itnames)
{
	int[string] ret;
	foreach itname in itnames
	{
		int mod = call int function(itname);
		if (mod > 0)
		{
			ret[itname] = mod;
		}
	}
	return ret;
}

void main(string arg)
{
	string function = "";

	string[string] function_map;

	boolean[string] default_functions;
	default_functions["item"] = true;
	default_functions["meat"] = true;
	default_functions["ml"] = true;
	default_functions["init"] = true;
	default_functions["weight"] = true;
	default_functions["famxp"] = true;
	default_functions["spell dmg"] = true;
	// column 2
	default_functions["adv"] = true;
	// column 3
	default_functions["muscle"] = true;
	default_functions["mysticality"] = true;
	default_functions["moxie"] = true;
	// column 4-5
	default_functions["cold dmg"] = true;
	default_functions["hot dmg"] = true;
	default_functions["sleaze dmg"] = true;
	default_functions["spooky dmg"] = true;
	default_functions["stench dmg"] = true;
	// column 6
	default_functions["cold res"] = true;
	default_functions["hot res"] = true;
	default_functions["sleaze res"] = true;
	default_functions["spooky res"] = true;
	default_functions["stench res"] = true;

	if (arg == "help")
	{
		print_html("<b>Usage: </b> tcrs-equipment modifier, where modifier is one of");
		foreach key in default_functions
		{
			print(key);
		}
		return;
	}

	if (function_map contains arg)
	{
		function = function_map[arg];
	} else {
		string maybe_function = replace_string(arg, " ", "");
		maybe_function = replace_string(maybe_function, "damage", "dmg");
		maybe_function = replace_string(maybe_function, "resistance", "res");
		maybe_function = replace_string(maybe_function, "adventures", "adv");
		maybe_function += "_from";
		int ret = -1;
		try {
			ret = call int maybe_function("");
		} finally
		{
			if (ret == -1)
			{
				abort("I don't know what you're asking for");
			}
			function = maybe_function;
			
		}
	}

	boolean[string] itnames = equipment_names();
	int[string] filtered = filter(function, itnames);
	sort filtered by value;
	foreach name, mod in filtered
	{
		print(mod + " | " + name);
	}
}
