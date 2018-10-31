#include <vector>
#include <string>
#include <cstdlib>
#include <bitset>
#include <sstream>
#include <iostream>
#include <time.h>
#include <math.h>
using namespace std;

void replace_line(int line_num, string line, string filename);
void gen_mon_vec(vector<string> * monvec);

int main(void) {
	vector<string> monvec;


	srand(time(NULL));
	stringstream tmp;

/*************************************/
/* Randomize the wild pokemon        */
/*************************************/
	tmp.str("");
	gen_mon_vec(&monvec);
	cout << "RANDOMIZING WILD POKEMON\n";
	string x = "XXXXXXXX", mon1, mon2, strtmp;
	//initialize by replacing a random pokemon with XXXXXXXX
	int mon_num = rand()%monvec.size();
	mon1 = monvec[mon_num];
	monvec.erase(monvec.begin() + mon_num);
	mon2 = x;
	tmp << "find data/wildPokemon/ -type f -exec sed -i -e \'s/"
		<< mon1 << "/" << mon2 << "/g\' {} \\;";
//	cout << tmp.str() << endl;
	system(tmp.str().c_str());
	mon2 = mon1;

	while(!monvec.empty()){
		tmp.str("");
		// command to replace mon 1 with mon 2
		mon_num = rand()%monvec.size();
		mon1 = monvec[mon_num];
		tmp << "find data/wildPokemon/ -type f -exec sed -i -e \'s/"
			<< mon1 << "/" << mon2 << "/g\' {} \\;";
//		cout << tmp.str() << endl;
		system(tmp.str().c_str());
		mon2 = monvec[mon_num];
		monvec.erase(monvec.begin() + mon_num);
	}
	tmp.str("");
	mon1 = x;
//	mon2 = monvec[0]; // the only one left
	tmp << "find data/wildPokemon/ -type f -exec sed -i -e \'s/"
		<< mon1 << "/" << mon2 << "/g\' {} \\;";
//	cout << tmp.str() << endl;
	system(tmp.str().c_str());

/*************************************/
/* Randomize the trainer pokemon     */
/*************************************/
	cout << "RANDOMIZING TRAINER POKEMON\n";
	monvec.clear();
	gen_mon_vec(&monvec);
	tmp.str("");
	//x = "XXXXXXXX", mon1, mon2, strtmp;
	//initialize by replacing a random pokemon with XXXXXXXX
	mon_num = rand()%monvec.size();
	mon1 = monvec[mon_num];
	monvec.erase(monvec.begin() + mon_num);
	mon2 = x;
	tmp << "sed -i -e \'s/"
		<< mon1 << "/" << mon2 << "/g\' data/trainer_parties.asm";
//	cout << tmp.str() << endl;
	system(tmp.str().c_str());
	mon2 = mon1;

	while(!monvec.empty()){
		tmp.str("");
		// command to replace mon 1 with mon 2
		mon_num = rand()%monvec.size();
		mon1 = monvec[mon_num];
		tmp << "sed -i -e \'s/"
			<< mon1 << "/" << mon2 << "/g\' data/trainer_parties.asm";
//		cout << tmp.str() << endl;
		system(tmp.str().c_str());
		mon2 = monvec[mon_num];
		monvec.erase(monvec.begin() + mon_num);
	}
	tmp.str("");
	mon1 = x;
//	mon2 = monvec[0]; // the only one left
	tmp << "sed -i -e \'s/"
		<< mon1 << "/" << mon2 << "/g\' data/trainer_parties.asm";
//	cout << tmp.str() << endl;
	system(tmp.str().c_str());


/*************************************/
/* Randomize the trades              */
/*************************************/
	cout << "RANDOMIZING TRADES\n";
	monvec.clear();
	gen_mon_vec(&monvec);
	tmp.str("");
	//x = "XXXXXXXX", mon1, mon2, strtmp;
	//initialize by replacing a random pokemon with XXXXXXXX
	mon_num = rand()%monvec.size();
	mon1 = monvec[mon_num];
	monvec.erase(monvec.begin() + mon_num);
	mon2 = x;
	tmp << "sed -i -e \'s/"
		<< mon1 << "/" << mon2 << "/g\' data/trades.asm";
//	cout << tmp.str() << endl;
	system(tmp.str().c_str());
	mon2 = mon1;

	while(!monvec.empty()){
		tmp.str("");
		// command to replace mon 1 with mon 2
		mon_num = rand()%monvec.size();
		mon1 = monvec[mon_num];
		tmp << "sed -i -e \'s/"
			<< mon1 << "/" << mon2 << "/g\' data/trades.asm";
//		cout << tmp.str() << endl;
		system(tmp.str().c_str());
		mon2 = monvec[mon_num];
		monvec.erase(monvec.begin() + mon_num);
	}
	tmp.str("");
	mon1 = x;
//	mon2 = monvec[0]; // the only one left
	tmp << "sed -i -e \'s/"
		<< mon1 << "/" << mon2 << "/g\' data/trades.asm";
//	cout << tmp.str() << endl;
	system(tmp.str().c_str());

/*************************************/
/* Randomize rods                    */
/*************************************/
	cout << "RANDOMIZING OLD ROD\n";
	monvec.clear();
	gen_mon_vec(&monvec);
	tmp.str("");
	mon_num = rand()%monvec.size();
	mon1 = monvec[mon_num];
	tmp << "sed -i -e \'s/MAGIKARP" << "/" << mon1 << "/g\' engine/items/items.asm";
//	cout << tmp.str() << endl;
	system(tmp.str().c_str());
	monvec.erase(monvec.begin()+mon_num);
	cout << "RANDOMIZING GOOD ROD\n";
	mon_num = rand()%monvec.size();
	mon1 = monvec[mon_num];
	tmp.str("");
	tmp << "sed -i -e \'s/GOLDEEN" << "/" << mon1 << "/g\' data/good_rod.asm";
//	cout << tmp.str() << endl;
	system(tmp.str().c_str());
	mon_num = rand()%monvec.size();
	mon1 = monvec[mon_num];
	tmp.str("");
	tmp << "sed -i -e \'s/POLIWAG" << "/" << mon1 << "/g\' data/good_rod.asm";
//	cout << tmp.str() << endl;
	system(tmp.str().c_str());
	cout << "RANDOMIZING SUPER ROD\n";
	monvec.clear();
	gen_mon_vec(&monvec);
	tmp.str("");
	//x = "XXXXXXXX", mon1, mon2, strtmp;
	//initialize by replacing a random pokemon with XXXXXXXX
	mon_num = rand()%monvec.size();
	mon1 = monvec[mon_num];
	monvec.erase(monvec.begin() + mon_num);
	mon2 = x;
	tmp << "sed -i -e \'s/"
		<< mon1 << "/" << mon2 << "/g\' data/super_rod.asm";
//	cout << tmp.str() << endl;
	system(tmp.str().c_str());
	mon2 = mon1;

	while(!monvec.empty()){
		tmp.str("");
		// command to replace mon 1 with mon 2
		mon_num = rand()%monvec.size();
		mon1 = monvec[mon_num];
		tmp << "sed -i -e \'s/"
			<< mon1 << "/" << mon2 << "/g\' data/super_rod.asm";
//		cout << tmp.str() << endl;
		system(tmp.str().c_str());
		mon2 = monvec[mon_num];
		monvec.erase(monvec.begin() + mon_num);
	}
	tmp.str("");
	mon1 = x;
//	mon2 = monvec[0]; // the only one left
	tmp << "sed -i -e \'s/"
		<< mon1 << "/" << mon2 << "/g\' data/super_rod.asm";
//	cout << tmp.str() << endl;
	system(tmp.str().c_str());



/*************************************/
/* Randomize the starter pokemon     */
/*************************************/
	cout << "RANDOMIZING STARTER POKEMON\n";
	monvec.clear();
	gen_mon_vec(&monvec);
	int s1, s2, s3;
	s1 = rand()%monvec.size();
	s2 = rand()%monvec.size();

	while(s2 == s1) {
		s2 = rand()%monvec.size();
	}

	s3 = rand()%monvec.size();
	while(s3 == s1 || s3 == s2) {
		s3 = rand()%monvec.size();
	}
	int itmp = pow(2,s1%8);

	bitset<8> starter1((char)pow(2,s1%8));
	bitset<8> starter2((char)pow(2,s2%8));
	bitset<8> starter3((char)pow(2,s3%8));

	//Starter 1

	//replace the mon constant
	tmp.str(""); // clear the string
	tmp << "STARTER1 EQU " << monvec[s1];
	replace_line(1, tmp.str(), "constants/starter_mons.asm");

	//update the pokedex for the oakslabscript
	tmp.str(""); // clear the stringstream
	tmp << "ld a, [wPokedexOwned + " << s1/8 << "] ; " << monvec[s1] << "("<<s1<<")";
	replace_line(5, tmp.str(), "engine/predefs17.asm");

	tmp.str(""); // clear the stringstream
	tmp << "or %" << starter1;
	replace_line(6, tmp.str(), "engine/predefs17.asm");

	tmp.str("");
	tmp << "ld [wPokedexOwned + " << (s1+1)/8 << "], a ; " << monvec[s1] << "("<<s1<<")";
	replace_line(7, tmp.str(), "engine/predefs17.asm");

	tmp.str("");
	tmp << "cont \"" << monvec[s1] << "?\"";
	replace_line(31, tmp.str(), "text/maps/oaks_lab.asm");
	//	text/maps/oaks_lab.asm:31:

	//Starter 2

	//replace the mon constant
	tmp.str(""); // clear the string
	tmp << "STARTER2 EQU " << monvec[s2];
	replace_line(2, tmp.str(), "constants/starter_mons.asm");

	//update the pokedex for the oakslabscript
	tmp.str(""); // clear the stringstream
	tmp << "ld a, [wPokedexOwned + " << s2/8 << "] ; " << monvec[s2] << "("<<s2<<")";
	replace_line(9, tmp.str(), "engine/predefs17.asm");

	tmp.str(""); // clear the stringstream
	tmp << "or %" << starter2;
	replace_line(10, tmp.str(), "engine/predefs17.asm");

	tmp.str("");
	tmp << "ld [wPokedexOwned + " << (s2+1)/8 << "], a ; " << monvec[s2] << "("<<s2<<")";
	replace_line(11, tmp.str(), "engine/predefs17.asm");

	tmp.str("");
	tmp << "cont \"" << monvec[s2] << "?\"";
	replace_line(37, tmp.str(), "text/maps/oaks_lab.asm");


	//Starter 3

	//replace the mon constant
	tmp.str(""); // clear the string
	tmp << "STARTER3 EQU " << monvec[s3];
	replace_line(3, tmp.str(), "constants/starter_mons.asm");

	//update the pokedex for the oakslabscript
	tmp.str(""); // clear the stringstream
	tmp << "ld a, [wPokedexOwned + " << s3/8 << "] ; " << monvec[s3] << "("<<s3<<")";
	replace_line(14, tmp.str(), "engine/predefs17.asm");

	tmp.str(""); // clear the stringstream
	tmp << "or %" << starter3;
	replace_line(15, tmp.str(), "engine/predefs17.asm");

	tmp.str("");
	tmp << "ld [wPokedexOwned + " << (s3+1)/8 << "], a ; " << monvec[s3] << "("<<s3<<")";
	replace_line(16, tmp.str(), "engine/predefs17.asm");
	tmp.str("");
	tmp << "cont \"" << monvec[s3] << "?\"";
	replace_line(43, tmp.str(), "text/maps/oaks_lab.asm");

	return 0;
}



void replace_line(int line_num, string line, string filename){
	stringstream tmp;
	tmp << "sed -i \'" << line_num << "d\' " << filename;
//	cout << tmp.str() << endl;
	system(tmp.str().c_str());

	tmp.str("");
	tmp << "sed -i \'" << line_num << "i " << line << "\' " << filename;//constants/starter_mons.asm";
//	cout << tmp.str() << endl;
	system(tmp.str().c_str());

return;
}

void gen_mon_vec (vector<string> * monvec){

	//	monvec->push_back("RHYDON")"); //  // $01
		monvec->push_back("BULBASAUR"); //1
		monvec->push_back("IVYSAUR"); //2
		monvec->push_back("VENUSAUR"); //3
		monvec->push_back("CHARMANDER"); //4
		monvec->push_back("CHARMELEON"); //5
		monvec->push_back("CHARIZARD"); //6
		monvec->push_back("SQUIRTLE"); //7
		monvec->push_back("WARTORTLE"); //8
		monvec->push_back("BLASTOISE"); //9
		monvec->push_back("CATERPIE"); //10
		monvec->push_back("METAPOD"); //11
		monvec->push_back("BUTTERFREE"); //12
		monvec->push_back("WEEDLE"); //13
		monvec->push_back("KAKUNA"); //14
		monvec->push_back("BEEDRILL"); //15
		monvec->push_back("PIDGEY"); //16
		monvec->push_back("PIDGEOTTO"); //17
		monvec->push_back("PIDGEOT "); //18
		monvec->push_back("RATTATA"); //19
		monvec->push_back("RATICATE"); //20
		monvec->push_back("SPEAROW"); //21
		monvec->push_back("FEAROW"); //22
		monvec->push_back("EKANS"); //23
		monvec->push_back("ARBOK"); //24
		monvec->push_back("PIKACHU"); //25
		monvec->push_back("RAICHU"); //26
		monvec->push_back("SANDSHREW"); //27
		monvec->push_back("SANDSLASH"); //28
		monvec->push_back("NIDORAN_F"); //29
		monvec->push_back("NIDORINA"); //30
		monvec->push_back("NIDOQUEEN"); //31
		monvec->push_back("NIDORAN_M"); //32
		monvec->push_back("NIDORINO"); //33
		monvec->push_back("NIDOKING"); //34
		monvec->push_back("CLEFAIRY"); //35
		monvec->push_back("CLEFABLE"); //36
		monvec->push_back("VULPIX"); //37
		monvec->push_back("NINETALES"); //38
		monvec->push_back("JIGGLYPUFF"); //39
		monvec->push_back("WIGGLYTUFF"); //40
		monvec->push_back("ZUBAT"); //41
		monvec->push_back("GOLBAT"); //42
		monvec->push_back("ODDISH"); //43
		monvec->push_back("GLOOM"); //44
		monvec->push_back("VILEPLUME"); //45
		monvec->push_back("PARAS "); //46
		monvec->push_back("PARASECT"); //47
		monvec->push_back("VENONAT"); //48
		monvec->push_back("VENOMOTH"); //49
		monvec->push_back("DIGLETT"); //50
		monvec->push_back("DUGTRIO"); //51
		monvec->push_back("MEOWTH"); //52
		monvec->push_back("PERSIAN"); //53
		monvec->push_back("PSYDUCK"); //54
		monvec->push_back("GOLDUCK"); //55
		monvec->push_back("MANKEY"); //56
		monvec->push_back("PRIMEAPE"); //57
		monvec->push_back("GROWLITHE"); //58
		monvec->push_back("ARCANINE"); //59
		monvec->push_back("POLIWAG"); //60
		monvec->push_back("POLIWHIRL"); //61
		monvec->push_back("POLIWRATH"); //62
		monvec->push_back(" ABRA"); //63
		monvec->push_back("KADABRA"); //64
		monvec->push_back("ALAKAZAM"); //65
		monvec->push_back("MACHOP"); //66
		monvec->push_back("MACHOKE"); //67
		monvec->push_back("MACHAMP"); //68
		monvec->push_back("BELLSPROUT"); //69
		monvec->push_back("WEEPINBELL"); //70
		monvec->push_back("VICTREEBEL"); //71
		monvec->push_back("TENTACOOL"); //72
		monvec->push_back("TENTACRUEL"); //73
		monvec->push_back("GEODUDE"); //74
		monvec->push_back("GRAVELER"); //75
		monvec->push_back("GOLEM"); //76
		monvec->push_back("PONYTA"); //77
		monvec->push_back("RAPIDASH"); //78
		monvec->push_back("SLOWPOKE"); //79
		monvec->push_back("SLOWBRO"); //80
		monvec->push_back("MAGNEMITE"); //81
		monvec->push_back("MAGNETON"); //82
		monvec->push_back("FARFETCHD"); //83
		monvec->push_back("DODUO"); //84
		monvec->push_back("DODRIO"); //85
		monvec->push_back("SEEL"); //86
		monvec->push_back("DEWGONG"); //87
		monvec->push_back("GRIMER"); //88
		monvec->push_back("MUK"); //89
		monvec->push_back("SHELLDER"); //90
		monvec->push_back("CLOYSTER"); //91
		monvec->push_back("GASTLY"); //92
		monvec->push_back("HAUNTER"); //93
		monvec->push_back("GENGAR"); //94
		monvec->push_back("ONIX"); //95
		monvec->push_back("DROWZEE"); //96
		monvec->push_back("HYPNO"); //97
		monvec->push_back("KRABBY"); //98
		monvec->push_back("KINGLER"); //99
		monvec->push_back("VOLTORB"); //100
		monvec->push_back("ELECTRODE"); //101
		monvec->push_back("EXEGGCUTE"); //102
		monvec->push_back("EXEGGUTOR"); //103
		monvec->push_back("CUBONE"); //104
		monvec->push_back("MAROWAK"); //105
		monvec->push_back("HITMONLEE"); //106
		monvec->push_back("HITMONCHAN"); //107
		monvec->push_back("LICKITUNG"); //108
		monvec->push_back("KOFFING"); //109
		monvec->push_back("WEEZING"); //110
		monvec->push_back("RHYHORN"); //111
		monvec->push_back("RHYDON"); //112
		monvec->push_back("CHANSEY"); //113
		monvec->push_back("TANGELA"); //114
		monvec->push_back("KANGASKHAN"); //115
		monvec->push_back("HORSEA"); //116
		monvec->push_back("SEADRA"); //117
		monvec->push_back("GOLDEEN"); //118
		monvec->push_back("SEAKING"); //119
		monvec->push_back("STARYU"); //120
		monvec->push_back("STARMIE"); //121
		monvec->push_back("MR_MIME"); //122
		monvec->push_back("SCYTHER"); //123
		monvec->push_back("JYNX"); //124
		monvec->push_back("ELECTABUZZ"); //125
		monvec->push_back("MAGMAR"); //126
		monvec->push_back("PINSIR"); //127
		monvec->push_back("TAUROS"); //128
		monvec->push_back("MAGIKARP"); //129
		monvec->push_back("GYARADOS"); //130
		monvec->push_back("LAPRAS"); //131
		monvec->push_back("DITTO"); //132
		monvec->push_back("EEVEE"); //133
		monvec->push_back("VAPOREON"); //134
		monvec->push_back("JOLTEON"); //135
		monvec->push_back("FLAREON"); //136
		monvec->push_back("PORYGON"); //137
		monvec->push_back("OMANYTE"); //138
		monvec->push_back("OMASTAR"); //139
		monvec->push_back("KABUTO "); //140
		monvec->push_back("KABUTOPS"); //141
		monvec->push_back("AERODACTYL"); //142
		monvec->push_back("SNORLAX"); //143
		monvec->push_back("ARTICUNO"); //144
		monvec->push_back("ZAPDOS"); //145
		monvec->push_back("MOLTRES"); //146
		monvec->push_back("DRATINI"); //147
		monvec->push_back("DRAGONAIR"); //148
		monvec->push_back("DRAGONITE"); //149
		monvec->push_back("MEWTWO"); //150
		monvec->push_back("MEW "); //151

}
