script "tcrs-equipment.ash"
notify Jeparo;
since r19208; // Whatever

boolean [string] equipment_names(string equipment_section)
{
	boolean [string] ret;
	matcher item_matcher = create_matcher("class=\"ircm\">(.*?)</b>", equipment_section);
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
	mods["inspector's"] = 15;
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

int all_from(string itname)
{
	return 1;
}

// END MODIFIER(ITEM) FUNCTIONS

void print_list(boolean[string] list)
{
	foreach name in list
	{
		print(name);
	}
}

int[string] filter(int[string] functions, boolean[string] itnames)
{
	int[string] ret;
	foreach itname in itnames
	{
		foreach fn, weight in functions
		{
			int mod = call int fn(itname);
			if (mod > 0)
			{
				if (!(ret contains itname)) {
					ret[itname] = 0;
				}
				ret[itname] += mod * weight;
			}
		}
	}
	return ret;
}

string canonicalize_item(string itname)
{
	string[int] all_mods = {
		"blinking ",
		"auspicious ",
		"inspector's ",
		" of the detective",
		"Sherlock's ",
		// Meat
		"miser's ",
		"greedy ",
		"avaricious ",
		"executive ",
		" of the businessman",
		// ML
		"??????",
		"manspreader's ",
		"mansplainer's ",
		" of Leguizamo",
		"Jim Carey's ",
		// Init
		"zippy ",
		"lightning-fast ",
		"of the cheetah ",
		"Usain Bolt's ",
		"of Flo-Jo ",
		// fam xp
		"dog trainer's ",
		"lion tamer's ",
		// spell dmg
		" of the dark arts",
		// xp
		"personal trainer's ",
		"arcane researcher's ",
		"dance instructor's ",
		// muscle xp
		"Herculean ",
		" of Tarzan",
		"Samson's ",
		// myst xp
		"Socratic ",
		"Newton's ",
		"Da Vinci's ",
		// moxie xp
		"Fonzie's ",
		" of James Dean",
		"Sinatra's ",
		// stats
		"educational ",
		"experienced ",
		" of the pedagogue",
		// DR
		"stiffened ",
		"hardened ",
		"rock-hard ",
		// DA
		"paddled ",
		"quilted ",
		"fortified ",
		"banded ",
		// adv
		"prompt ",
		"up-at-dawn ",
		" of the early riser",
		// crit
		"sharpshooter's ",
		" of Calamity Jane",
		"Annie Oakley's ",
		// spell crit
		"Chaotic ",
		" of Gandalf",
		"Lo Pan's ",
		// muscle
		"strapping ",
		"beefy ",
		"weightlifter's ",
		" of the ox",
		"beefcake's ",
		// myst
		"brainy ",
		"thinker's ",
		" of wisdom",
		" of the wise owl",
		"wizardly ",
		" of the cougar",
		"stylish ",
		// %mus
		"boxer's ",
		"brawny ",
		" of the brute",
		// myst%
		"sage ",
		"????????",
		"Rosewater's ",
		// moxie%
		"groovy ",
		"supercool ",
		"smartaleck's ",
		// moxie
		"cool ",
		"slick ",
		"smooth ",
		// cold dmg
		"chilly ",
		"nippy ",
		" of chilblains",
		"toasty ",
		"sizzling ",
		"scorching ",
		"scandalous ",
		"ribald ",
		"Jeselnik's ",
		"frightening ",
		"gravedigger's ",
		"horrifying ",
		"nasty ",
		"foul-smelling ",
		" of the sewer",
		// spell elemental dmg
		"frosty ",
		" of the blizzard",
		"Jack Frost's ",
		"flame-wreathed ",
		" of the brazier",
		" of incineration",
		"??????",
		"lard-coated ",
		" of mayonnaise",
		" of terror",
		" of horror",
		" of doom",
		"smelly ",
		"stanky ",
		" of the overflowing toilet",
		// ele res
		"wool ",
		"knitted ",
		"double-paned ",
		"flame-retardant ",
		"fireproof ",
		"asbestos-lined ",
		"family-friendly ",
		"censurious ",
		" of temperance",
		"reassuring ",
		" of courage",
		" of bravery",
		"aromatic ",
		"rosewater-soaked ",
		"perfumed ",

		// fam weight
		"friendly ",
		" of the empath",
		"Temple Grandin's ",

		// -ML
		"careful ",
		" of the scaredy-cat",
		"coward's ",
		" of extreme caution",

		// weapon damage
		"razor-sharp ",
		"grievous ",
		"extremely unsafe ",

		// random stuff as I find it. Mostly MP stuff.
		"Oprah's ",
		"MacGyver's",
		"healthy",
		"Tesla ",
		"wholesome ",
		"rosy-cheeked ",
		"resourceful ",
		"supercharged ",
		"clever ",
		"studded ",
		"savvy ",
		"medical-grade ",
		"crafty ",
		"deadly ",
		"sinister ",

		// cosmetic
		"blinking",
		"blue ",
		"blurry ",
		"bouncing ",
		"cyan ",
		"fuchsia ",
		"ghostly ",
		"gray ",
		"huge ",
		"jittery ",
		"lime green ",
		"maroon ",
		"narrow ",
		"olive ",
		"pulsating ",
		"purple ",
		"red ",
		"shaking ",
		"skewed ",
		"spinning ",
		"squat ",
		"teal ",
		"tumbling ",
		"twirling ",
		"upside-down ",
		"wobbly ",
		"yellow ",
	};
	foreach _, mod in all_mods {
		itname = replace_string(itname, mod, "");
	}
	item it = to_item(itname);
	if (it == $item[none])
	{
		itname += " (unrecognized)";
	}
	return itname;
}

string parse_fn(string[string] function_map, string arg)
{
	if (function_map contains arg)
	{
		return function_map[arg];
	} else {
		string maybe_function = replace_string(arg, " ", "");

		matcher digit_stripper = create_matcher("[\\d]+", maybe_function);
		if(digit_stripper.find())
		{
			maybe_function = maybe_function.replace_string(digit_stripper.group(0), "");
		}

		maybe_function = replace_string(maybe_function, "damage", "dmg");
		maybe_function = replace_string(maybe_function, "resistance", "res");
		maybe_function = replace_string(maybe_function, "adventures", "adv");
		maybe_function += "_from";
		int ret = -12512;
		if (maybe_function == "all_from") return "all_from";
		try {
			ret = call int maybe_function("asdf");
		} finally
		{
			if (ret == -12512)
			{
				abort("I don't know what you're asking for by '" + arg + "', have you tried 'tcrs-equipment help'?");
			}
		}
		return maybe_function;
	}
}

int parse_weight(string arg)
{
	matcher digit_matcher = create_matcher("[\\d]+", arg);
	while(digit_matcher.find())
	{
		return to_int(digit_matcher.group(0));
	}
	return 1;
}

void main(string arguments)
{
	arguments = arguments.to_lower_case();
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
	default_functions["all"] = true;

	if (arguments.contains_text("help") || arguments == "")
	{
		print_html("<b>Usage: </b>");
		print_html("tcrs-equipment modifier1,modifier2,modifier3");
		print_html("or tcrs-equipment maximize modifier1,modifier2,modifier3");
		print_html("where modifiers can be any of");
		foreach key in default_functions
		{
			print(key);
		}
		return;
	}

	boolean maximize = false;
	if (arguments.contains_text("maximize"))
	{
		arguments = arguments.replace_string("maximize", "");
		maximize = true;
	}

	int[string] functions;
	foreach _, arg in arguments.split_string(",")
	{
		string fn = parse_fn(function_map, arg);
		int weight = parse_weight(arg);
		functions[fn] = weight;
	}

	foreach a, b in functions {
		print_html("<i>"+a + " with weight: " + b+"</i>");
	}

	string inv = visit_url("inventory.php?which=2");

	string[] sections = { "Hats", "Back", "Shirts", "Weapons", "Off-Hand", "Pants", "Accessories", "Familiar"};
	string inventory_section(string heading, string heading2)
	{
		matcher section_matcher = create_matcher("<a name="+heading+">.*?<a name="+heading2, inv);
		// grab __ until we see a good ol' closing brace
		while(section_matcher.find())
		{
			return section_matcher.group(0);
		}
		return "";
	}
	foreach i, heading in sections {
		if (heading == "Familiar") continue;
		string inv_section = inventory_section(heading, sections[i+1]);
		boolean[string] itnames = equipment_names(inv_section);
		int[string] filtered = filter(functions, itnames);
		sort filtered by -value;
		if (count(filtered) > 0)
		{
			print_html("<b>"+heading+"</b>");
			int shouldEquip = maximize ? 1 : 0;
			if(heading == "Accessories" && maximize) { shouldEquip = 3; }
			foreach name, mod in filtered
			{
				print(mod + " | " + name);
				if (shouldEquip > 0)
				{
					item it = to_item(canonicalize_item(name));
					if(it == $item[none]) {
						print("Couldn't figure out how to equip a " + name + " (unknown item: " + canonicalize_item(name) + "), skipping...");
						continue;
					}
					if(equipped_amount(it) > 0) {
						continue;
					}
					slot sl = to_slot(it);
					if (weapon_hands(it) == 2)
					{
						print("We don't handle two-handed weapons but you might want to equip a " + it +", sorry.", "red");
						continue;
					}
					if (sl == $slot[acc1])
					{
						if (shouldEquip == 2) sl = $slot[acc2];
						if (shouldEquip == 1) sl = $slot[acc3];
					}
					equip(sl, to_item(canonicalize_item(name)));
					shouldEquip--;
				}
			}
		}
	}
}
