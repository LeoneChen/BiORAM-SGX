// common variables.
var chrID    = "22";
var nation_1 = "GWD";
var nation_2 = "JPT";
var dirname_1 = "chr" + chrID + "_" + nation_1;
var dirname_2 = "chr" + chrID + "_" + nation_2;


var iteration      = 100;
var regularization = 1;    // 0: no regularization, 1: regularization.
var pos_list = "16053340,16053350,16053387,16053431,16053444,16053458,16053485,16053488,16053513,16053515,16053561,16053565,16053659,16053679,16053725,16053730,16053767,16053770,16053782,16053791,16053812,16053814,16053819,16053824,16053843,16053862,16053863,16053903,16053945,16053951,16053979,16054030,16054052,16054070,16054071,16054072,16054076,16054112,16054138,16054199,16054214,16054237,16054241,16054248,16054256,16054311,16054329,16054340,16054349,16054396,16054399,16054424,16054454,16054460,16054579,16054581,16054601,16054603,16054646,16054671,16054713,16054714,16054719,16054721,16054739,16054740,16054751,16054756,16054785,16054839,16054848,16054869,16054882,16054888,16054889,16054894,16054918,16054920,16054925,16054954,16054957,16054960,16054979,16055054,16055070,16055098,16055105,16055121,16055122,16055127,16055134,16055157,16055171,16055172,16055207,16055230,16055240,16055256,16055257,16055268";
var theta = BiORAM.ML.LogisticRegression(chrID, nation_1, dirname_1, nation_2, dirname_2, pos_list, iteration, regularization);

var reduced = 50;
pos_list = pos_list.SortListFromTheta(theta, reduced);

var n_component = 2;

var GWD_data = BiORAM.ML.PCA(chrID, nation_1, dirname_1, pos_list, n_component);
var GWD_filename = "./client_data/chr" + chrID + "_GWD.data";
BiORAM.fwrite_2Dlist(GWD_filename, GWD_data);

var JPT_data = BiORAM.ML.PCA(chrID, nation_2, dirname_2, pos_list, n_component);
var JPT_filename = "./client_data/chr" + chrID + "_JPT.data";
BiORAM.fwrite_2Dlist(JPT_filename, JPT_data);