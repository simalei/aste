//
// This file was auto-generated using the following command:
//
// jai generate.jai - -compile
//



HB_BUDGET_DEFAULT :: cast,trunc(s64) (-0x7FFFFFFFFFFFFFFF - 1);

HB_BUDGET_UNLIMITED :: cast(s64) 0x7FFFFFFFFFFFFFFF;

HB_CODEPOINT_INVALID :: cast,trunc(codepoint_t) -1;

HB_LANGUAGE_INVALID :: cast(language_t) 0;

HB_FEATURE_GLOBAL_START :: 0;

HB_UNICODE_MAX :: 0x10FFFF;

HB_SET_VALUE_INVALID :: HB_CODEPOINT_INVALID;

HB_MAP_VALUE_INVALID :: HB_CODEPOINT_INVALID;

HB_FONT_NO_VAR_NAMED_INSTANCE :: 0xFFFFFFFF;

HB_BUFFER_REPLACEMENT_CODEPOINT_DEFAULT :: 0xFFFD;

HB_UNICODE_COMBINING_CLASS_CCC133 :: 133;

HB_UNICODE_MAX_DECOMPOSITION_LEN :: 18+1;

HB_VERSION_MAJOR :: 15;

HB_VERSION_MINOR :: 1;

HB_VERSION_MICRO :: 0;

HB_VERSION_STRING :: "15.1.0";

/**
* hb_bool_t:
*
* Data type for booleans.
*
**/
bool_t :: s32;

/**
* hb_codepoint_t:
*
* Data type for holding Unicode codepoints. Also
* used to hold glyph IDs.
*
**/
codepoint_t :: u32;

/**
* hb_position_t:
*
* Data type for holding a single coordinate value.
* Contour points and other multi-dimensional data are
* stored as tuples of #hb_position_t's.
*
**/
position_t :: s32;

/**
* hb_mask_t:
*
* Data type for bitmasks.
*
**/
mask_t :: u32;

_hb_var_int_t :: union {
    _u32: u32;
    i32:  s32;
    _u16: [2] u16;
    i16:  [2] s16;
    _u8:  [4] u8;
    i8:   [4] s8;
}

var_int_t :: _hb_var_int_t;

_hb_var_num_t :: union {
    f:    float;
    _u32: u32;
    i32:  s32;
    _u16: [2] u16;
    i16:  [2] s16;
    _u8:  [4] u8;
    i8:   [4] s8;
}

var_num_t :: _hb_var_num_t;

/**
* hb_tag_t:
*
* Data type for tag identifiers. Tags are four
* byte integers, each byte representing a character.
*
* Tags are used to identify tables, design-variation axes,
* scripts, languages, font features, and baselines with
* human-readable names.
*
**/
tag_t :: u32;

/* len=-1 means str is NUL-terminated. */
tag_from_string :: (str: *u8, len: s32) -> tag_t #foreign harfbuzz "hb_tag_from_string";

/* buf should have 4 bytes. */
tag_to_string :: (tag: tag_t, buf: *u8) -> void #foreign harfbuzz "hb_tag_to_string";

/**
* hb_direction_t:
* @HB_DIRECTION_INVALID: Initial, unset direction.
* @HB_DIRECTION_LTR: Text is set horizontally from left to right.
* @HB_DIRECTION_RTL: Text is set horizontally from right to left.
* @HB_DIRECTION_TTB: Text is set vertically from top to bottom.
* @HB_DIRECTION_BTT: Text is set vertically from bottom to top.
*
* The direction of a text segment or buffer.
*
* A segment can also be tested for horizontal or vertical
* orientation (irrespective of specific direction) with
* HB_DIRECTION_IS_HORIZONTAL() or HB_DIRECTION_IS_VERTICAL().
*
*/
direction_t :: enum s32 {
    INVALID :: 0;
    LTR     :: 4;
    RTL     :: 5;
    TTB     :: 6;
    BTT     :: 7;

    HB_DIRECTION_INVALID :: INVALID;
    HB_DIRECTION_LTR     :: LTR;
    HB_DIRECTION_RTL     :: RTL;
    HB_DIRECTION_TTB     :: TTB;
    HB_DIRECTION_BTT     :: BTT;
}

/* len=-1 means str is NUL-terminated */
direction_from_string :: (str: *u8, len: s32) -> direction_t #foreign harfbuzz "hb_direction_from_string";

direction_to_string :: (direction: direction_t) -> *u8 #foreign harfbuzz "hb_direction_to_string";

language_impl_t :: struct {}
/**
* hb_language_t:
*
* Data type for languages. Each #hb_language_t corresponds to a BCP 47
* language tag.
*
*/
language_t :: *language_impl_t;

language_from_string :: (str: *u8, len: s32) -> language_t #foreign harfbuzz "hb_language_from_string";

language_to_string :: (language: language_t) -> *u8 #foreign harfbuzz "hb_language_to_string";

language_get_default :: () -> language_t #foreign harfbuzz "hb_language_get_default";

language_matches :: (language: language_t, specific: language_t) -> bool_t #foreign harfbuzz "hb_language_matches";

/* https://docs.google.com/spreadsheets/d/1Y90M0Ie3MUJ6UVCRDOypOtijlMDLNNyyLk36T6iMu0o */
script_t :: enum s32 {
    HB_SCRIPT_COMMON                 :: 1517910393;
    HB_SCRIPT_INHERITED              :: 1516858984;
    HB_SCRIPT_UNKNOWN                :: 1517976186;

    HB_SCRIPT_ARABIC                 :: 1098015074;
    HB_SCRIPT_ARMENIAN               :: 1098018158;
    HB_SCRIPT_BENGALI                :: 1113943655;
    HB_SCRIPT_CYRILLIC               :: 1132032620;
    HB_SCRIPT_DEVANAGARI             :: 1147500129;
    HB_SCRIPT_GEORGIAN               :: 1197830002;
    HB_SCRIPT_GREEK                  :: 1198679403;
    HB_SCRIPT_GUJARATI               :: 1198877298;
    HB_SCRIPT_GURMUKHI               :: 1198879349;
    HB_SCRIPT_HANGUL                 :: 1214344807;
    HB_SCRIPT_HAN                    :: 1214344809;
    HB_SCRIPT_HEBREW                 :: 1214603890;
    HB_SCRIPT_HIRAGANA               :: 1214870113;
    HB_SCRIPT_KANNADA                :: 1265525857;
    HB_SCRIPT_KATAKANA               :: 1264676449;
    HB_SCRIPT_LAO                    :: 1281453935;
    HB_SCRIPT_LATIN                  :: 1281455214;
    HB_SCRIPT_MALAYALAM              :: 1298954605;
    HB_SCRIPT_ORIYA                  :: 1332902241;
    HB_SCRIPT_TAMIL                  :: 1415671148;
    HB_SCRIPT_TELUGU                 :: 1415933045;
    HB_SCRIPT_THAI                   :: 1416126825;

    HB_SCRIPT_TIBETAN                :: 1416192628;

    HB_SCRIPT_BOPOMOFO               :: 1114599535;
    HB_SCRIPT_BRAILLE                :: 1114792297;
    HB_SCRIPT_CANADIAN_SYLLABICS     :: 1130458739;
    HB_SCRIPT_CHEROKEE               :: 1130915186;
    HB_SCRIPT_ETHIOPIC               :: 1165256809;
    HB_SCRIPT_KHMER                  :: 1265134962;
    HB_SCRIPT_MONGOLIAN              :: 1299148391;
    HB_SCRIPT_MYANMAR                :: 1299803506;
    HB_SCRIPT_OGHAM                  :: 1332175213;
    HB_SCRIPT_RUNIC                  :: 1383427698;
    HB_SCRIPT_SINHALA                :: 1399418472;
    HB_SCRIPT_SYRIAC                 :: 1400468067;
    HB_SCRIPT_THAANA                 :: 1416126817;
    HB_SCRIPT_YI                     :: 1500080489;

    HB_SCRIPT_DESERET                :: 1148416628;
    HB_SCRIPT_GOTHIC                 :: 1198486632;
    HB_SCRIPT_OLD_ITALIC             :: 1232363884;

    HB_SCRIPT_BUHID                  :: 1114990692;
    HB_SCRIPT_HANUNOO                :: 1214344815;
    HB_SCRIPT_TAGALOG                :: 1416064103;
    HB_SCRIPT_TAGBANWA               :: 1415669602;

    HB_SCRIPT_CYPRIOT                :: 1131442804;
    HB_SCRIPT_LIMBU                  :: 1281977698;
    HB_SCRIPT_LINEAR_B               :: 1281977954;
    HB_SCRIPT_OSMANYA                :: 1332964705;
    HB_SCRIPT_SHAVIAN                :: 1399349623;
    HB_SCRIPT_TAI_LE                 :: 1415670885;
    HB_SCRIPT_UGARITIC               :: 1432838514;

    HB_SCRIPT_BUGINESE               :: 1114990441;
    HB_SCRIPT_COPTIC                 :: 1131376756;
    HB_SCRIPT_GLAGOLITIC             :: 1198285159;
    HB_SCRIPT_KHAROSHTHI             :: 1265131890;
    HB_SCRIPT_NEW_TAI_LUE            :: 1415670901;
    HB_SCRIPT_OLD_PERSIAN            :: 1483761007;
    HB_SCRIPT_SYLOTI_NAGRI           :: 1400466543;
    HB_SCRIPT_TIFINAGH               :: 1415999079;

    HB_SCRIPT_BALINESE               :: 1113681001;
    HB_SCRIPT_CUNEIFORM              :: 1483961720;
    HB_SCRIPT_NKO                    :: 1315663727;
    HB_SCRIPT_PHAGS_PA               :: 1349017959;
    HB_SCRIPT_PHOENICIAN             :: 1349021304;

    HB_SCRIPT_CARIAN                 :: 1130459753;
    HB_SCRIPT_CHAM                   :: 1130914157;
    HB_SCRIPT_KAYAH_LI               :: 1264675945;
    HB_SCRIPT_LEPCHA                 :: 1281716323;
    HB_SCRIPT_LYCIAN                 :: 1283023721;
    HB_SCRIPT_LYDIAN                 :: 1283023977;
    HB_SCRIPT_OL_CHIKI               :: 1332503403;
    HB_SCRIPT_REJANG                 :: 1382706791;
    HB_SCRIPT_SAURASHTRA             :: 1398895986;
    HB_SCRIPT_SUNDANESE              :: 1400204900;
    HB_SCRIPT_VAI                    :: 1449224553;

    HB_SCRIPT_AVESTAN                :: 1098281844;
    HB_SCRIPT_BAMUM                  :: 1113681269;
    HB_SCRIPT_EGYPTIAN_HIEROGLYPHS   :: 1164409200;
    HB_SCRIPT_IMPERIAL_ARAMAIC       :: 1098018153;
    HB_SCRIPT_INSCRIPTIONAL_PAHLAVI  :: 1349020777;
    HB_SCRIPT_INSCRIPTIONAL_PARTHIAN :: 1349678185;
    HB_SCRIPT_JAVANESE               :: 1247901281;
    HB_SCRIPT_KAITHI                 :: 1265920105;
    HB_SCRIPT_LISU                   :: 1281979253;
    HB_SCRIPT_MEETEI_MAYEK           :: 1299473769;
    HB_SCRIPT_OLD_SOUTH_ARABIAN      :: 1398895202;
    HB_SCRIPT_OLD_TURKIC             :: 1332898664;
    HB_SCRIPT_SAMARITAN              :: 1398893938;
    HB_SCRIPT_TAI_THAM               :: 1281453665;
    HB_SCRIPT_TAI_VIET               :: 1415673460;

    HB_SCRIPT_BATAK                  :: 1113683051;
    HB_SCRIPT_BRAHMI                 :: 1114792296;
    HB_SCRIPT_MANDAIC                :: 1298230884;

    HB_SCRIPT_CHAKMA                 :: 1130457965;
    HB_SCRIPT_MEROITIC_CURSIVE       :: 1298494051;
    HB_SCRIPT_MEROITIC_HIEROGLYPHS   :: 1298494063;
    HB_SCRIPT_MIAO                   :: 1349284452;
    HB_SCRIPT_SHARADA                :: 1399353956;
    HB_SCRIPT_SORA_SOMPENG           :: 1399812705;
    HB_SCRIPT_TAKRI                  :: 1415670642;

    HB_SCRIPT_BASSA_VAH              :: 1113682803;
    HB_SCRIPT_CAUCASIAN_ALBANIAN     :: 1097295970;
    HB_SCRIPT_DUPLOYAN               :: 1148547180;
    HB_SCRIPT_ELBASAN                :: 1164730977;
    HB_SCRIPT_GRANTHA                :: 1198678382;
    HB_SCRIPT_KHOJKI                 :: 1265135466;
    HB_SCRIPT_KHUDAWADI              :: 1399418468;
    HB_SCRIPT_LINEAR_A               :: 1281977953;
    HB_SCRIPT_MAHAJANI               :: 1298229354;
    HB_SCRIPT_MANICHAEAN             :: 1298230889;
    HB_SCRIPT_MENDE_KIKAKUI          :: 1298493028;
    HB_SCRIPT_MODI                   :: 1299145833;
    HB_SCRIPT_MRO                    :: 1299345263;
    HB_SCRIPT_NABATAEAN              :: 1315070324;
    HB_SCRIPT_OLD_NORTH_ARABIAN      :: 1315009122;
    HB_SCRIPT_OLD_PERMIC             :: 1348825709;
    HB_SCRIPT_PAHAWH_HMONG           :: 1215131239;
    HB_SCRIPT_PALMYRENE              :: 1348562029;
    HB_SCRIPT_PAU_CIN_HAU            :: 1348564323;
    HB_SCRIPT_PSALTER_PAHLAVI        :: 1349020784;
    HB_SCRIPT_SIDDHAM                :: 1399415908;
    HB_SCRIPT_TIRHUTA                :: 1416196712;
    HB_SCRIPT_WARANG_CITI            :: 1466004065;

    HB_SCRIPT_AHOM                   :: 1097363309;
    HB_SCRIPT_ANATOLIAN_HIEROGLYPHS  :: 1215067511;
    HB_SCRIPT_HATRAN                 :: 1214346354;
    HB_SCRIPT_MULTANI                :: 1299541108;
    HB_SCRIPT_OLD_HUNGARIAN          :: 1215655527;
    HB_SCRIPT_SIGNWRITING            :: 1399287415;

    HB_SCRIPT_ADLAM                  :: 1097100397;
    HB_SCRIPT_BHAIKSUKI              :: 1114139507;
    HB_SCRIPT_MARCHEN                :: 1298231907;
    HB_SCRIPT_OSAGE                  :: 1332963173;
    HB_SCRIPT_TANGUT                 :: 1415671399;
    HB_SCRIPT_NEWA                   :: 1315272545;

    HB_SCRIPT_MASARAM_GONDI          :: 1198485101;
    HB_SCRIPT_NUSHU                  :: 1316186229;
    HB_SCRIPT_SOYOMBO                :: 1399814511;
    HB_SCRIPT_ZANABAZAR_SQUARE       :: 1516334690;

    HB_SCRIPT_DOGRA                  :: 1148151666;
    HB_SCRIPT_GUNJALA_GONDI          :: 1198485095;
    HB_SCRIPT_HANIFI_ROHINGYA        :: 1383032935;
    HB_SCRIPT_MAKASAR                :: 1298230113;
    HB_SCRIPT_MEDEFAIDRIN            :: 1298490470;
    HB_SCRIPT_OLD_SOGDIAN            :: 1399809903;
    HB_SCRIPT_SOGDIAN                :: 1399809892;

    HB_SCRIPT_ELYMAIC                :: 1164736877;
    HB_SCRIPT_NANDINAGARI            :: 1315008100;
    HB_SCRIPT_NYIAKENG_PUACHUE_HMONG :: 1215131248;
    HB_SCRIPT_WANCHO                 :: 1466132591;

    HB_SCRIPT_CHORASMIAN             :: 1130918515;
    HB_SCRIPT_DIVES_AKURU            :: 1147756907;
    HB_SCRIPT_KHITAN_SMALL_SCRIPT    :: 1265202291;
    HB_SCRIPT_YEZIDI                 :: 1499822697;

    HB_SCRIPT_CYPRO_MINOAN           :: 1131441518;
    HB_SCRIPT_OLD_UYGHUR             :: 1333094258;
    HB_SCRIPT_TANGSA                 :: 1416524641;
    HB_SCRIPT_TOTO                   :: 1416590447;
    HB_SCRIPT_VITHKUQI               :: 1449751656;

    HB_SCRIPT_MATH                   :: 1517122664;

    HB_SCRIPT_KAWI                   :: 1264678761;
    HB_SCRIPT_NAG_MUNDARI            :: 1315006317;

    HB_SCRIPT_GARAY                  :: 1197568609;
    HB_SCRIPT_GURUNG_KHEMA           :: 1198877544;
    HB_SCRIPT_KIRAT_RAI              :: 1265787241;
    HB_SCRIPT_OL_ONAL                :: 1332633967;
    HB_SCRIPT_SUNUWAR                :: 1400204917;
    HB_SCRIPT_TODHRI                 :: 1416586354;
    HB_SCRIPT_TULU_TIGALARI          :: 1416983655;

    HB_SCRIPT_BERIA_ERFE             :: 1113944678;
    HB_SCRIPT_SIDETIC                :: 1399415924;
    HB_SCRIPT_TAI_YO                 :: 1415674223;
    HB_SCRIPT_TOLONG_SIKI            :: 1416588403;

    HB_SCRIPT_JURCHEN                :: 1249210979;
    HB_SCRIPT_PROTO_CUNEIFORM        :: 1348695406;
    HB_SCRIPT_SEAL                   :: 1399153004;

    HB_SCRIPT_INVALID                :: 0;

    HB_SCRIPT_MAX_VALUE              :: 2147483647;
    HB_SCRIPT_MAX_VALUE_SIGNED       :: 2147483647;

    _HB_SCRIPT_MAX_VALUE        :: HB_SCRIPT_MAX_VALUE;
    _HB_SCRIPT_MAX_VALUE_SIGNED :: HB_SCRIPT_MAX_VALUE_SIGNED;
}

/* Script functions */
script_from_iso15924_tag :: (tag: tag_t) -> script_t #foreign harfbuzz "hb_script_from_iso15924_tag";

script_from_string :: (str: *u8, len: s32) -> script_t #foreign harfbuzz "hb_script_from_string";

script_to_iso15924_tag :: (script: script_t) -> tag_t #foreign harfbuzz "hb_script_to_iso15924_tag";

script_get_horizontal_direction :: (script: script_t) -> direction_t #foreign harfbuzz "hb_script_get_horizontal_direction";

/**
* hb_user_data_key_t:
*
* Data structure for holding user-data keys.
*
**/
user_data_key_t :: struct {
    /*< private >*/
    unused: u8;
}

/**
* hb_destroy_func_t:
* @user_data: the data to be destroyed
*
* A virtual method for destroy user-data callbacks.
*
*/
destroy_func_t :: #type (user_data: *void) -> void #c_call;

/**
* hb_feature_t:
* @tag: The #hb_tag_t tag of the feature
* @value: The value of the feature. 0 disables the feature, non-zero (usually
* 1) enables the feature.  For features implemented as lookup type 3 (like
* 'salt') the @value is a one based index into the alternates.
* @start: the cluster to start applying this feature setting (inclusive).
* @end: the cluster to end applying this feature setting (exclusive).
*
* The #hb_feature_t is the structure that holds information about requested
* feature application. The feature will be applied with the given value to all
* glyphs which are in clusters between @start (inclusive) and @end (exclusive).
* Setting start to #HB_FEATURE_GLOBAL_START and end to #HB_FEATURE_GLOBAL_END
* specifies that the feature always applies to the entire buffer.
*/
feature_t :: struct {
    tag:   tag_t;
    value: u32;
    start: u32;
    end:   u32;
}

feature_from_string :: (str: *u8, len: s32, feature: *feature_t) -> bool_t #foreign harfbuzz "hb_feature_from_string";

feature_to_string :: (feature: *feature_t, buf: *u8, size: u32) -> void #foreign harfbuzz "hb_feature_to_string";

/**
* hb_variation_t:
* @tag: The #hb_tag_t tag of the variation-axis name
* @value: The value of the variation axis
*
* Data type for holding variation data. Registered OpenType
* variation-axis tags are listed in
* [OpenType Axis Tag Registry](https://docs.microsoft.com/en-us/typography/opentype/spec/dvaraxisreg).
*
* Since: 1.4.2
*/
variation_t :: struct {
    tag:   tag_t;
    value: float;
}

variation_from_string :: (str: *u8, len: s32, variation: *variation_t) -> bool_t #foreign harfbuzz "hb_variation_from_string";

variation_to_string :: (variation: *variation_t, buf: *u8, size: u32) -> void #foreign harfbuzz "hb_variation_to_string";

/**
* hb_color_t:
*
* Data type for holding color values. Colors are eight bits per
* channel RGB plus alpha transparency.
*
* Since: 2.1.0
*/
color_t :: u32;

color_get_alpha :: (color: color_t) -> u8 #foreign harfbuzz "hb_color_get_alpha";

color_get_red :: (color: color_t) -> u8 #foreign harfbuzz "hb_color_get_red";

color_get_green :: (color: color_t) -> u8 #foreign harfbuzz "hb_color_get_green";

color_get_blue :: (color: color_t) -> u8 #foreign harfbuzz "hb_color_get_blue";

/**
* hb_glyph_extents_t:
* @x_bearing: Distance from the x-origin to the left extremum of the glyph.
* @y_bearing: Distance from the top extremum of the glyph to the y-origin.
* @width: Distance from the left extremum of the glyph to the right extremum.
* @height: Distance from the top extremum of the glyph to the bottom extremum.
*
* Glyph extent values, measured in font units.
*
* Note that @height is negative, in coordinate systems that grow up.
**/
glyph_extents_t :: struct {
    x_bearing: position_t;
    y_bearing: position_t;
    width:     position_t;
    height:    position_t;
}

font_t :: struct {}

/* Not of much use to clients. */
malloc :: (size: u64) -> *void #foreign harfbuzz "hb_malloc";

calloc :: (nmemb: u64, size: u64) -> *void #foreign harfbuzz "hb_calloc";

realloc :: (ptr: *void, size: u64) -> *void #foreign harfbuzz "hb_realloc";

hb_free :: (ptr: *void) -> void #foreign harfbuzz;

/**
* hb_memory_mode_t:
* @HB_MEMORY_MODE_DUPLICATE: HarfBuzz immediately makes a copy of the data.
* @HB_MEMORY_MODE_READONLY: HarfBuzz client will never modify the data,
*     and HarfBuzz will never modify the data.
* @HB_MEMORY_MODE_WRITABLE: HarfBuzz client made a copy of the data solely
*     for HarfBuzz, so HarfBuzz may modify the data.
* @HB_MEMORY_MODE_READONLY_MAY_MAKE_WRITABLE: See above
*
* Data type holding the memory modes available to
* client programs.
*
* Regarding these various memory-modes:
*
* - In no case shall the HarfBuzz client modify memory
*   that is passed to HarfBuzz in a blob.  If there is
*   any such possibility, @HB_MEMORY_MODE_DUPLICATE should be used
*   such that HarfBuzz makes a copy immediately,
*
* - Use @HB_MEMORY_MODE_READONLY otherwise, unless you really really
*   really know what you are doing,
*
* - @HB_MEMORY_MODE_WRITABLE is appropriate if you really made a
*   copy of data solely for the purpose of passing to
*   HarfBuzz and doing that just once (no reuse!),
*
* - If the font is mmap()ed, it's okay to use
*   @HB_MEMORY_MODE_READONLY_MAY_MAKE_WRITABLE, however, using that mode
*   correctly is very tricky.  Use @HB_MEMORY_MODE_READONLY instead.
**/
memory_mode_t :: enum s32 {
    DUPLICATE                  :: 0;
    READONLY                   :: 1;
    WRITABLE                   :: 2;
    READONLY_MAY_MAKE_WRITABLE :: 3;

    HB_MEMORY_MODE_DUPLICATE                  :: DUPLICATE;
    HB_MEMORY_MODE_READONLY                   :: READONLY;
    HB_MEMORY_MODE_WRITABLE                   :: WRITABLE;
    HB_MEMORY_MODE_READONLY_MAY_MAKE_WRITABLE :: READONLY_MAY_MAKE_WRITABLE;
}

blob_t :: struct {}

blob_create :: (data: *u8, length: u32, mode: memory_mode_t, user_data: *void, destroy: destroy_func_t) -> *blob_t #foreign harfbuzz "hb_blob_create";

blob_create_or_fail :: (data: *u8, length: u32, mode: memory_mode_t, user_data: *void, destroy: destroy_func_t) -> *blob_t #foreign harfbuzz "hb_blob_create_or_fail";

blob_create_from_file :: (file_name: *u8) -> *blob_t #foreign harfbuzz "hb_blob_create_from_file";

blob_create_from_file_or_fail :: (file_name: *u8) -> *blob_t #foreign harfbuzz "hb_blob_create_from_file_or_fail";

/* Always creates with MEMORY_MODE_READONLY.
* Even if the parent blob is writable, we don't
* want the user of the sub-blob to be able to
* modify the parent data as that data may be
* shared among multiple sub-blobs.
*/
blob_create_sub_blob :: (parent: *blob_t, offset: u32, length: u32) -> *blob_t #foreign harfbuzz "hb_blob_create_sub_blob";

blob_copy_writable_or_fail :: (blob: *blob_t) -> *blob_t #foreign harfbuzz "hb_blob_copy_writable_or_fail";

blob_get_empty :: () -> *blob_t #foreign harfbuzz "hb_blob_get_empty";

blob_reference :: (blob: *blob_t) -> *blob_t #foreign harfbuzz "hb_blob_reference";

blob_destroy :: (blob: *blob_t) -> void #foreign harfbuzz "hb_blob_destroy";

blob_set_user_data :: (blob: *blob_t, key: *user_data_key_t, data: *void, destroy: destroy_func_t, replace: bool_t) -> bool_t #foreign harfbuzz "hb_blob_set_user_data";

blob_get_user_data :: (blob: *blob_t, key: *user_data_key_t) -> *void #foreign harfbuzz "hb_blob_get_user_data";

blob_make_immutable :: (blob: *blob_t) -> void #foreign harfbuzz "hb_blob_make_immutable";

blob_is_immutable :: (blob: *blob_t) -> bool_t #foreign harfbuzz "hb_blob_is_immutable";

blob_get_length :: (blob: *blob_t) -> u32 #foreign harfbuzz "hb_blob_get_length";

blob_get_data :: (blob: *blob_t, length: *u32) -> *u8 #foreign harfbuzz "hb_blob_get_data";

blob_get_data_writable :: (blob: *blob_t, length: *u32) -> *u8 #foreign harfbuzz "hb_blob_get_data_writable";

/* Unicode Character Database property: General_Category (gc) */
unicode_general_category_t :: enum s32 {
    CONTROL             :: 0;
    FORMAT              :: 1;
    UNASSIGNED          :: 2;
    PRIVATE_USE         :: 3;
    SURROGATE           :: 4;
    LOWERCASE_LETTER    :: 5;
    MODIFIER_LETTER     :: 6;
    OTHER_LETTER        :: 7;
    TITLECASE_LETTER    :: 8;
    UPPERCASE_LETTER    :: 9;
    SPACING_MARK        :: 10;
    ENCLOSING_MARK      :: 11;
    NON_SPACING_MARK    :: 12;
    DECIMAL_NUMBER      :: 13;
    LETTER_NUMBER       :: 14;
    OTHER_NUMBER        :: 15;
    CONNECT_PUNCTUATION :: 16;
    DASH_PUNCTUATION    :: 17;
    CLOSE_PUNCTUATION   :: 18;
    FINAL_PUNCTUATION   :: 19;
    INITIAL_PUNCTUATION :: 20;
    OTHER_PUNCTUATION   :: 21;
    OPEN_PUNCTUATION    :: 22;
    CURRENCY_SYMBOL     :: 23;
    MODIFIER_SYMBOL     :: 24;
    MATH_SYMBOL         :: 25;
    OTHER_SYMBOL        :: 26;
    LINE_SEPARATOR      :: 27;
    PARAGRAPH_SEPARATOR :: 28;
    SPACE_SEPARATOR     :: 29;

    HB_UNICODE_GENERAL_CATEGORY_CONTROL             :: CONTROL;
    HB_UNICODE_GENERAL_CATEGORY_FORMAT              :: FORMAT;
    HB_UNICODE_GENERAL_CATEGORY_UNASSIGNED          :: UNASSIGNED;
    HB_UNICODE_GENERAL_CATEGORY_PRIVATE_USE         :: PRIVATE_USE;
    HB_UNICODE_GENERAL_CATEGORY_SURROGATE           :: SURROGATE;
    HB_UNICODE_GENERAL_CATEGORY_LOWERCASE_LETTER    :: LOWERCASE_LETTER;
    HB_UNICODE_GENERAL_CATEGORY_MODIFIER_LETTER     :: MODIFIER_LETTER;
    HB_UNICODE_GENERAL_CATEGORY_OTHER_LETTER        :: OTHER_LETTER;
    HB_UNICODE_GENERAL_CATEGORY_TITLECASE_LETTER    :: TITLECASE_LETTER;
    HB_UNICODE_GENERAL_CATEGORY_UPPERCASE_LETTER    :: UPPERCASE_LETTER;
    HB_UNICODE_GENERAL_CATEGORY_SPACING_MARK        :: SPACING_MARK;
    HB_UNICODE_GENERAL_CATEGORY_ENCLOSING_MARK      :: ENCLOSING_MARK;
    HB_UNICODE_GENERAL_CATEGORY_NON_SPACING_MARK    :: NON_SPACING_MARK;
    HB_UNICODE_GENERAL_CATEGORY_DECIMAL_NUMBER      :: DECIMAL_NUMBER;
    HB_UNICODE_GENERAL_CATEGORY_LETTER_NUMBER       :: LETTER_NUMBER;
    HB_UNICODE_GENERAL_CATEGORY_OTHER_NUMBER        :: OTHER_NUMBER;
    HB_UNICODE_GENERAL_CATEGORY_CONNECT_PUNCTUATION :: CONNECT_PUNCTUATION;
    HB_UNICODE_GENERAL_CATEGORY_DASH_PUNCTUATION    :: DASH_PUNCTUATION;
    HB_UNICODE_GENERAL_CATEGORY_CLOSE_PUNCTUATION   :: CLOSE_PUNCTUATION;
    HB_UNICODE_GENERAL_CATEGORY_FINAL_PUNCTUATION   :: FINAL_PUNCTUATION;
    HB_UNICODE_GENERAL_CATEGORY_INITIAL_PUNCTUATION :: INITIAL_PUNCTUATION;
    HB_UNICODE_GENERAL_CATEGORY_OTHER_PUNCTUATION   :: OTHER_PUNCTUATION;
    HB_UNICODE_GENERAL_CATEGORY_OPEN_PUNCTUATION    :: OPEN_PUNCTUATION;
    HB_UNICODE_GENERAL_CATEGORY_CURRENCY_SYMBOL     :: CURRENCY_SYMBOL;
    HB_UNICODE_GENERAL_CATEGORY_MODIFIER_SYMBOL     :: MODIFIER_SYMBOL;
    HB_UNICODE_GENERAL_CATEGORY_MATH_SYMBOL         :: MATH_SYMBOL;
    HB_UNICODE_GENERAL_CATEGORY_OTHER_SYMBOL        :: OTHER_SYMBOL;
    HB_UNICODE_GENERAL_CATEGORY_LINE_SEPARATOR      :: LINE_SEPARATOR;
    HB_UNICODE_GENERAL_CATEGORY_PARAGRAPH_SEPARATOR :: PARAGRAPH_SEPARATOR;
    HB_UNICODE_GENERAL_CATEGORY_SPACE_SEPARATOR     :: SPACE_SEPARATOR;
}

/**
* hb_unicode_combining_class_t:
* @HB_UNICODE_COMBINING_CLASS_NOT_REORDERED: Spacing and enclosing marks; also many vowel and consonant signs, even if nonspacing
* @HB_UNICODE_COMBINING_CLASS_OVERLAY: Marks which overlay a base letter or symbol
* @HB_UNICODE_COMBINING_CLASS_NUKTA: Diacritic nukta marks in Brahmi-derived scripts
* @HB_UNICODE_COMBINING_CLASS_KANA_VOICING: Hiragana/Katakana voicing marks
* @HB_UNICODE_COMBINING_CLASS_VIRAMA: Viramas
* @HB_UNICODE_COMBINING_CLASS_CCC10: [Hebrew]
* @HB_UNICODE_COMBINING_CLASS_CCC11: [Hebrew]
* @HB_UNICODE_COMBINING_CLASS_CCC12: [Hebrew]
* @HB_UNICODE_COMBINING_CLASS_CCC13: [Hebrew]
* @HB_UNICODE_COMBINING_CLASS_CCC14: [Hebrew]
* @HB_UNICODE_COMBINING_CLASS_CCC15: [Hebrew]
* @HB_UNICODE_COMBINING_CLASS_CCC16: [Hebrew]
* @HB_UNICODE_COMBINING_CLASS_CCC17: [Hebrew]
* @HB_UNICODE_COMBINING_CLASS_CCC18: [Hebrew]
* @HB_UNICODE_COMBINING_CLASS_CCC19: [Hebrew]
* @HB_UNICODE_COMBINING_CLASS_CCC20: [Hebrew]
* @HB_UNICODE_COMBINING_CLASS_CCC21: [Hebrew]
* @HB_UNICODE_COMBINING_CLASS_CCC22: [Hebrew]
* @HB_UNICODE_COMBINING_CLASS_CCC23: [Hebrew]
* @HB_UNICODE_COMBINING_CLASS_CCC24: [Hebrew]
* @HB_UNICODE_COMBINING_CLASS_CCC25: [Hebrew]
* @HB_UNICODE_COMBINING_CLASS_CCC26: [Hebrew]
* @HB_UNICODE_COMBINING_CLASS_CCC27: [Arabic]
* @HB_UNICODE_COMBINING_CLASS_CCC28: [Arabic]
* @HB_UNICODE_COMBINING_CLASS_CCC29: [Arabic]
* @HB_UNICODE_COMBINING_CLASS_CCC30: [Arabic]
* @HB_UNICODE_COMBINING_CLASS_CCC31: [Arabic]
* @HB_UNICODE_COMBINING_CLASS_CCC32: [Arabic]
* @HB_UNICODE_COMBINING_CLASS_CCC33: [Arabic]
* @HB_UNICODE_COMBINING_CLASS_CCC34: [Arabic]
* @HB_UNICODE_COMBINING_CLASS_CCC35: [Arabic]
* @HB_UNICODE_COMBINING_CLASS_CCC36: [Syriac]
* @HB_UNICODE_COMBINING_CLASS_CCC84: [Telugu]
* @HB_UNICODE_COMBINING_CLASS_CCC91: [Telugu]
* @HB_UNICODE_COMBINING_CLASS_CCC103: [Thai]
* @HB_UNICODE_COMBINING_CLASS_CCC107: [Thai]
* @HB_UNICODE_COMBINING_CLASS_CCC118: [Lao]
* @HB_UNICODE_COMBINING_CLASS_CCC122: [Lao]
* @HB_UNICODE_COMBINING_CLASS_CCC129: [Tibetan]
* @HB_UNICODE_COMBINING_CLASS_CCC130: [Tibetan]
* @HB_UNICODE_COMBINING_CLASS_CCC132: [Tibetan] Since: 7.2.0
* @HB_UNICODE_COMBINING_CLASS_ATTACHED_BELOW_LEFT: Marks attached at the bottom left
* @HB_UNICODE_COMBINING_CLASS_ATTACHED_BELOW: Marks attached directly below
* @HB_UNICODE_COMBINING_CLASS_ATTACHED_ABOVE: Marks attached directly above
* @HB_UNICODE_COMBINING_CLASS_ATTACHED_ABOVE_RIGHT: Marks attached at the top right
* @HB_UNICODE_COMBINING_CLASS_BELOW_LEFT: Distinct marks at the bottom left
* @HB_UNICODE_COMBINING_CLASS_BELOW: Distinct marks directly below
* @HB_UNICODE_COMBINING_CLASS_BELOW_RIGHT: Distinct marks at the bottom right
* @HB_UNICODE_COMBINING_CLASS_LEFT: Distinct marks to the left
* @HB_UNICODE_COMBINING_CLASS_RIGHT: Distinct marks to the right
* @HB_UNICODE_COMBINING_CLASS_ABOVE_LEFT: Distinct marks at the top left
* @HB_UNICODE_COMBINING_CLASS_ABOVE: Distinct marks directly above
* @HB_UNICODE_COMBINING_CLASS_ABOVE_RIGHT: Distinct marks at the top right
* @HB_UNICODE_COMBINING_CLASS_DOUBLE_BELOW: Distinct marks subtending two bases
* @HB_UNICODE_COMBINING_CLASS_DOUBLE_ABOVE: Distinct marks extending above two bases
* @HB_UNICODE_COMBINING_CLASS_IOTA_SUBSCRIPT: Greek iota subscript only
* @HB_UNICODE_COMBINING_CLASS_INVALID: Invalid combining class
*
* Data type for the Canonical_Combining_Class (ccc) property
* from the Unicode Character Database.
*
* <note>Note: newer versions of Unicode may add new values.
* Client programs should be ready to handle any value in the 0..254 range
* being returned from hb_unicode_combining_class().</note>
*
**/
unicode_combining_class_t :: enum s32 {
    NOT_REORDERED        :: 0;
    OVERLAY              :: 1;
    NUKTA                :: 7;
    KANA_VOICING         :: 8;
    VIRAMA               :: 9;

    CCC10                :: 10;
    CCC11                :: 11;
    CCC12                :: 12;
    CCC13                :: 13;
    CCC14                :: 14;
    CCC15                :: 15;
    CCC16                :: 16;
    CCC17                :: 17;
    CCC18                :: 18;
    CCC19                :: 19;
    CCC20                :: 20;
    CCC21                :: 21;
    CCC22                :: 22;
    CCC23                :: 23;
    CCC24                :: 24;
    CCC25                :: 25;
    CCC26                :: 26;

    CCC27                :: 27;
    CCC28                :: 28;
    CCC29                :: 29;
    CCC30                :: 30;
    CCC31                :: 31;
    CCC32                :: 32;
    CCC33                :: 33;
    CCC34                :: 34;
    CCC35                :: 35;

    CCC36                :: 36;

    CCC84                :: 84;
    CCC91                :: 91;

    CCC103               :: 103;
    CCC107               :: 107;

    CCC118               :: 118;
    CCC122               :: 122;

    CCC129               :: 129;
    CCC130               :: 130;
    CCC132               :: 132;

    ATTACHED_BELOW_LEFT  :: 200;
    ATTACHED_BELOW       :: 202;
    ATTACHED_ABOVE       :: 214;
    ATTACHED_ABOVE_RIGHT :: 216;
    BELOW_LEFT           :: 218;
    BELOW                :: 220;
    BELOW_RIGHT          :: 222;
    LEFT                 :: 224;
    RIGHT                :: 226;
    ABOVE_LEFT           :: 228;
    ABOVE                :: 230;
    ABOVE_RIGHT          :: 232;
    DOUBLE_BELOW         :: 233;
    DOUBLE_ABOVE         :: 234;

    IOTA_SUBSCRIPT       :: 240;

    INVALID              :: 255;

    HB_UNICODE_COMBINING_CLASS_NOT_REORDERED        :: NOT_REORDERED;
    HB_UNICODE_COMBINING_CLASS_OVERLAY              :: OVERLAY;
    HB_UNICODE_COMBINING_CLASS_NUKTA                :: NUKTA;
    HB_UNICODE_COMBINING_CLASS_KANA_VOICING         :: KANA_VOICING;
    HB_UNICODE_COMBINING_CLASS_VIRAMA               :: VIRAMA;

    HB_UNICODE_COMBINING_CLASS_CCC10                :: CCC10;
    HB_UNICODE_COMBINING_CLASS_CCC11                :: CCC11;
    HB_UNICODE_COMBINING_CLASS_CCC12                :: CCC12;
    HB_UNICODE_COMBINING_CLASS_CCC13                :: CCC13;
    HB_UNICODE_COMBINING_CLASS_CCC14                :: CCC14;
    HB_UNICODE_COMBINING_CLASS_CCC15                :: CCC15;
    HB_UNICODE_COMBINING_CLASS_CCC16                :: CCC16;
    HB_UNICODE_COMBINING_CLASS_CCC17                :: CCC17;
    HB_UNICODE_COMBINING_CLASS_CCC18                :: CCC18;
    HB_UNICODE_COMBINING_CLASS_CCC19                :: CCC19;
    HB_UNICODE_COMBINING_CLASS_CCC20                :: CCC20;
    HB_UNICODE_COMBINING_CLASS_CCC21                :: CCC21;
    HB_UNICODE_COMBINING_CLASS_CCC22                :: CCC22;
    HB_UNICODE_COMBINING_CLASS_CCC23                :: CCC23;
    HB_UNICODE_COMBINING_CLASS_CCC24                :: CCC24;
    HB_UNICODE_COMBINING_CLASS_CCC25                :: CCC25;
    HB_UNICODE_COMBINING_CLASS_CCC26                :: CCC26;

    HB_UNICODE_COMBINING_CLASS_CCC27                :: CCC27;
    HB_UNICODE_COMBINING_CLASS_CCC28                :: CCC28;
    HB_UNICODE_COMBINING_CLASS_CCC29                :: CCC29;
    HB_UNICODE_COMBINING_CLASS_CCC30                :: CCC30;
    HB_UNICODE_COMBINING_CLASS_CCC31                :: CCC31;
    HB_UNICODE_COMBINING_CLASS_CCC32                :: CCC32;
    HB_UNICODE_COMBINING_CLASS_CCC33                :: CCC33;
    HB_UNICODE_COMBINING_CLASS_CCC34                :: CCC34;
    HB_UNICODE_COMBINING_CLASS_CCC35                :: CCC35;

    HB_UNICODE_COMBINING_CLASS_CCC36                :: CCC36;

    HB_UNICODE_COMBINING_CLASS_CCC84                :: CCC84;
    HB_UNICODE_COMBINING_CLASS_CCC91                :: CCC91;

    HB_UNICODE_COMBINING_CLASS_CCC103               :: CCC103;
    HB_UNICODE_COMBINING_CLASS_CCC107               :: CCC107;

    HB_UNICODE_COMBINING_CLASS_CCC118               :: CCC118;
    HB_UNICODE_COMBINING_CLASS_CCC122               :: CCC122;

    HB_UNICODE_COMBINING_CLASS_CCC129               :: CCC129;
    HB_UNICODE_COMBINING_CLASS_CCC130               :: CCC130;
    HB_UNICODE_COMBINING_CLASS_CCC132               :: CCC132;

    HB_UNICODE_COMBINING_CLASS_ATTACHED_BELOW_LEFT  :: ATTACHED_BELOW_LEFT;
    HB_UNICODE_COMBINING_CLASS_ATTACHED_BELOW       :: ATTACHED_BELOW;
    HB_UNICODE_COMBINING_CLASS_ATTACHED_ABOVE       :: ATTACHED_ABOVE;
    HB_UNICODE_COMBINING_CLASS_ATTACHED_ABOVE_RIGHT :: ATTACHED_ABOVE_RIGHT;
    HB_UNICODE_COMBINING_CLASS_BELOW_LEFT           :: BELOW_LEFT;
    HB_UNICODE_COMBINING_CLASS_BELOW                :: BELOW;
    HB_UNICODE_COMBINING_CLASS_BELOW_RIGHT          :: BELOW_RIGHT;
    HB_UNICODE_COMBINING_CLASS_LEFT                 :: LEFT;
    HB_UNICODE_COMBINING_CLASS_RIGHT                :: RIGHT;
    HB_UNICODE_COMBINING_CLASS_ABOVE_LEFT           :: ABOVE_LEFT;
    HB_UNICODE_COMBINING_CLASS_ABOVE                :: ABOVE;
    HB_UNICODE_COMBINING_CLASS_ABOVE_RIGHT          :: ABOVE_RIGHT;
    HB_UNICODE_COMBINING_CLASS_DOUBLE_BELOW         :: DOUBLE_BELOW;
    HB_UNICODE_COMBINING_CLASS_DOUBLE_ABOVE         :: DOUBLE_ABOVE;

    HB_UNICODE_COMBINING_CLASS_IOTA_SUBSCRIPT       :: IOTA_SUBSCRIPT;

    HB_UNICODE_COMBINING_CLASS_INVALID              :: INVALID;
}

unicode_funcs_t :: struct {}

/*
* just give me the best implementation you've got there.
*/
unicode_funcs_get_default :: () -> *unicode_funcs_t #foreign harfbuzz "hb_unicode_funcs_get_default";

unicode_funcs_create :: (parent: *unicode_funcs_t) -> *unicode_funcs_t #foreign harfbuzz "hb_unicode_funcs_create";

unicode_funcs_get_empty :: () -> *unicode_funcs_t #foreign harfbuzz "hb_unicode_funcs_get_empty";

unicode_funcs_reference :: (ufuncs: *unicode_funcs_t) -> *unicode_funcs_t #foreign harfbuzz "hb_unicode_funcs_reference";

unicode_funcs_destroy :: (ufuncs: *unicode_funcs_t) -> void #foreign harfbuzz "hb_unicode_funcs_destroy";

unicode_funcs_set_user_data :: (ufuncs: *unicode_funcs_t, key: *user_data_key_t, data: *void, destroy: destroy_func_t, replace: bool_t) -> bool_t #foreign harfbuzz "hb_unicode_funcs_set_user_data";

unicode_funcs_get_user_data :: (ufuncs: *unicode_funcs_t, key: *user_data_key_t) -> *void #foreign harfbuzz "hb_unicode_funcs_get_user_data";

unicode_funcs_make_immutable :: (ufuncs: *unicode_funcs_t) -> void #foreign harfbuzz "hb_unicode_funcs_make_immutable";

unicode_funcs_is_immutable :: (ufuncs: *unicode_funcs_t) -> bool_t #foreign harfbuzz "hb_unicode_funcs_is_immutable";

unicode_funcs_get_parent :: (ufuncs: *unicode_funcs_t) -> *unicode_funcs_t #foreign harfbuzz "hb_unicode_funcs_get_parent";

/**
* hb_unicode_combining_class_func_t:
* @ufuncs: A Unicode-functions structure
* @unicode: The code point to query
* @user_data: User data pointer passed by the caller
*
* A virtual method for the #hb_unicode_funcs_t structure.
*
* This method should retrieve the Canonical Combining Class (ccc)
* property for a specified Unicode code point.
*
* Return value: The #hb_unicode_combining_class_t of @unicode
*
**/
unicode_combining_class_func_t :: #type (ufuncs: *unicode_funcs_t, unicode: codepoint_t, user_data: *void) -> unicode_combining_class_t #c_call;

/**
* hb_unicode_general_category_func_t:
* @ufuncs: A Unicode-functions structure
* @unicode: The code point to query
* @user_data: User data pointer passed by the caller
*
* A virtual method for the #hb_unicode_funcs_t structure.
*
* This method should retrieve the General Category property for
* a specified Unicode code point.
*
* Return value: The #hb_unicode_general_category_t of @unicode
*
**/
unicode_general_category_func_t :: #type (ufuncs: *unicode_funcs_t, unicode: codepoint_t, user_data: *void) -> unicode_general_category_t #c_call;

/**
* hb_unicode_mirroring_func_t:
* @ufuncs: A Unicode-functions structure
* @unicode: The code point to query
* @user_data: User data pointer passed by the caller
*
* A virtual method for the #hb_unicode_funcs_t structure.
*
* This method should retrieve the Bi-Directional Mirroring Glyph
* code point for a specified Unicode code point.
*
* <note>Note: If a code point does not have a specified
* Bi-Directional Mirroring Glyph defined, the method should
* return the original code point.</note>
*
* Return value: The #hb_codepoint_t of the Mirroring Glyph for @unicode
*
**/
unicode_mirroring_func_t :: #type (ufuncs: *unicode_funcs_t, unicode: codepoint_t, user_data: *void) -> codepoint_t #c_call;

/**
* hb_unicode_script_func_t:
* @ufuncs: A Unicode-functions structure
* @unicode: The code point to query
* @user_data: User data pointer passed by the caller
*
* A virtual method for the #hb_unicode_funcs_t structure.
*
* This method should retrieve the Script property for a
* specified Unicode code point.
*
* Return value: The #hb_script_t of @unicode
*
**/
unicode_script_func_t :: #type (ufuncs: *unicode_funcs_t, unicode: codepoint_t, user_data: *void) -> script_t #c_call;

/**
* hb_unicode_compose_func_t:
* @ufuncs: A Unicode-functions structure
* @a: The first code point to compose
* @b: The second code point to compose
* @ab: (out): The composed code point
* @user_data: user data pointer passed by the caller
*
* A virtual method for the #hb_unicode_funcs_t structure.
*
* This method should compose a sequence of two input Unicode code
* points by canonical equivalence, returning the composed code
* point in a #hb_codepoint_t output parameter (if successful).
* The method must return an #hb_bool_t indicating the success
* of the composition.
*
* Return value: `true` is @a,@b composed, `false` otherwise
*
**/
unicode_compose_func_t :: #type (ufuncs: *unicode_funcs_t, a: codepoint_t, b: codepoint_t, ab: *codepoint_t, user_data: *void) -> bool_t #c_call;

/**
* hb_unicode_decompose_func_t:
* @ufuncs: A Unicode-functions structure
* @ab: The code point to decompose
* @a: (out): The first decomposed code point
* @b: (out): The second decomposed code point
* @user_data: user data pointer passed by the caller
*
* A virtual method for the #hb_unicode_funcs_t structure.
*
* This method should decompose an input Unicode code point,
* returning the two decomposed code points in #hb_codepoint_t
* output parameters (if successful). The method must return an
* #hb_bool_t indicating the success of the composition.
*
* Return value: `true` if @ab decomposed, `false` otherwise
*
**/
unicode_decompose_func_t :: #type (ufuncs: *unicode_funcs_t, ab: codepoint_t, a: *codepoint_t, b: *codepoint_t, user_data: *void) -> bool_t #c_call;

/**
* hb_unicode_funcs_set_combining_class_func:
* @ufuncs: A Unicode-functions structure
* @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
* @user_data: Data to pass to @func
* @destroy: (nullable): The function to call when @user_data is not needed anymore
*
* Sets the implementation function for #hb_unicode_combining_class_func_t.
*
* Since: 0.9.2
**/
unicode_funcs_set_combining_class_func :: (ufuncs: *unicode_funcs_t, func: unicode_combining_class_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_unicode_funcs_set_combining_class_func";

/**
* hb_unicode_funcs_set_general_category_func:
* @ufuncs: A Unicode-functions structure
* @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
* @user_data: Data to pass to @func
* @destroy: (nullable): The function to call when @user_data is not needed anymore
*
* Sets the implementation function for #hb_unicode_general_category_func_t.
*
* Since: 0.9.2
**/
unicode_funcs_set_general_category_func :: (ufuncs: *unicode_funcs_t, func: unicode_general_category_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_unicode_funcs_set_general_category_func";

/**
* hb_unicode_funcs_set_mirroring_func:
* @ufuncs: A Unicode-functions structure
* @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
* @user_data: Data to pass to @func
* @destroy: (nullable): The function to call when @user_data is not needed anymore
*
* Sets the implementation function for #hb_unicode_mirroring_func_t.
*
* Since: 0.9.2
**/
unicode_funcs_set_mirroring_func :: (ufuncs: *unicode_funcs_t, func: unicode_mirroring_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_unicode_funcs_set_mirroring_func";

/**
* hb_unicode_funcs_set_script_func:
* @ufuncs: A Unicode-functions structure
* @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
* @user_data: Data to pass to @func
* @destroy: (nullable): The function to call when @user_data is not needed anymore
*
* Sets the implementation function for #hb_unicode_script_func_t.
*
* Since: 0.9.2
**/
unicode_funcs_set_script_func :: (ufuncs: *unicode_funcs_t, func: unicode_script_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_unicode_funcs_set_script_func";

/**
* hb_unicode_funcs_set_compose_func:
* @ufuncs: A Unicode-functions structure
* @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
* @user_data: Data to pass to @func
* @destroy: (nullable): The function to call when @user_data is not needed anymore
*
* Sets the implementation function for #hb_unicode_compose_func_t.
*
* Since: 0.9.2
**/
unicode_funcs_set_compose_func :: (ufuncs: *unicode_funcs_t, func: unicode_compose_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_unicode_funcs_set_compose_func";

/**
* hb_unicode_funcs_set_decompose_func:
* @ufuncs: A Unicode-functions structure
* @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
* @user_data: Data to pass to @func
* @destroy: (nullable): The function to call when @user_data is not needed anymore
*
* Sets the implementation function for #hb_unicode_decompose_func_t.
*
* Since: 0.9.2
**/
unicode_funcs_set_decompose_func :: (ufuncs: *unicode_funcs_t, func: unicode_decompose_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_unicode_funcs_set_decompose_func";

/**
* hb_unicode_combining_class:
* @ufuncs: The Unicode-functions structure
* @unicode: The code point to query
*
* Retrieves the Canonical Combining Class (ccc) property
* of code point @unicode.
*
* Return value: The #hb_unicode_combining_class_t of @unicode
*
* Since: 0.9.2
**/
unicode_combining_class :: (ufuncs: *unicode_funcs_t, unicode: codepoint_t) -> unicode_combining_class_t #foreign harfbuzz "hb_unicode_combining_class";

/**
* hb_unicode_general_category:
* @ufuncs: The Unicode-functions structure
* @unicode: The code point to query
*
* Retrieves the General Category (gc) property
* of code point @unicode.
*
* Return value: The #hb_unicode_general_category_t of @unicode
*
* Since: 0.9.2
**/
unicode_general_category :: (ufuncs: *unicode_funcs_t, unicode: codepoint_t) -> unicode_general_category_t #foreign harfbuzz "hb_unicode_general_category";

/**
* hb_unicode_mirroring:
* @ufuncs: The Unicode-functions structure
* @unicode: The code point to query
*
* Retrieves the Bi-directional Mirroring Glyph code
* point defined for code point @unicode.
*
* Return value: The #hb_codepoint_t of the Mirroring Glyph for @unicode
*
* Since: 0.9.2
**/
unicode_mirroring :: (ufuncs: *unicode_funcs_t, unicode: codepoint_t) -> codepoint_t #foreign harfbuzz "hb_unicode_mirroring";

/**
* hb_unicode_script:
* @ufuncs: The Unicode-functions structure
* @unicode: The code point to query
*
* Retrieves the #hb_script_t script to which code
* point @unicode belongs.
*
* Return value: The #hb_script_t of @unicode
*
* Since: 0.9.2
**/
unicode_script :: (ufuncs: *unicode_funcs_t, unicode: codepoint_t) -> script_t #foreign harfbuzz "hb_unicode_script";

unicode_compose :: (ufuncs: *unicode_funcs_t, a: codepoint_t, b: codepoint_t, ab: *codepoint_t) -> bool_t #foreign harfbuzz "hb_unicode_compose";

unicode_decompose :: (ufuncs: *unicode_funcs_t, ab: codepoint_t, a: *codepoint_t, b: *codepoint_t) -> bool_t #foreign harfbuzz "hb_unicode_decompose";

set_t :: struct {}

set_create :: () -> *set_t #foreign harfbuzz "hb_set_create";

set_get_empty :: () -> *set_t #foreign harfbuzz "hb_set_get_empty";

set_reference :: (set: *set_t) -> *set_t #foreign harfbuzz "hb_set_reference";

set_destroy :: (set: *set_t) -> void #foreign harfbuzz "hb_set_destroy";

set_set_user_data :: (set: *set_t, key: *user_data_key_t, data: *void, destroy: destroy_func_t, replace: bool_t) -> bool_t #foreign harfbuzz "hb_set_set_user_data";

set_get_user_data :: (set: *set_t, key: *user_data_key_t) -> *void #foreign harfbuzz "hb_set_get_user_data";

/* Returns false if allocation has failed before */
set_allocation_successful :: (set: *set_t) -> bool_t #foreign harfbuzz "hb_set_allocation_successful";

set_copy :: (set: *set_t) -> *set_t #foreign harfbuzz "hb_set_copy";

set_clear :: (set: *set_t) -> void #foreign harfbuzz "hb_set_clear";

set_is_empty :: (set: *set_t) -> bool_t #foreign harfbuzz "hb_set_is_empty";

set_invert :: (set: *set_t) -> void #foreign harfbuzz "hb_set_invert";

set_is_inverted :: (set: *set_t) -> bool_t #foreign harfbuzz "hb_set_is_inverted";

set_has :: (set: *set_t, codepoint: codepoint_t) -> bool_t #foreign harfbuzz "hb_set_has";

set_add :: (set: *set_t, codepoint: codepoint_t) -> void #foreign harfbuzz "hb_set_add";

set_add_range :: (set: *set_t, first: codepoint_t, last: codepoint_t) -> void #foreign harfbuzz "hb_set_add_range";

set_add_sorted_array :: (set: *set_t, sorted_codepoints: *codepoint_t, num_codepoints: u32) -> void #foreign harfbuzz "hb_set_add_sorted_array";

set_del :: (set: *set_t, codepoint: codepoint_t) -> void #foreign harfbuzz "hb_set_del";

set_del_range :: (set: *set_t, first: codepoint_t, last: codepoint_t) -> void #foreign harfbuzz "hb_set_del_range";

set_is_equal :: (set: *set_t, other: *set_t) -> bool_t #foreign harfbuzz "hb_set_is_equal";

set_intersects :: (set: *set_t, other: *set_t) -> bool_t #foreign harfbuzz "hb_set_intersects";

set_hash :: (set: *set_t) -> u32 #foreign harfbuzz "hb_set_hash";

set_is_subset :: (set: *set_t, larger_set: *set_t) -> bool_t #foreign harfbuzz "hb_set_is_subset";

set_set :: (set: *set_t, other: *set_t) -> void #foreign harfbuzz "hb_set_set";

set_union :: (set: *set_t, other: *set_t) -> void #foreign harfbuzz "hb_set_union";

set_intersect :: (set: *set_t, other: *set_t) -> void #foreign harfbuzz "hb_set_intersect";

set_subtract :: (set: *set_t, other: *set_t) -> void #foreign harfbuzz "hb_set_subtract";

set_symmetric_difference :: (set: *set_t, other: *set_t) -> void #foreign harfbuzz "hb_set_symmetric_difference";

set_get_population :: (set: *set_t) -> u32 #foreign harfbuzz "hb_set_get_population";

/* Returns HB_SET_VALUE_INVALID if set empty. */
set_get_min :: (set: *set_t) -> codepoint_t #foreign harfbuzz "hb_set_get_min";

/* Returns HB_SET_VALUE_INVALID if set empty. */
set_get_max :: (set: *set_t) -> codepoint_t #foreign harfbuzz "hb_set_get_max";

/* Pass HB_SET_VALUE_INVALID in to get started. */
set_next :: (set: *set_t, codepoint: *codepoint_t) -> bool_t #foreign harfbuzz "hb_set_next";

/* Pass HB_SET_VALUE_INVALID in to get started. */
set_previous :: (set: *set_t, codepoint: *codepoint_t) -> bool_t #foreign harfbuzz "hb_set_previous";

/* Pass HB_SET_VALUE_INVALID for first and last to get started. */
set_next_range :: (set: *set_t, first: *codepoint_t, last: *codepoint_t) -> bool_t #foreign harfbuzz "hb_set_next_range";

/* Pass HB_SET_VALUE_INVALID for first and last to get started. */
set_previous_range :: (set: *set_t, first: *codepoint_t, last: *codepoint_t) -> bool_t #foreign harfbuzz "hb_set_previous_range";

/* Pass HB_SET_VALUE_INVALID in to get started. */
set_next_many :: (set: *set_t, codepoint: codepoint_t, out: *codepoint_t, size: u32) -> u32 #foreign harfbuzz "hb_set_next_many";

map_t :: struct {}

map_create :: () -> *map_t #foreign harfbuzz "hb_map_create";

map_get_empty :: () -> *map_t #foreign harfbuzz "hb_map_get_empty";

map_reference :: (map: *map_t) -> *map_t #foreign harfbuzz "hb_map_reference";

map_destroy :: (map: *map_t) -> void #foreign harfbuzz "hb_map_destroy";

map_set_user_data :: (map: *map_t, key: *user_data_key_t, data: *void, destroy: destroy_func_t, replace: bool_t) -> bool_t #foreign harfbuzz "hb_map_set_user_data";

map_get_user_data :: (map: *map_t, key: *user_data_key_t) -> *void #foreign harfbuzz "hb_map_get_user_data";

/* Returns false if allocation has failed before */
map_allocation_successful :: (map: *map_t) -> bool_t #foreign harfbuzz "hb_map_allocation_successful";

map_copy :: (map: *map_t) -> *map_t #foreign harfbuzz "hb_map_copy";

map_clear :: (map: *map_t) -> void #foreign harfbuzz "hb_map_clear";

map_is_empty :: (map: *map_t) -> bool_t #foreign harfbuzz "hb_map_is_empty";

map_get_population :: (map: *map_t) -> u32 #foreign harfbuzz "hb_map_get_population";

map_is_equal :: (map: *map_t, other: *map_t) -> bool_t #foreign harfbuzz "hb_map_is_equal";

map_hash :: (map: *map_t) -> u32 #foreign harfbuzz "hb_map_hash";

map_set :: (map: *map_t, key: codepoint_t, value: codepoint_t) -> void #foreign harfbuzz "hb_map_set";

map_get :: (map: *map_t, key: codepoint_t) -> codepoint_t #foreign harfbuzz "hb_map_get";

map_del :: (map: *map_t, key: codepoint_t) -> void #foreign harfbuzz "hb_map_del";

map_has :: (map: *map_t, key: codepoint_t) -> bool_t #foreign harfbuzz "hb_map_has";

map_update :: (map: *map_t, other: *map_t) -> void #foreign harfbuzz "hb_map_update";

/* Pass -1 in for idx to get started. */
map_next :: (map: *map_t, idx: *s32, key: *codepoint_t, value: *codepoint_t) -> bool_t #foreign harfbuzz "hb_map_next";

map_keys :: (map: *map_t, keys: *set_t) -> void #foreign harfbuzz "hb_map_keys";

map_values :: (map: *map_t, values: *set_t) -> void #foreign harfbuzz "hb_map_values";

face_count :: (blob: *blob_t) -> u32 #foreign harfbuzz "hb_face_count";

face_t :: struct {}

face_create :: (blob: *blob_t, index: u32) -> *face_t #foreign harfbuzz "hb_face_create";

face_create_or_fail :: (blob: *blob_t, index: u32) -> *face_t #foreign harfbuzz "hb_face_create_or_fail";

face_create_or_fail_using :: (blob: *blob_t, index: u32, loader_name: *u8) -> *face_t #foreign harfbuzz "hb_face_create_or_fail_using";

face_create_from_file_or_fail :: (file_name: *u8, index: u32) -> *face_t #foreign harfbuzz "hb_face_create_from_file_or_fail";

face_create_from_file_or_fail_using :: (file_name: *u8, index: u32, loader_name: *u8) -> *face_t #foreign harfbuzz "hb_face_create_from_file_or_fail_using";

face_list_loaders :: () -> **u8 #foreign harfbuzz "hb_face_list_loaders";

/**
* hb_reference_table_func_t:
* @face: an #hb_face_t to reference table for
* @tag: the tag of the table to reference
* @user_data: User data pointer passed by the caller
*
* Callback function for hb_face_create_for_tables(). The @tag is the tag of the
* table to reference, and the special tag #HB_TAG_NONE is used to reference the
* blob of the face itself. If referencing the face blob is not possible, it is
* recommended to set hb_get_table_tags_func_t on the @face to allow
* hb_face_reference_blob() to create a face blob out of individual table blobs.
*
* Return value: (transfer full): A pointer to the @tag table within @face or
* `NULL` if the table is not found or cannot be referenced.
*
* Since: 0.9.2
*/
reference_table_func_t :: #type (face: *face_t, tag: tag_t, user_data: *void) -> *blob_t #c_call;

/* calls destroy() when not needing user_data anymore */
face_create_for_tables :: (reference_table_func: reference_table_func_t, user_data: *void, destroy: destroy_func_t) -> *face_t #foreign harfbuzz "hb_face_create_for_tables";

face_get_empty :: () -> *face_t #foreign harfbuzz "hb_face_get_empty";

face_reference :: (face: *face_t) -> *face_t #foreign harfbuzz "hb_face_reference";

face_destroy :: (face: *face_t) -> void #foreign harfbuzz "hb_face_destroy";

face_set_user_data :: (face: *face_t, key: *user_data_key_t, data: *void, destroy: destroy_func_t, replace: bool_t) -> bool_t #foreign harfbuzz "hb_face_set_user_data";

face_get_user_data :: (face: *face_t, key: *user_data_key_t) -> *void #foreign harfbuzz "hb_face_get_user_data";

face_make_immutable :: (face: *face_t) -> void #foreign harfbuzz "hb_face_make_immutable";

face_is_immutable :: (face: *face_t) -> bool_t #foreign harfbuzz "hb_face_is_immutable";

face_reference_table :: (face: *face_t, tag: tag_t) -> *blob_t #foreign harfbuzz "hb_face_reference_table";

face_reference_blob :: (face: *face_t) -> *blob_t #foreign harfbuzz "hb_face_reference_blob";

face_set_index :: (face: *face_t, index: u32) -> void #foreign harfbuzz "hb_face_set_index";

face_get_index :: (face: *face_t) -> u32 #foreign harfbuzz "hb_face_get_index";

face_set_upem :: (face: *face_t, upem: u32) -> void #foreign harfbuzz "hb_face_set_upem";

face_get_upem :: (face: *face_t) -> u32 #foreign harfbuzz "hb_face_get_upem";

face_set_glyph_count :: (face: *face_t, glyph_count: u32) -> void #foreign harfbuzz "hb_face_set_glyph_count";

face_get_glyph_count :: (face: *face_t) -> u32 #foreign harfbuzz "hb_face_get_glyph_count";

/**
* hb_get_table_tags_func_t:
* @face: A face object
* @start_offset: The index of first table tag to retrieve
* @table_count: (inout): Input = the maximum number of table tags to return;
*                Output = the actual number of table tags returned (may be zero)
* @table_tags: (out) (array length=table_count) (nullable): The array of table tags found
* @user_data: User data pointer passed by the caller
*
* Callback function for hb_face_get_table_tags().
*
* Return value: Total number of tables, or zero if it is not possible to list
*
* Since: 10.0.0
*/
get_table_tags_func_t :: #type (face: *face_t, start_offset: u32, table_count: *u32, table_tags: *tag_t, user_data: *void) -> u32 #c_call;

face_set_get_table_tags_func :: (face: *face_t, func: get_table_tags_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_face_set_get_table_tags_func";

face_get_table_tags :: (face: *face_t, start_offset: u32, table_count: *u32, table_tags: *tag_t) -> u32 #foreign harfbuzz "hb_face_get_table_tags";

/*
* Character set.
*/
face_collect_unicodes :: (face: *face_t, out: *set_t) -> void #foreign harfbuzz "hb_face_collect_unicodes";

face_collect_nominal_glyph_mapping :: (face: *face_t, mapping: *map_t, unicodes: *set_t) -> void #foreign harfbuzz "hb_face_collect_nominal_glyph_mapping";

face_collect_variation_selectors :: (face: *face_t, out: *set_t) -> void #foreign harfbuzz "hb_face_collect_variation_selectors";

face_collect_variation_unicodes :: (face: *face_t, variation_selector: codepoint_t, out: *set_t) -> void #foreign harfbuzz "hb_face_collect_variation_unicodes";

/*
* Builder face.
*/
face_builder_create :: () -> *face_t #foreign harfbuzz "hb_face_builder_create";

face_builder_add_table :: (face: *face_t, tag: tag_t, blob: *blob_t) -> bool_t #foreign harfbuzz "hb_face_builder_add_table";

face_builder_sort_tables :: (face: *face_t, tags: *tag_t) -> void #foreign harfbuzz "hb_face_builder_sort_tables";

/**
* hb_draw_state_t
* @path_open: Whether there is an open path
* @path_start_x: X component of the start of current path
* @path_start_y: Y component of the start of current path
* @current_x: X component of current point
* @current_y: Y component of current point
*
* Current drawing state.
*
* Since: 4.0.0
**/
draw_state_t :: struct {
    path_open:    bool_t;

    path_start_x: float;
    path_start_y: float;

    current_x:    float;
    current_y:    float;

    /*< private >*/
    reserved1:    var_num_t;
    reserved2:    var_num_t;
    reserved3:    var_num_t;
    reserved4:    var_num_t;
    reserved5:    var_num_t;
    reserved6:    var_num_t;
    reserved7:    var_num_t;
}

draw_funcs_t :: struct {}

/**
* hb_draw_move_to_func_t:
* @dfuncs: draw functions object
* @draw_data: The data accompanying the draw functions in hb_font_draw_glyph()
* @st: current draw state
* @to_x: X component of target point
* @to_y: Y component of target point
* @user_data: User data pointer passed to hb_draw_funcs_set_move_to_func()
*
* A virtual method for the #hb_draw_funcs_t to perform a "move-to" draw
* operation.
*
* Since: 4.0.0
*
**/
draw_move_to_func_t :: #type (dfuncs: *draw_funcs_t, draw_data: *void, st: *draw_state_t, to_x: float, to_y: float, user_data: *void) -> void #c_call;

/**
* hb_draw_line_to_func_t:
* @dfuncs: draw functions object
* @draw_data: The data accompanying the draw functions in hb_font_draw_glyph()
* @st: current draw state
* @to_x: X component of target point
* @to_y: Y component of target point
* @user_data: User data pointer passed to hb_draw_funcs_set_line_to_func()
*
* A virtual method for the #hb_draw_funcs_t to perform a "line-to" draw
* operation.
*
* Since: 4.0.0
*
**/
draw_line_to_func_t :: #type (dfuncs: *draw_funcs_t, draw_data: *void, st: *draw_state_t, to_x: float, to_y: float, user_data: *void) -> void #c_call;

/**
* hb_draw_quadratic_to_func_t:
* @dfuncs: draw functions object
* @draw_data: The data accompanying the draw functions in hb_font_draw_glyph()
* @st: current draw state
* @control_x: X component of control point
* @control_y: Y component of control point
* @to_x: X component of target point
* @to_y: Y component of target point
* @user_data: User data pointer passed to hb_draw_funcs_set_quadratic_to_func()
*
* A virtual method for the #hb_draw_funcs_t to perform a "quadratic-to" draw
* operation.
*
* Since: 4.0.0
*
**/
draw_quadratic_to_func_t :: #type (dfuncs: *draw_funcs_t, draw_data: *void, st: *draw_state_t, control_x: float, control_y: float, to_x: float, to_y: float, user_data: *void) -> void #c_call;

/**
* hb_draw_cubic_to_func_t:
* @dfuncs: draw functions object
* @draw_data: The data accompanying the draw functions in hb_font_draw_glyph()
* @st: current draw state
* @control1_x: X component of first control point
* @control1_y: Y component of first control point
* @control2_x: X component of second control point
* @control2_y: Y component of second control point
* @to_x: X component of target point
* @to_y: Y component of target point
* @user_data: User data pointer passed to hb_draw_funcs_set_cubic_to_func()
*
* A virtual method for the #hb_draw_funcs_t to perform a "cubic-to" draw
* operation.
*
* Since: 4.0.0
*
**/
draw_cubic_to_func_t :: #type (dfuncs: *draw_funcs_t, draw_data: *void, st: *draw_state_t, control1_x: float, control1_y: float, control2_x: float, control2_y: float, to_x: float, to_y: float, user_data: *void) -> void #c_call;

/**
* hb_draw_close_path_func_t:
* @dfuncs: draw functions object
* @draw_data: The data accompanying the draw functions in hb_font_draw_glyph()
* @st: current draw state
* @user_data: User data pointer passed to hb_draw_funcs_set_close_path_func()
*
* A virtual method for the #hb_draw_funcs_t to perform a "close-path" draw
* operation.
*
* Since: 4.0.0
*
**/
draw_close_path_func_t :: #type (dfuncs: *draw_funcs_t, draw_data: *void, st: *draw_state_t, user_data: *void) -> void #c_call;

/**
* hb_draw_set_budget_func_t:
* @dfuncs: draw functions object
* @draw_data: The data accompanying the draw functions
* @budget: the new work-budget policy
* @user_data: User data pointer passed to hb_draw_funcs_set_set_budget_func()
*
* Sets the work-budget policy and recharges the live work budget. @budget is
* #HB_BUDGET_DEFAULT, #HB_BUDGET_UNLIMITED, or a non-negative concrete value.
*
* Return value: `true` if the budget was set, `false` if unsupported
*
* Since: 14.5.0
**/
draw_set_budget_func_t :: #type (dfuncs: *draw_funcs_t, draw_data: *void, budget: s64, user_data: *void) -> bool_t #c_call;

/**
* hb_draw_get_budget_func_t:
* @dfuncs: draw functions object
* @draw_data: The data accompanying the draw functions
* @user_data: User data pointer passed to hb_draw_funcs_set_get_budget_func()
*
* Fetches the configured work-budget policy.
*
* Return value: the configured work-budget policy
*
* Since: 14.5.0
**/
draw_get_budget_func_t :: #type (dfuncs: *draw_funcs_t, draw_data: *void, user_data: *void) -> s64 #c_call;

/**
* hb_draw_get_budget_remaining_func_t:
* @dfuncs: draw functions object
* @draw_data: The data accompanying the draw functions
* @user_data: User data pointer passed to
*   hb_draw_funcs_set_get_budget_remaining_func()
*
* Fetches the address of the live work budget. The returned address must stay
* valid while @draw_data is used with @dfuncs. The live value must be concrete;
* it must not contain #HB_BUDGET_DEFAULT.
*
* Return value: (nullable) (transfer none): the live work budget, or `NULL` if
*   live budget accounting is unsupported
*
* Since: 14.5.0
**/
draw_get_budget_remaining_func_t :: #type (dfuncs: *draw_funcs_t, draw_data: *void, user_data: *void) -> *s64 #c_call;

/**
* hb_draw_funcs_set_move_to_func:
* @dfuncs: draw functions object
* @func: (closure user_data) (destroy destroy) (scope notified): move-to callback
* @user_data: Data to pass to @func
* @destroy: (nullable): The function to call when @user_data is not needed anymore
*
* Sets move-to callback to the draw functions object.
*
* Since: 4.0.0
**/
draw_funcs_set_move_to_func :: (dfuncs: *draw_funcs_t, func: draw_move_to_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_draw_funcs_set_move_to_func";

/**
* hb_draw_funcs_set_line_to_func:
* @dfuncs: draw functions object
* @func: (closure user_data) (destroy destroy) (scope notified): line-to callback
* @user_data: Data to pass to @func
* @destroy: (nullable): The function to call when @user_data is not needed anymore
*
* Sets line-to callback to the draw functions object.
*
* Since: 4.0.0
**/
draw_funcs_set_line_to_func :: (dfuncs: *draw_funcs_t, func: draw_line_to_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_draw_funcs_set_line_to_func";

/**
* hb_draw_funcs_set_quadratic_to_func:
* @dfuncs: draw functions object
* @func: (closure user_data) (destroy destroy) (scope notified): quadratic-to callback
* @user_data: Data to pass to @func
* @destroy: (nullable): The function to call when @user_data is not needed anymore
*
* Sets quadratic-to callback to the draw functions object.
*
* Since: 4.0.0
**/
draw_funcs_set_quadratic_to_func :: (dfuncs: *draw_funcs_t, func: draw_quadratic_to_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_draw_funcs_set_quadratic_to_func";

/**
* hb_draw_funcs_set_cubic_to_func:
* @dfuncs: draw functions
* @func: (closure user_data) (destroy destroy) (scope notified): cubic-to callback
* @user_data: Data to pass to @func
* @destroy: (nullable): The function to call when @user_data is not needed anymore
*
* Sets cubic-to callback to the draw functions object.
*
* Since: 4.0.0
**/
draw_funcs_set_cubic_to_func :: (dfuncs: *draw_funcs_t, func: draw_cubic_to_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_draw_funcs_set_cubic_to_func";

/**
* hb_draw_funcs_set_close_path_func:
* @dfuncs: draw functions object
* @func: (closure user_data) (destroy destroy) (scope notified): close-path callback
* @user_data: Data to pass to @func
* @destroy: (nullable): The function to call when @user_data is not needed anymore
*
* Sets close-path callback to the draw functions object.
*
* Since: 4.0.0
**/
draw_funcs_set_close_path_func :: (dfuncs: *draw_funcs_t, func: draw_close_path_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_draw_funcs_set_close_path_func";

/**
* hb_draw_funcs_set_set_budget_func:
* @dfuncs: draw functions object
* @func: (closure user_data) (destroy destroy) (scope notified): budget setter
* @user_data: Data to pass to @func
* @destroy: (nullable): callback to destroy @user_data
*
* Sets the budget setter callback.
*
* Since: 14.5.0
**/
draw_funcs_set_set_budget_func :: (dfuncs: *draw_funcs_t, func: draw_set_budget_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_draw_funcs_set_set_budget_func";

/**
* hb_draw_funcs_set_get_budget_func:
* @dfuncs: draw functions object
* @func: (closure user_data) (destroy destroy) (scope notified): budget getter
* @user_data: Data to pass to @func
* @destroy: (nullable): callback to destroy @user_data
*
* Sets the budget-policy getter callback.
*
* Since: 14.5.0
**/
draw_funcs_set_get_budget_func :: (dfuncs: *draw_funcs_t, func: draw_get_budget_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_draw_funcs_set_get_budget_func";

/**
* hb_draw_funcs_set_get_budget_remaining_func:
* @dfuncs: draw functions object
* @func: (closure user_data) (destroy destroy) (scope notified): live-budget getter
* @user_data: Data to pass to @func
* @destroy: (nullable): callback to destroy @user_data
*
* Sets the live-budget getter callback.
*
* Since: 14.5.0
**/
draw_funcs_set_get_budget_remaining_func :: (dfuncs: *draw_funcs_t, func: draw_get_budget_remaining_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_draw_funcs_set_get_budget_remaining_func";

draw_funcs_create :: () -> *draw_funcs_t #foreign harfbuzz "hb_draw_funcs_create";

draw_funcs_get_empty :: () -> *draw_funcs_t #foreign harfbuzz "hb_draw_funcs_get_empty";

draw_funcs_reference :: (dfuncs: *draw_funcs_t) -> *draw_funcs_t #foreign harfbuzz "hb_draw_funcs_reference";

draw_funcs_destroy :: (dfuncs: *draw_funcs_t) -> void #foreign harfbuzz "hb_draw_funcs_destroy";

draw_funcs_set_user_data :: (dfuncs: *draw_funcs_t, key: *user_data_key_t, data: *void, destroy: destroy_func_t, replace: bool_t) -> bool_t #foreign harfbuzz "hb_draw_funcs_set_user_data";

draw_funcs_get_user_data :: (dfuncs: *draw_funcs_t, key: *user_data_key_t) -> *void #foreign harfbuzz "hb_draw_funcs_get_user_data";

draw_funcs_make_immutable :: (dfuncs: *draw_funcs_t) -> void #foreign harfbuzz "hb_draw_funcs_make_immutable";

draw_funcs_is_immutable :: (dfuncs: *draw_funcs_t) -> bool_t #foreign harfbuzz "hb_draw_funcs_is_immutable";

draw_set_budget :: (dfuncs: *draw_funcs_t, draw_data: *void, budget: s64) -> bool_t #foreign harfbuzz "hb_draw_set_budget";

draw_get_budget :: (dfuncs: *draw_funcs_t, draw_data: *void) -> s64 #foreign harfbuzz "hb_draw_get_budget";

draw_get_budget_remaining :: (dfuncs: *draw_funcs_t, draw_data: *void) -> s64 #foreign harfbuzz "hb_draw_get_budget_remaining";

draw_move_to :: (dfuncs: *draw_funcs_t, draw_data: *void, st: *draw_state_t, to_x: float, to_y: float) -> void #foreign harfbuzz "hb_draw_move_to";

draw_line_to :: (dfuncs: *draw_funcs_t, draw_data: *void, st: *draw_state_t, to_x: float, to_y: float) -> void #foreign harfbuzz "hb_draw_line_to";

draw_quadratic_to :: (dfuncs: *draw_funcs_t, draw_data: *void, st: *draw_state_t, control_x: float, control_y: float, to_x: float, to_y: float) -> void #foreign harfbuzz "hb_draw_quadratic_to";

draw_cubic_to :: (dfuncs: *draw_funcs_t, draw_data: *void, st: *draw_state_t, control1_x: float, control1_y: float, control2_x: float, control2_y: float, to_x: float, to_y: float) -> void #foreign harfbuzz "hb_draw_cubic_to";

draw_close_path :: (dfuncs: *draw_funcs_t, draw_data: *void, st: *draw_state_t) -> void #foreign harfbuzz "hb_draw_close_path";

/**
* hb_draw_line_cap_t:
* @HB_DRAW_LINE_CAP_BUTT:   No cap; the line ends exactly at
*   its endpoint.
* @HB_DRAW_LINE_CAP_SQUARE: Square cap; the line is extended
*   past its endpoint by half the local stroke width.  Useful
*   for composing closed shapes from line segments (e.g. a
*   rectangle made from four lines).
*
* End-cap shape for hb_draw_line().
*
* Since: 14.2.0
**/
draw_line_cap_t :: enum s32 {
    BUTT   :: 0;
    SQUARE :: 1;

    HB_DRAW_LINE_CAP_BUTT   :: BUTT;
    HB_DRAW_LINE_CAP_SQUARE :: SQUARE;
}

draw_line :: (dfuncs: *draw_funcs_t, draw_data: *void, st: *draw_state_t, x0: float, y0: float, w0: float, x1: float, y1: float, w1: float, cap: draw_line_cap_t) -> void #foreign harfbuzz "hb_draw_line";

draw_rectangle :: (dfuncs: *draw_funcs_t, draw_data: *void, st: *draw_state_t, x: float, y: float, w: float, h: float, stroke_width: float) -> void #foreign harfbuzz "hb_draw_rectangle";

draw_circle :: (dfuncs: *draw_funcs_t, draw_data: *void, st: *draw_state_t, cx: float, cy: float, r: float, stroke_width: float) -> void #foreign harfbuzz "hb_draw_circle";

paint_funcs_t :: struct {}

/**
* hb_paint_set_budget_func_t:
* @funcs: paint functions object
* @paint_data: The data accompanying the paint functions
* @budget: the new work-budget policy
* @user_data: User data pointer passed to hb_paint_funcs_set_set_budget_func()
*
* Sets the work-budget policy and recharges the live work budget. @budget is
* #HB_BUDGET_DEFAULT, #HB_BUDGET_UNLIMITED, or a non-negative concrete value.
*
* Return value: `true` if the budget was set, `false` if unsupported
*
* Since: 14.5.0
**/
paint_set_budget_func_t :: #type (funcs: *paint_funcs_t, paint_data: *void, budget: s64, user_data: *void) -> bool_t #c_call;

/**
* hb_paint_get_budget_func_t:
* @funcs: paint functions object
* @paint_data: The data accompanying the paint functions
* @user_data: User data pointer passed to hb_paint_funcs_set_get_budget_func()
*
* Fetches the configured work-budget policy.
*
* Return value: the configured work-budget policy
*
* Since: 14.5.0
**/
paint_get_budget_func_t :: #type (funcs: *paint_funcs_t, paint_data: *void, user_data: *void) -> s64 #c_call;

/**
* hb_paint_get_budget_remaining_func_t:
* @funcs: paint functions object
* @paint_data: The data accompanying the paint functions
* @user_data: User data pointer passed to
*   hb_paint_funcs_set_get_budget_remaining_func()
*
* Fetches the address of the live work budget. The returned address must stay
* valid while @paint_data is used with @funcs. The live value must be concrete;
* it must not contain #HB_BUDGET_DEFAULT.
*
* Return value: (nullable) (transfer none): the live work budget, or `NULL` if
*   live budget accounting is unsupported
*
* Since: 14.5.0
**/
paint_get_budget_remaining_func_t :: #type (funcs: *paint_funcs_t, paint_data: *void, user_data: *void) -> *s64 #c_call;

/**
* hb_paint_funcs_set_set_budget_func:
* @funcs: paint functions object
* @func: (closure user_data) (destroy destroy) (scope notified): budget setter
* @user_data: Data to pass to @func
* @destroy: (nullable): callback to destroy @user_data
*
* Sets the budget setter callback.
*
* Since: 14.5.0
**/
paint_funcs_set_set_budget_func :: (funcs: *paint_funcs_t, func: paint_set_budget_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_paint_funcs_set_set_budget_func";

/**
* hb_paint_funcs_set_get_budget_func:
* @funcs: paint functions object
* @func: (closure user_data) (destroy destroy) (scope notified): budget getter
* @user_data: Data to pass to @func
* @destroy: (nullable): callback to destroy @user_data
*
* Sets the budget-policy getter callback.
*
* Since: 14.5.0
**/
paint_funcs_set_get_budget_func :: (funcs: *paint_funcs_t, func: paint_get_budget_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_paint_funcs_set_get_budget_func";

/**
* hb_paint_funcs_set_get_budget_remaining_func:
* @funcs: paint functions object
* @func: (closure user_data) (destroy destroy) (scope notified): live-budget getter
* @user_data: Data to pass to @func
* @destroy: (nullable): callback to destroy @user_data
*
* Sets the live-budget getter callback.
*
* Since: 14.5.0
**/
paint_funcs_set_get_budget_remaining_func :: (funcs: *paint_funcs_t, func: paint_get_budget_remaining_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_paint_funcs_set_get_budget_remaining_func";

paint_funcs_create :: () -> *paint_funcs_t #foreign harfbuzz "hb_paint_funcs_create";

paint_funcs_get_empty :: () -> *paint_funcs_t #foreign harfbuzz "hb_paint_funcs_get_empty";

paint_funcs_reference :: (funcs: *paint_funcs_t) -> *paint_funcs_t #foreign harfbuzz "hb_paint_funcs_reference";

paint_funcs_destroy :: (funcs: *paint_funcs_t) -> void #foreign harfbuzz "hb_paint_funcs_destroy";

paint_funcs_set_user_data :: (funcs: *paint_funcs_t, key: *user_data_key_t, data: *void, destroy: destroy_func_t, replace: bool_t) -> bool_t #foreign harfbuzz "hb_paint_funcs_set_user_data";

paint_funcs_get_user_data :: (funcs: *paint_funcs_t, key: *user_data_key_t) -> *void #foreign harfbuzz "hb_paint_funcs_get_user_data";

paint_funcs_make_immutable :: (funcs: *paint_funcs_t) -> void #foreign harfbuzz "hb_paint_funcs_make_immutable";

paint_funcs_is_immutable :: (funcs: *paint_funcs_t) -> bool_t #foreign harfbuzz "hb_paint_funcs_is_immutable";

paint_set_budget :: (funcs: *paint_funcs_t, paint_data: *void, budget: s64) -> bool_t #foreign harfbuzz "hb_paint_set_budget";

paint_get_budget :: (funcs: *paint_funcs_t, paint_data: *void) -> s64 #foreign harfbuzz "hb_paint_get_budget";

paint_get_budget_remaining :: (funcs: *paint_funcs_t, paint_data: *void) -> s64 #foreign harfbuzz "hb_paint_get_budget_remaining";

/**
* hb_paint_push_transform_func_t:
* @funcs: paint functions object
* @paint_data: The data accompanying the paint functions in hb_font_paint_glyph()
* @xx: xx component of the transform matrix
* @yx: yx component of the transform matrix
* @xy: xy component of the transform matrix
* @yy: yy component of the transform matrix
* @dx: dx component of the transform matrix
* @dy: dy component of the transform matrix
* @user_data: User data pointer passed to hb_paint_funcs_set_push_transform_func()
*
* A virtual method for the #hb_paint_funcs_t to apply
* a transform to subsequent paint calls.
*
* This transform is applied after the current transform,
* and remains in effect until a matching call to
* the #hb_paint_funcs_pop_transform_func_t vfunc.
*
* Since: 7.0.0
*/
paint_push_transform_func_t :: #type (funcs: *paint_funcs_t, paint_data: *void, _xx: float, yx: float, xy: float, yy: float, dx: float, dy: float, user_data: *void) -> void #c_call;

/**
* hb_paint_pop_transform_func_t:
* @funcs: paint functions object
* @paint_data: The data accompanying the paint functions in hb_font_paint_glyph()
* @user_data: User data pointer passed to hb_paint_funcs_set_pop_transform_func()
*
* A virtual method for the #hb_paint_funcs_t to undo
* the effect of a prior call to the #hb_paint_funcs_push_transform_func_t
* vfunc.
*
* Since: 7.0.0
*/
paint_pop_transform_func_t :: #type (funcs: *paint_funcs_t, paint_data: *void, user_data: *void) -> void #c_call;

/**
* hb_paint_color_glyph_func_t:
* @funcs: paint functions object
* @paint_data: The data accompanying the paint functions in hb_font_paint_glyph()
* @glyph: the glyph ID
* @font: the font
* @user_data: User data pointer passed to hb_paint_funcs_set_color_glyph_func()
*
* A virtual method for the #hb_paint_funcs_t to render a color glyph by glyph index.
*
* Return value: `true` if the glyph was painted, `false` otherwise.
*
* Since: 8.2.0
*/
paint_color_glyph_func_t :: #type (funcs: *paint_funcs_t, paint_data: *void, glyph: codepoint_t, font: *font_t, user_data: *void) -> bool_t #c_call;

/**
* hb_paint_fill_glyph_func_t:
* @funcs: paint functions object
* @paint_data: The data accompanying the paint functions in hb_font_paint_glyph()
* @glyph: the glyph ID
* @font: the font
* @is_foreground: whether the color is the foreground
* @color: The color to use, unpremultiplied
* @user_data: User data pointer passed to hb_paint_funcs_set_fill_glyph_func()
*
* A virtual method for the #hb_paint_funcs_t to fill a glyph's shape with
* a solid color. If not implemented, a sequence of "push-clip-glyph",
* "color", "pop-clip" paint operations, in that order, will be emitted
* instead.
*
* Since: 14.3.0
*/
paint_fill_glyph_func_t :: #type (funcs: *paint_funcs_t, paint_data: *void, glyph: codepoint_t, font: *font_t, is_foreground: bool_t, color: color_t, user_data: *void) -> void #c_call;

/**
* hb_paint_push_clip_glyph_func_t:
* @funcs: paint functions object
* @paint_data: The data accompanying the paint functions in hb_font_paint_glyph()
* @glyph: the glyph ID
* @font: the font
* @user_data: User data pointer passed to hb_paint_funcs_set_push_clip_glyph_func()
*
* A virtual method for the #hb_paint_funcs_t to clip
* subsequent paint calls to the outline of a glyph.
*
* The coordinates of the glyph outline are expected in the
* current @font scale (ie. the results of calling
* hb_font_draw_glyph() with @font). The outline is
* transformed by the current transform.
*
* This clip is applied in addition to the current clip,
* and remains in effect until a matching call to
* the #hb_paint_funcs_pop_clip_func_t vfunc.
*
* Since: 7.0.0
*/
paint_push_clip_glyph_func_t :: #type (funcs: *paint_funcs_t, paint_data: *void, glyph: codepoint_t, font: *font_t, user_data: *void) -> void #c_call;

/**
* hb_paint_push_clip_rectangle_func_t:
* @funcs: paint functions object
* @paint_data: The data accompanying the paint functions in hb_font_paint_glyph()
* @xmin: min X for the rectangle
* @ymin: min Y for the rectangle
* @xmax: max X for the rectangle
* @ymax: max Y for the rectangle
* @user_data: User data pointer passed to hb_paint_funcs_set_push_clip_rectangle_func()
*
* A virtual method for the #hb_paint_funcs_t to clip
* subsequent paint calls to a rectangle.
*
* The coordinates of the rectangle are interpreted according
* to the current transform.
*
* This clip is applied in addition to the current clip,
* and remains in effect until a matching call to
* the #hb_paint_funcs_pop_clip_func_t vfunc.
*
* Since: 7.0.0
*/
paint_push_clip_rectangle_func_t :: #type (funcs: *paint_funcs_t, paint_data: *void, xmin: float, ymin: float, xmax: float, ymax: float, user_data: *void) -> void #c_call;

/**
* hb_paint_push_clip_path_start_func_t:
* @funcs: paint functions object
* @paint_data: The data accompanying the paint functions in hb_font_paint_glyph()
* @draw_data: (out): location to store the draw data the caller should
*   pass alongside the returned draw funcs.
* @user_data: User data pointer passed to hb_paint_funcs_set_push_clip_path_start_func()
*
* A virtual method for the #hb_paint_funcs_t to begin clipping
* to an arbitrary path.  The backend returns an
* #hb_draw_funcs_t it owns (the caller must not free it)
* that the caller feeds the clip outline to via hb_draw_*()
* calls, plus a @draw_data value to pass alongside those
* calls.  Both are only valid until the matching
* #hb_paint_push_clip_path_end_func_t call; no other paint
* calls should be made in between.  The clip remains
* in effect until a later #hb_paint_pop_clip_func_t call.
*
* Return value: (transfer none): draw funcs that accumulate
*   the clip path, or `NULL` if arbitrary-path clipping is not
*   supported.
*
* Since: 14.2.0
*/
paint_push_clip_path_start_func_t :: #type (funcs: *paint_funcs_t, paint_data: *void, draw_data: **void, user_data: *void) -> *draw_funcs_t #c_call;

/**
* hb_paint_push_clip_path_end_func_t:
* @funcs: paint functions object
* @paint_data: The data accompanying the paint functions in hb_font_paint_glyph()
* @user_data: User data pointer passed to hb_paint_funcs_set_push_clip_path_end_func()
*
* A virtual method for the #hb_paint_funcs_t to close the
* clip path started by the #hb_paint_push_clip_path_start_func_t
* vfunc.  The emitted path is now active as a clip; subsequent
* paint ops are masked by it until a matching
* #hb_paint_pop_clip_func_t call.
*
* Since: 14.2.0
*/
paint_push_clip_path_end_func_t :: #type (funcs: *paint_funcs_t, paint_data: *void, user_data: *void) -> void #c_call;

/**
* hb_paint_pop_clip_func_t:
* @funcs: paint functions object
* @paint_data: The data accompanying the paint functions in hb_font_paint_glyph()
* @user_data: User data pointer passed to hb_paint_funcs_set_pop_clip_func()
*
* A virtual method for the #hb_paint_funcs_t to undo
* the effect of a prior call to the #hb_paint_funcs_push_clip_glyph_func_t,
* #hb_paint_funcs_push_clip_rectangle_func_t, or
* #hb_paint_funcs_push_clip_path_end_func_t vfuncs.
*
* Since: 7.0.0
*/
paint_pop_clip_func_t :: #type (funcs: *paint_funcs_t, paint_data: *void, user_data: *void) -> void #c_call;

/**
* hb_paint_color_func_t:
* @funcs: paint functions object
* @paint_data: The data accompanying the paint functions in hb_font_paint_glyph()
* @is_foreground: whether the color is the foreground
* @color: The color to use, unpremultiplied
* @user_data: User data pointer passed to hb_paint_funcs_set_color_func()
*
* A virtual method for the #hb_paint_funcs_t to paint a
* color everywhere within the current clip.
*
* When @is_foreground is true, this color originates from the
* foreground-color sentinel in the font's color data.  The
* @color parameter still carries a fully resolved RGBA value
* (with any paint-tree alpha already applied), so backends
* that do not need to distinguish the foreground can simply
* use @color directly.
*
* Backends that defer foreground resolution (e.g. to honor a
* CSS `currentColor` or a runtime uniform) should substitute
* their own foreground RGB when @is_foreground is true, but
* must combine the alpha from @color with their foreground
* alpha, since it encodes additional modulation from the
* paint tree.  For this mode to work correctly, the caller
* should pass a fully-opaque foreground color to
* hb_font_paint_glyph(), so that the alpha in @color
* reflects only the paint-tree contribution.
*
* Since: 7.0.0
*/
paint_color_func_t :: #type (funcs: *paint_funcs_t, paint_data: *void, is_foreground: bool_t, color: color_t, user_data: *void) -> void #c_call;

/**
* hb_paint_image_func_t:
* @funcs: paint functions object
* @paint_data: The data accompanying the paint functions in hb_font_paint_glyph()
* @image: the image data
* @width: width of the raster image in pixels, or 0
* @height: height of the raster image in pixels, or 0
* @format: the image format as a tag
* @slant: Deprecated. Always set to 0.0.
* @extents: (nullable): glyph extents for desired rendering
* @user_data: User data pointer passed to hb_paint_funcs_set_image_func()
*
* A virtual method for the #hb_paint_funcs_t to paint a glyph image.
*
* This method is called for glyphs with image blobs in the CBDT,
* sbix or SVG tables. The @format identifies the kind of data that
* is contained in @image. Possible values include #HB_PAINT_IMAGE_FORMAT_PNG,
* #HB_PAINT_IMAGE_FORMAT_SVG and #HB_PAINT_IMAGE_FORMAT_BGRA.
*
* The image dimensions and glyph extents are provided if available,
* and should be used to size and position the image.
*
* Return value: Whether the operation was successful.
*
* Since: 7.0.0
*/
paint_image_func_t :: #type (funcs: *paint_funcs_t, paint_data: *void, image: *blob_t, width: u32, height: u32, format: tag_t, slant: float, extents: *glyph_extents_t, user_data: *void) -> bool_t #c_call;

/**
* hb_color_stop_t:
* @offset: the offset of the color stop
* @is_foreground: whether the color is the foreground
* @color: the color, unpremultiplied
*
* Information about a color stop on a color line.
*
* Color lines typically have offsets ranging between 0 and 1,
* but that is not required.
*
* The @is_foreground and @color fields have the same semantics
* as in #hb_paint_color_func_t.
*
* Note: despite @color being unpremultiplied here, interpolation in
* gradients shall happen in premultiplied space. See the OpenType spec
* [COLR](https://learn.microsoft.com/en-us/typography/opentype/spec/colr)
* section for details.
*
* Since: 7.0.0
*/
color_stop_t :: struct {
    offset:        float;
    is_foreground: bool_t;
    color:         color_t;
}

/**
* hb_paint_extend_t:
* @HB_PAINT_EXTEND_PAD: Outside the defined interval,
*   the color of the closest color stop is used.
* @HB_PAINT_EXTEND_REPEAT: The color line is repeated over
*   repeated multiples of the defined interval
* @HB_PAINT_EXTEND_REFLECT: The color line is repeated over
*      repeated intervals, as for the repeat mode.
*      However, in each repeated interval, the ordering of
*      color stops is the reverse of the adjacent interval.
*
* The values of this enumeration determine how color values
* outside the minimum and maximum defined offset on a #hb_color_line_t
* are determined.
*
* See the OpenType spec [COLR](https://learn.microsoft.com/en-us/typography/opentype/spec/colr)
* section for details.
*
* Since: 7.0.0
*/
paint_extend_t :: enum s32 {
    PAD     :: 0;
    REPEAT  :: 1;
    REFLECT :: 2;

    HB_PAINT_EXTEND_PAD     :: PAD;
    HB_PAINT_EXTEND_REPEAT  :: REPEAT;
    HB_PAINT_EXTEND_REFLECT :: REFLECT;
}

/**
* hb_color_line_get_color_stops_func_t:
* @color_line: a #hb_color_line_t object
* @color_line_data: the data accompanying @color_line
* @start: the index of the first color stop to return
* @count: (inout) (optional): Input = the maximum number of feature tags to return;
*     Output = the actual number of feature tags returned (may be zero)
* @color_stops: (out) (array length=count) (optional): Array of #hb_color_stop_t to populate
* @user_data: the data accompanying this method
*
* A virtual method for the #hb_color_line_t to fetch color stops.
*
* Return value: the total number of color stops in @color_line
*
* Since: 7.0.0
*/
color_line_get_color_stops_func_t :: #type (color_line: *color_line_t, color_line_data: *void, start: u32, count: *u32, color_stops: *color_stop_t, user_data: *void) -> u32 #c_call;

/**
* hb_color_line_get_extend_func_t:
* @color_line: a #hb_color_line_t object
* @color_line_data: the data accompanying @color_line
* @user_data: the data accompanying this method
*
* A virtual method for the @hb_color_line_t to fetches the extend mode.
*
* Return value: the extend mode of @color_line
*
* Since: 7.0.0
*/
color_line_get_extend_func_t :: #type (color_line: *color_line_t, color_line_data: *void, user_data: *void) -> paint_extend_t #c_call;

/**
* hb_color_line_t:
*
* A struct containing color information for a gradient.
*
* Since: 7.0.0
*/
color_line_t :: struct {
    data:                      *void;

    get_color_stops:           color_line_get_color_stops_func_t;
    get_color_stops_user_data: *void;

    get_extend:                color_line_get_extend_func_t;
    get_extend_user_data:      *void;

    reserved0:                 *void;
    reserved1:                 *void;
    reserved2:                 *void;
    reserved3:                 *void;
    reserved5:                 *void;
    reserved6:                 *void;
    reserved7:                 *void;
    reserved8:                 *void;
}

color_line_get_color_stops :: (color_line: *color_line_t, start: u32, count: *u32, color_stops: *color_stop_t) -> u32 #foreign harfbuzz "hb_color_line_get_color_stops";

color_line_get_extend :: (color_line: *color_line_t) -> paint_extend_t #foreign harfbuzz "hb_color_line_get_extend";

/**
* hb_paint_linear_gradient_func_t:
* @funcs: paint functions object
* @paint_data: The data accompanying the paint functions in hb_font_paint_glyph()
* @color_line: Color information for the gradient
* @x0: X coordinate of the first point
* @y0: Y coordinate of the first point
* @x1: X coordinate of the second point
* @y1: Y coordinate of the second point
* @x2: X coordinate of the third point
* @y2: Y coordinate of the third point
* @user_data: User data pointer passed to hb_paint_funcs_set_linear_gradient_func()
*
* A virtual method for the #hb_paint_funcs_t to paint a linear
* gradient everywhere within the current clip.
*
* The @color_line object contains information about the colors of the gradients.
* It is only valid for the duration of the callback, you cannot keep it around.
*
* The coordinates of the points are interpreted according
* to the current transform.
*
* See the OpenType spec [COLR](https://learn.microsoft.com/en-us/typography/opentype/spec/colr)
* section for details on how the points define the direction
* of the gradient, and how to interpret the @color_line.
*
* Since: 7.0.0
*/
paint_linear_gradient_func_t :: #type (funcs: *paint_funcs_t, paint_data: *void, color_line: *color_line_t, x0: float, y0: float, x1: float, y1: float, x2: float, y2: float, user_data: *void) -> void #c_call;

/**
* hb_paint_radial_gradient_func_t:
* @funcs: paint functions object
* @paint_data: The data accompanying the paint functions in hb_font_paint_glyph()
* @color_line: Color information for the gradient
* @x0: X coordinate of the first circle's center
* @y0: Y coordinate of the first circle's center
* @r0: radius of the first circle
* @x1: X coordinate of the second circle's center
* @y1: Y coordinate of the second circle's center
* @r1: radius of the second circle
* @user_data: User data pointer passed to hb_paint_funcs_set_radial_gradient_func()
*
* A virtual method for the #hb_paint_funcs_t to paint a radial
* gradient everywhere within the current clip.
*
* The @color_line object contains information about the colors of the gradients.
* It is only valid for the duration of the callback, you cannot keep it around.
*
* The coordinates of the points are interpreted according
* to the current transform.
*
* See the OpenType spec [COLR](https://learn.microsoft.com/en-us/typography/opentype/spec/colr)
* section for details on how the points define the direction
* of the gradient, and how to interpret the @color_line.
*
* Since: 7.0.0
*/
paint_radial_gradient_func_t :: #type (funcs: *paint_funcs_t, paint_data: *void, color_line: *color_line_t, x0: float, y0: float, r0: float, x1: float, y1: float, r1: float, user_data: *void) -> void #c_call;

/**
* hb_paint_sweep_gradient_func_t:
* @funcs: paint functions object
* @paint_data: The data accompanying the paint functions in hb_font_paint_glyph()
* @color_line: Color information for the gradient
* @x0: X coordinate of the circle's center
* @y0: Y coordinate of the circle's center
* @start_angle: the start angle, in radians
* @end_angle: the end angle, in radians
* @user_data: User data pointer passed to hb_paint_funcs_set_sweep_gradient_func()
*
* A virtual method for the #hb_paint_funcs_t to paint a sweep
* gradient everywhere within the current clip.
*
* The @color_line object contains information about the colors of the gradients.
* It is only valid for the duration of the callback, you cannot keep it around.
*
* The coordinates of the points are interpreted according
* to the current transform.
*
* See the OpenType spec [COLR](https://learn.microsoft.com/en-us/typography/opentype/spec/colr)
* section for details on how the points define the direction
* of the gradient, and how to interpret the @color_line.
*
* Since: 7.0.0
*/
paint_sweep_gradient_func_t :: #type (funcs: *paint_funcs_t, paint_data: *void, color_line: *color_line_t, x0: float, y0: float, start_angle: float, end_angle: float, user_data: *void) -> void #c_call;

/**
* hb_paint_composite_mode_t:
* @HB_PAINT_COMPOSITE_MODE_CLEAR: clear destination layer (bounded)
* @HB_PAINT_COMPOSITE_MODE_SRC: replace destination layer (bounded)
* @HB_PAINT_COMPOSITE_MODE_SRC_OVER: draw source layer on top of destination layer
* (bounded)
* @HB_PAINT_COMPOSITE_MODE_SRC_IN: draw source where there was destination content
* (unbounded)
* @HB_PAINT_COMPOSITE_MODE_SRC_OUT: draw source where there was no destination
* content (unbounded)
* @HB_PAINT_COMPOSITE_MODE_SRC_ATOP: draw source on top of destination content and
* only there
* @HB_PAINT_COMPOSITE_MODE_DEST: ignore the source
* @HB_PAINT_COMPOSITE_MODE_DEST_OVER: draw destination on top of source
* @HB_PAINT_COMPOSITE_MODE_DEST_IN: leave destination only where there was
* source content (unbounded)
* @HB_PAINT_COMPOSITE_MODE_DEST_OUT: leave destination only where there was no
* source content
* @HB_PAINT_COMPOSITE_MODE_DEST_ATOP: leave destination on top of source content
* and only there (unbounded)
* @HB_PAINT_COMPOSITE_MODE_XOR: source and destination are shown where there is only
* one of them
* @HB_PAINT_COMPOSITE_MODE_PLUS: source and destination layers are accumulated
* @HB_PAINT_COMPOSITE_MODE_MULTIPLY: source and destination layers are multiplied.
* This causes the result to be at least as dark as the darker inputs.
* @HB_PAINT_COMPOSITE_MODE_SCREEN: source and destination are complemented and
* multiplied. This causes the result to be at least as light as the lighter
* inputs.
* @HB_PAINT_COMPOSITE_MODE_OVERLAY: multiplies or screens, depending on the
* lightness of the destination color.
* @HB_PAINT_COMPOSITE_MODE_DARKEN: replaces the destination with the source if it
* is darker, otherwise keeps the source.
* @HB_PAINT_COMPOSITE_MODE_LIGHTEN: replaces the destination with the source if it
* is lighter, otherwise keeps the source.
* @HB_PAINT_COMPOSITE_MODE_COLOR_DODGE: brightens the destination color to reflect
* the source color.
* @HB_PAINT_COMPOSITE_MODE_COLOR_BURN: darkens the destination color to reflect
* the source color.
* @HB_PAINT_COMPOSITE_MODE_HARD_LIGHT: Multiplies or screens, dependent on source
* color.
* @HB_PAINT_COMPOSITE_MODE_SOFT_LIGHT: Darkens or lightens, dependent on source
* color.
* @HB_PAINT_COMPOSITE_MODE_DIFFERENCE: Takes the difference of the source and
* destination color.
* @HB_PAINT_COMPOSITE_MODE_EXCLUSION: Produces an effect similar to difference, but
* with lower contrast.
* @HB_PAINT_COMPOSITE_MODE_HSL_HUE: Creates a color with the hue of the source
* and the saturation and luminosity of the target.
* @HB_PAINT_COMPOSITE_MODE_HSL_SATURATION: Creates a color with the saturation
* of the source and the hue and luminosity of the target. Painting with
* this mode onto a gray area produces no change.
* @HB_PAINT_COMPOSITE_MODE_HSL_COLOR: Creates a color with the hue and saturation
* of the source and the luminosity of the target. This preserves the gray
* levels of the target and is useful for coloring monochrome images or
* tinting color images.
* @HB_PAINT_COMPOSITE_MODE_HSL_LUMINOSITY: Creates a color with the luminosity of
* the source and the hue and saturation of the target. This produces an
* inverse effect to @HB_PAINT_COMPOSITE_MODE_HSL_COLOR.
*
* The values of this enumeration describe the compositing modes
* that can be used when combining temporary redirected drawing
* with the backdrop.
*
* See the OpenType spec [COLR](https://learn.microsoft.com/en-us/typography/opentype/spec/colr)
* section for details.
*
* Since: 7.0.0
*/
paint_composite_mode_t :: enum s32 {
    CLEAR          :: 0;
    SRC            :: 1;
    DEST           :: 2;
    SRC_OVER       :: 3;
    DEST_OVER      :: 4;
    SRC_IN         :: 5;
    DEST_IN        :: 6;
    SRC_OUT        :: 7;
    DEST_OUT       :: 8;
    SRC_ATOP       :: 9;
    DEST_ATOP      :: 10;
    XOR            :: 11;
    PLUS           :: 12;
    SCREEN         :: 13;
    OVERLAY        :: 14;
    DARKEN         :: 15;
    LIGHTEN        :: 16;
    COLOR_DODGE    :: 17;
    COLOR_BURN     :: 18;
    HARD_LIGHT     :: 19;
    SOFT_LIGHT     :: 20;
    DIFFERENCE     :: 21;
    EXCLUSION      :: 22;
    MULTIPLY       :: 23;
    HSL_HUE        :: 24;
    HSL_SATURATION :: 25;
    HSL_COLOR      :: 26;
    HSL_LUMINOSITY :: 27;

    HB_PAINT_COMPOSITE_MODE_CLEAR          :: CLEAR;
    HB_PAINT_COMPOSITE_MODE_SRC            :: SRC;
    HB_PAINT_COMPOSITE_MODE_DEST           :: DEST;
    HB_PAINT_COMPOSITE_MODE_SRC_OVER       :: SRC_OVER;
    HB_PAINT_COMPOSITE_MODE_DEST_OVER      :: DEST_OVER;
    HB_PAINT_COMPOSITE_MODE_SRC_IN         :: SRC_IN;
    HB_PAINT_COMPOSITE_MODE_DEST_IN        :: DEST_IN;
    HB_PAINT_COMPOSITE_MODE_SRC_OUT        :: SRC_OUT;
    HB_PAINT_COMPOSITE_MODE_DEST_OUT       :: DEST_OUT;
    HB_PAINT_COMPOSITE_MODE_SRC_ATOP       :: SRC_ATOP;
    HB_PAINT_COMPOSITE_MODE_DEST_ATOP      :: DEST_ATOP;
    HB_PAINT_COMPOSITE_MODE_XOR            :: XOR;
    HB_PAINT_COMPOSITE_MODE_PLUS           :: PLUS;
    HB_PAINT_COMPOSITE_MODE_SCREEN         :: SCREEN;
    HB_PAINT_COMPOSITE_MODE_OVERLAY        :: OVERLAY;
    HB_PAINT_COMPOSITE_MODE_DARKEN         :: DARKEN;
    HB_PAINT_COMPOSITE_MODE_LIGHTEN        :: LIGHTEN;
    HB_PAINT_COMPOSITE_MODE_COLOR_DODGE    :: COLOR_DODGE;
    HB_PAINT_COMPOSITE_MODE_COLOR_BURN     :: COLOR_BURN;
    HB_PAINT_COMPOSITE_MODE_HARD_LIGHT     :: HARD_LIGHT;
    HB_PAINT_COMPOSITE_MODE_SOFT_LIGHT     :: SOFT_LIGHT;
    HB_PAINT_COMPOSITE_MODE_DIFFERENCE     :: DIFFERENCE;
    HB_PAINT_COMPOSITE_MODE_EXCLUSION      :: EXCLUSION;
    HB_PAINT_COMPOSITE_MODE_MULTIPLY       :: MULTIPLY;
    HB_PAINT_COMPOSITE_MODE_HSL_HUE        :: HSL_HUE;
    HB_PAINT_COMPOSITE_MODE_HSL_SATURATION :: HSL_SATURATION;
    HB_PAINT_COMPOSITE_MODE_HSL_COLOR      :: HSL_COLOR;
    HB_PAINT_COMPOSITE_MODE_HSL_LUMINOSITY :: HSL_LUMINOSITY;
}

/**
* hb_paint_push_group_func_t:
* @funcs: paint functions object
* @paint_data: The data accompanying the paint functions in hb_font_paint_glyph()
* @user_data: User data pointer passed to hb_paint_funcs_set_push_group_func()
*
* A virtual method for the #hb_paint_funcs_t to use
* an intermediate surface for subsequent paint calls.
*
* The drawing will be redirected to an intermediate surface
* until a matching call to the #hb_paint_funcs_pop_group_func_t
* vfunc.
*
* Since: 7.0.0
*/
paint_push_group_func_t :: #type (funcs: *paint_funcs_t, paint_data: *void, user_data: *void) -> void #c_call;

/**
* hb_paint_push_group_for_func_t:
* @funcs: paint functions object
* @paint_data: The data accompanying the paint functions in hb_font_paint_glyph()
* @mode: the compositing mode that will be used when the group is popped
* @user_data: User data pointer passed to hb_paint_funcs_set_push_group_for_func()
*
* A virtual method for the #hb_paint_funcs_t to use
* an intermediate surface for subsequent paint calls,
* with the compositing mode known in advance.
*
* This is like #hb_paint_push_group_func_t, but the
* compositing mode is provided at push time. By default
* this calls #hb_paint_push_group_func_t.
*
* Since: 14.2.0
*/
paint_push_group_for_func_t :: #type (funcs: *paint_funcs_t, paint_data: *void, mode: paint_composite_mode_t, user_data: *void) -> void #c_call;

/**
* hb_paint_pop_group_func_t:
* @funcs: paint functions object
* @paint_data: The data accompanying the paint functions in hb_font_paint_glyph()
* @mode: the compositing mode to use
* @user_data: User data pointer passed to hb_paint_funcs_set_pop_group_func()
*
* A virtual method for the #hb_paint_funcs_t to undo
* the effect of a prior call to the #hb_paint_funcs_push_group_func_t
* vfunc.
*
* This call stops the redirection to the intermediate surface,
* and then composites it on the previous surface, using the
* compositing mode passed to this call.
*
* Since: 7.0.0
*/
paint_pop_group_func_t :: #type (funcs: *paint_funcs_t, paint_data: *void, mode: paint_composite_mode_t, user_data: *void) -> void #c_call;

/**
* hb_paint_custom_palette_color_func_t:
* @funcs: paint functions object.
* @paint_data: data accompanying the paint functions in hb_font_paint_glyph().
* @color_index: color index to fetch.
* @color: (out): fetched color.
* @user_data: user data pointer passed to hb_paint_funcs_set_custom_palette_color_func().
*
* A virtual method for #hb_paint_funcs_t to fetch a custom palette override
* color for @color_index.
*
* Custom palette colors override colors from the font's selected color palette.
* It is not necessary to override all palette entries; return `false` for
* entries that should be taken from the font palette.
*
* This function might be called multiple times, but the custom palette is
* expected to remain unchanged for the duration of one
* hb_font_paint_glyph() call.
*
* Return value: `true` if a custom color is provided, `false` otherwise.
*
* Since: 7.0.0
*/
paint_custom_palette_color_func_t :: #type (funcs: *paint_funcs_t, paint_data: *void, color_index: u32, color: *color_t, user_data: *void) -> bool_t #c_call;

/**
* hb_paint_funcs_set_push_transform_func:
* @funcs: A paint functions struct
* @func: (closure user_data) (destroy destroy) (scope notified): The push-transform callback
* @user_data: Data to pass to @func
* @destroy: (nullable): Function to call when @user_data is no longer needed
*
* Sets the push-transform callback on the paint functions struct.
*
* Since: 7.0.0
*/
paint_funcs_set_push_transform_func :: (funcs: *paint_funcs_t, func: paint_push_transform_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_paint_funcs_set_push_transform_func";

/**
* hb_paint_funcs_set_pop_transform_func:
* @funcs: A paint functions struct
* @func: (closure user_data) (destroy destroy) (scope notified): The pop-transform callback
* @user_data: Data to pass to @func
* @destroy: (nullable): Function to call when @user_data is no longer needed
*
* Sets the pop-transform callback on the paint functions struct.
*
* Since: 7.0.0
*/
paint_funcs_set_pop_transform_func :: (funcs: *paint_funcs_t, func: paint_pop_transform_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_paint_funcs_set_pop_transform_func";

/**
* hb_paint_funcs_set_color_glyph_func:
* @funcs: A paint functions struct
* @func: (closure user_data) (destroy destroy) (scope notified): The color-glyph callback
* @user_data: Data to pass to @func
* @destroy: (nullable): Function to call when @user_data is no longer needed
*
* Sets the color-glyph callback on the paint functions struct.
*
* Since: 8.2.0
*/
paint_funcs_set_color_glyph_func :: (funcs: *paint_funcs_t, func: paint_color_glyph_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_paint_funcs_set_color_glyph_func";

/**
* hb_paint_funcs_set_fill_glyph_func:
* @funcs: A paint functions struct
* @func: (closure user_data) (destroy destroy) (scope notified): The fill-glyph callback
* @user_data: Data to pass to @func
* @destroy: (nullable): Function to call when @user_data is no longer needed
*
* Sets the fill-glyph callback on the paint functions struct.
*
* Since: 14.3.0
*/
paint_funcs_set_fill_glyph_func :: (funcs: *paint_funcs_t, func: paint_fill_glyph_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_paint_funcs_set_fill_glyph_func";

/**
* hb_paint_funcs_set_push_clip_glyph_func:
* @funcs: A paint functions struct
* @func: (closure user_data) (destroy destroy) (scope notified): The push-clip-glyph callback
* @user_data: Data to pass to @func
* @destroy: (nullable): Function to call when @user_data is no longer needed
*
* Sets the push-clip-glyph callback on the paint functions struct.
*
* Since: 7.0.0
*/
paint_funcs_set_push_clip_glyph_func :: (funcs: *paint_funcs_t, func: paint_push_clip_glyph_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_paint_funcs_set_push_clip_glyph_func";

/**
* hb_paint_funcs_set_push_clip_rectangle_func:
* @funcs: A paint functions struct
* @func: (closure user_data) (destroy destroy) (scope notified): The push-clip-rectangle callback
* @user_data: Data to pass to @func
* @destroy: (nullable): Function to call when @user_data is no longer needed
*
* Sets the push-clip-rect callback on the paint functions struct.
*
* Since: 7.0.0
*/
paint_funcs_set_push_clip_rectangle_func :: (funcs: *paint_funcs_t, func: paint_push_clip_rectangle_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_paint_funcs_set_push_clip_rectangle_func";

/**
* hb_paint_funcs_set_push_clip_path_start_func:
* @funcs: A paint functions struct
* @func: (closure user_data) (destroy destroy) (scope notified): The push-clip-path-start callback
* @user_data: Data to pass to @func
* @destroy: (nullable): Function to call when @user_data is no longer needed
*
* Sets the push-clip-path-start callback on the paint functions struct.
*
* Since: 14.2.0
*/
paint_funcs_set_push_clip_path_start_func :: (funcs: *paint_funcs_t, func: paint_push_clip_path_start_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_paint_funcs_set_push_clip_path_start_func";

/**
* hb_paint_funcs_set_push_clip_path_end_func:
* @funcs: A paint functions struct
* @func: (closure user_data) (destroy destroy) (scope notified): The push-clip-path-end callback
* @user_data: Data to pass to @func
* @destroy: (nullable): Function to call when @user_data is no longer needed
*
* Sets the push-clip-path-end callback on the paint functions struct.
*
* Since: 14.2.0
*/
paint_funcs_set_push_clip_path_end_func :: (funcs: *paint_funcs_t, func: paint_push_clip_path_end_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_paint_funcs_set_push_clip_path_end_func";

/**
* hb_paint_funcs_set_pop_clip_func:
* @funcs: A paint functions struct
* @func: (closure user_data) (destroy destroy) (scope notified): The pop-clip callback
* @user_data: Data to pass to @func
* @destroy: (nullable): Function to call when @user_data is no longer needed
*
* Sets the pop-clip callback on the paint functions struct.
*
* Since: 7.0.0
*/
paint_funcs_set_pop_clip_func :: (funcs: *paint_funcs_t, func: paint_pop_clip_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_paint_funcs_set_pop_clip_func";

/**
* hb_paint_funcs_set_color_func:
* @funcs: A paint functions struct
* @func: (closure user_data) (destroy destroy) (scope notified): The paint-color callback
* @user_data: Data to pass to @func
* @destroy: (nullable): Function to call when @user_data is no longer needed
*
* Sets the paint-color callback on the paint functions struct.
*
* Since: 7.0.0
*/
paint_funcs_set_color_func :: (funcs: *paint_funcs_t, func: paint_color_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_paint_funcs_set_color_func";

/**
* hb_paint_funcs_set_image_func:
* @funcs: A paint functions struct
* @func: (closure user_data) (destroy destroy) (scope notified): The paint-image callback
* @user_data: Data to pass to @func
* @destroy: (nullable): Function to call when @user_data is no longer needed
*
* Sets the paint-image callback on the paint functions struct.
*
* Since: 7.0.0
*/
paint_funcs_set_image_func :: (funcs: *paint_funcs_t, func: paint_image_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_paint_funcs_set_image_func";

/**
* hb_paint_funcs_set_linear_gradient_func:
* @funcs: A paint functions struct
* @func: (closure user_data) (destroy destroy) (scope notified): The linear-gradient callback
* @user_data: Data to pass to @func
* @destroy: (nullable): Function to call when @user_data is no longer needed
*
* Sets the linear-gradient callback on the paint functions struct.
*
* Since: 7.0.0
*/
paint_funcs_set_linear_gradient_func :: (funcs: *paint_funcs_t, func: paint_linear_gradient_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_paint_funcs_set_linear_gradient_func";

/**
* hb_paint_funcs_set_radial_gradient_func:
* @funcs: A paint functions struct
* @func: (closure user_data) (destroy destroy) (scope notified): The radial-gradient callback
* @user_data: Data to pass to @func
* @destroy: (nullable): Function to call when @user_data is no longer needed
*
* Sets the radial-gradient callback on the paint functions struct.
*
* Since: 7.0.0
*/
paint_funcs_set_radial_gradient_func :: (funcs: *paint_funcs_t, func: paint_radial_gradient_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_paint_funcs_set_radial_gradient_func";

/**
* hb_paint_funcs_set_sweep_gradient_func:
* @funcs: A paint functions struct
* @func: (closure user_data) (destroy destroy) (scope notified): The sweep-gradient callback
* @user_data: Data to pass to @func
* @destroy: (nullable): Function to call when @user_data is no longer needed
*
* Sets the sweep-gradient callback on the paint functions struct.
*
* Since: 7.0.0
*/
paint_funcs_set_sweep_gradient_func :: (funcs: *paint_funcs_t, func: paint_sweep_gradient_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_paint_funcs_set_sweep_gradient_func";

/**
* hb_paint_funcs_set_push_group_func:
* @funcs: A paint functions struct
* @func: (closure user_data) (destroy destroy) (scope notified): The push-group callback
* @user_data: Data to pass to @func
* @destroy: (nullable): Function to call when @user_data is no longer needed
*
* Sets the push-group callback on the paint functions struct.
*
* Since: 7.0.0
*/
paint_funcs_set_push_group_func :: (funcs: *paint_funcs_t, func: paint_push_group_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_paint_funcs_set_push_group_func";

/**
* hb_paint_funcs_set_push_group_for_func:
* @funcs: A paint functions struct
* @func: (closure user_data) (destroy destroy) (scope notified): The push-group-for callback
* @user_data: Data to pass to @func
* @destroy: (nullable): Function to call when @user_data is no longer needed
*
* Sets the push-group-for callback on the paint functions struct.
*
* Since: 14.2.0
*/
paint_funcs_set_push_group_for_func :: (funcs: *paint_funcs_t, func: paint_push_group_for_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_paint_funcs_set_push_group_for_func";

/**
* hb_paint_funcs_set_pop_group_func:
* @funcs: A paint functions struct
* @func: (closure user_data) (destroy destroy) (scope notified): The pop-group callback
* @user_data: Data to pass to @func
* @destroy: (nullable): Function to call when @user_data is no longer needed
*
* Sets the pop-group callback on the paint functions struct.
*
* Since: 7.0.0
*/
paint_funcs_set_pop_group_func :: (funcs: *paint_funcs_t, func: paint_pop_group_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_paint_funcs_set_pop_group_func";

/**
* hb_paint_funcs_set_custom_palette_color_func:
* @funcs: a paint functions struct.
* @func: (closure user_data) (destroy destroy) (scope notified): custom-palette-color callback.
* @user_data: data to pass to @func.
* @destroy: (nullable): function to call when @user_data is no longer needed.
*
* Sets the custom-palette-color callback on @funcs.
*
* Since: 7.0.0
*/
paint_funcs_set_custom_palette_color_func :: (funcs: *paint_funcs_t, func: paint_custom_palette_color_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_paint_funcs_set_custom_palette_color_func";

/*
* Manual API
*/
paint_push_transform :: (funcs: *paint_funcs_t, paint_data: *void, _xx: float, yx: float, xy: float, yy: float, dx: float, dy: float) -> void #foreign harfbuzz "hb_paint_push_transform";

paint_push_font_transform :: (funcs: *paint_funcs_t, paint_data: *void, font: *font_t) -> void #foreign harfbuzz "hb_paint_push_font_transform";

paint_push_inverse_font_transform :: (funcs: *paint_funcs_t, paint_data: *void, font: *font_t) -> void #foreign harfbuzz "hb_paint_push_inverse_font_transform";

paint_pop_transform :: (funcs: *paint_funcs_t, paint_data: *void) -> void #foreign harfbuzz "hb_paint_pop_transform";

paint_color_glyph :: (funcs: *paint_funcs_t, paint_data: *void, glyph: codepoint_t, font: *font_t) -> bool_t #foreign harfbuzz "hb_paint_color_glyph";

paint_fill_glyph :: (funcs: *paint_funcs_t, paint_data: *void, glyph: codepoint_t, font: *font_t, is_foreground: bool_t, color: color_t) -> void #foreign harfbuzz "hb_paint_fill_glyph";

paint_push_clip_glyph :: (funcs: *paint_funcs_t, paint_data: *void, glyph: codepoint_t, font: *font_t) -> void #foreign harfbuzz "hb_paint_push_clip_glyph";

paint_push_clip_rectangle :: (funcs: *paint_funcs_t, paint_data: *void, xmin: float, ymin: float, xmax: float, ymax: float) -> void #foreign harfbuzz "hb_paint_push_clip_rectangle";

paint_push_clip_path_start :: (funcs: *paint_funcs_t, paint_data: *void, draw_data: **void) -> *draw_funcs_t #foreign harfbuzz "hb_paint_push_clip_path_start";

paint_push_clip_path_end :: (funcs: *paint_funcs_t, paint_data: *void) -> void #foreign harfbuzz "hb_paint_push_clip_path_end";

paint_pop_clip :: (funcs: *paint_funcs_t, paint_data: *void) -> void #foreign harfbuzz "hb_paint_pop_clip";

paint_color :: (funcs: *paint_funcs_t, paint_data: *void, is_foreground: bool_t, color: color_t) -> void #foreign harfbuzz "hb_paint_color";

paint_image :: (funcs: *paint_funcs_t, paint_data: *void, image: *blob_t, width: u32, height: u32, format: tag_t, slant: float, extents: *glyph_extents_t) -> void #foreign harfbuzz "hb_paint_image";

paint_linear_gradient :: (funcs: *paint_funcs_t, paint_data: *void, color_line: *color_line_t, x0: float, y0: float, x1: float, y1: float, x2: float, y2: float) -> void #foreign harfbuzz "hb_paint_linear_gradient";

paint_radial_gradient :: (funcs: *paint_funcs_t, paint_data: *void, color_line: *color_line_t, x0: float, y0: float, r0: float, x1: float, y1: float, r1: float) -> void #foreign harfbuzz "hb_paint_radial_gradient";

paint_sweep_gradient :: (funcs: *paint_funcs_t, paint_data: *void, color_line: *color_line_t, x0: float, y0: float, start_angle: float, end_angle: float) -> void #foreign harfbuzz "hb_paint_sweep_gradient";

paint_push_group :: (funcs: *paint_funcs_t, paint_data: *void) -> void #foreign harfbuzz "hb_paint_push_group";

paint_push_group_for :: (funcs: *paint_funcs_t, paint_data: *void, mode: paint_composite_mode_t) -> void #foreign harfbuzz "hb_paint_push_group_for";

paint_pop_group :: (funcs: *paint_funcs_t, paint_data: *void, mode: paint_composite_mode_t) -> void #foreign harfbuzz "hb_paint_pop_group";

paint_custom_palette_color :: (funcs: *paint_funcs_t, paint_data: *void, color_index: u32, color: *color_t) -> bool_t #foreign harfbuzz "hb_paint_custom_palette_color";

/*
* Gradient helpers for paint backends.
*
* These are small, self-contained utilities that every COLRv1
* renderer ends up reinventing.  Exposed here so third-party
* paint backends can consume a single canonical implementation
* instead of forking one per project.
*/
paint_reduce_linear_anchors :: (x0: float, y0: float, x1: float, y1: float, x2: float, y2: float, xx0: *float, yy0: *float, xx1: *float, yy1: *float) -> void #foreign harfbuzz "hb_paint_reduce_linear_anchors";

paint_normalize_color_line :: (stops: *color_stop_t, len: u32, min: *float, max: *float) -> void #foreign harfbuzz "hb_paint_normalize_color_line";

/**
* hb_paint_sweep_gradient_tile_func_t:
* @a0: segment start angle, in radians.
* @c0: segment start color.
* @a1: segment end angle, in radians.
* @c1: segment end color.
* @user_data: user data passed to hb_paint_sweep_gradient_tiles().
*
* Callback invoked once per (a0, a1) sector of a sweep
* gradient tiling.  See hb_paint_sweep_gradient_tiles().
*
* Since: 14.2.0
**/
paint_sweep_gradient_tile_func_t :: #type (a0: float, c0: color_t, a1: float, c1: color_t, user_data: *void) -> void #c_call;

paint_sweep_gradient_tiles :: (stops: *color_stop_t, n_stops: u32, extend: paint_extend_t, start_angle: float, end_angle: float, emit_patch: paint_sweep_gradient_tile_func_t, user_data: *void) -> void #foreign harfbuzz "hb_paint_sweep_gradient_tiles";

font_funcs_t :: struct {}

font_funcs_create :: () -> *font_funcs_t #foreign harfbuzz "hb_font_funcs_create";

font_funcs_get_empty :: () -> *font_funcs_t #foreign harfbuzz "hb_font_funcs_get_empty";

font_funcs_reference :: (ffuncs: *font_funcs_t) -> *font_funcs_t #foreign harfbuzz "hb_font_funcs_reference";

font_funcs_destroy :: (ffuncs: *font_funcs_t) -> void #foreign harfbuzz "hb_font_funcs_destroy";

font_funcs_set_user_data :: (ffuncs: *font_funcs_t, key: *user_data_key_t, data: *void, destroy: destroy_func_t, replace: bool_t) -> bool_t #foreign harfbuzz "hb_font_funcs_set_user_data";

font_funcs_get_user_data :: (ffuncs: *font_funcs_t, key: *user_data_key_t) -> *void #foreign harfbuzz "hb_font_funcs_get_user_data";

font_funcs_make_immutable :: (ffuncs: *font_funcs_t) -> void #foreign harfbuzz "hb_font_funcs_make_immutable";

font_funcs_is_immutable :: (ffuncs: *font_funcs_t) -> bool_t #foreign harfbuzz "hb_font_funcs_is_immutable";

/**
* hb_font_extents_t:
* @ascender: The height of typographic ascenders.
* @descender: The depth of typographic descenders.
* @line_gap: The suggested line-spacing gap.
*
* Font-wide extent values, measured in scaled units.
*
* Note that typically @ascender is positive and @descender
* negative, in coordinate systems that grow up.
**/
font_extents_t :: struct {
    ascender:  position_t;
    descender: position_t;
    line_gap:  position_t;

    /*< private >*/
    reserved9: position_t;
    reserved8: position_t;
    reserved7: position_t;
    reserved6: position_t;
    reserved5: position_t;
    reserved4: position_t;
    reserved3: position_t;
    reserved2: position_t;
    reserved1: position_t;
}

/**
* hb_font_get_font_extents_func_t:
* @font: #hb_font_t to work upon
* @font_data: @font user data pointer
* @extents: (out): The font extents retrieved
* @user_data: User data pointer passed by the caller
*
* This method should retrieve the extents for a font.
*
**/
font_get_font_extents_func_t :: #type (font: *font_t, font_data: *void, extents: *font_extents_t, user_data: *void) -> bool_t #c_call;

/**
* hb_font_get_font_h_extents_func_t:
*
* A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
*
* This method should retrieve the extents for a font, for horizontal-direction
* text segments. Extents must be returned in an #hb_glyph_extents output
* parameter.
*
**/
font_get_font_h_extents_func_t :: font_get_font_extents_func_t;

/**
* hb_font_get_font_v_extents_func_t:
*
* A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
*
* This method should retrieve the extents for a font, for vertical-direction
* text segments. Extents must be returned in an #hb_glyph_extents output
* parameter.
*
**/
font_get_font_v_extents_func_t :: font_get_font_extents_func_t;

/**
* hb_font_get_nominal_glyph_func_t:
* @font: #hb_font_t to work upon
* @font_data: @font user data pointer
* @unicode: The Unicode code point to query
* @glyph: (out): The glyph ID retrieved
* @user_data: User data pointer passed by the caller
*
* A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
*
* This method should retrieve the nominal glyph ID for a specified Unicode code
* point. Glyph IDs must be returned in a #hb_codepoint_t output parameter.
*
* Return value: `true` if data found, `false` otherwise
*
**/
font_get_nominal_glyph_func_t :: #type (font: *font_t, font_data: *void, unicode: codepoint_t, glyph: *codepoint_t, user_data: *void) -> bool_t #c_call;

/**
* hb_font_get_variation_glyph_func_t:
* @font: #hb_font_t to work upon
* @font_data: @font user data pointer
* @unicode: The Unicode code point to query
* @variation_selector: The  variation-selector code point to query
* @glyph: (out): The glyph ID retrieved
* @user_data: User data pointer passed by the caller
*
* A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
*
* This method should retrieve the glyph ID for a specified Unicode code point
* followed by a specified Variation Selector code point. Glyph IDs must be
* returned in a #hb_codepoint_t output parameter.
*
* Return value: `true` if data found, `false` otherwise
*
**/
font_get_variation_glyph_func_t :: #type (font: *font_t, font_data: *void, unicode: codepoint_t, variation_selector: codepoint_t, glyph: *codepoint_t, user_data: *void) -> bool_t #c_call;

/**
* hb_font_get_nominal_glyphs_func_t:
* @font: #hb_font_t to work upon
* @font_data: @font user data pointer
* @count: number of code points to query
* @first_unicode: The first Unicode code point to query
* @unicode_stride: The stride between successive code points
* @first_glyph: (out): The first glyph ID retrieved
* @glyph_stride: The stride between successive glyph IDs
* @user_data: User data pointer passed by the caller
*
* A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
*
* This method should retrieve the nominal glyph IDs for a sequence of
* Unicode code points. Glyph IDs must be returned in a #hb_codepoint_t
* output parameter.
*
* Return value: the number of code points processed
*
**/
font_get_nominal_glyphs_func_t :: #type (font: *font_t, font_data: *void, count: u32, first_unicode: *codepoint_t, unicode_stride: u32, first_glyph: *codepoint_t, glyph_stride: u32, user_data: *void) -> u32 #c_call;

/**
* hb_font_get_glyph_advance_func_t:
* @font: #hb_font_t to work upon
* @font_data: @font user data pointer
* @glyph: The glyph ID to query
* @user_data: User data pointer passed by the caller
*
* A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
*
* This method should retrieve the advance for a specified glyph. The
* method must return an #hb_position_t.
*
* Return value: The advance of @glyph within @font
*
**/
font_get_glyph_advance_func_t :: #type (font: *font_t, font_data: *void, glyph: codepoint_t, user_data: *void) -> position_t #c_call;

/**
* hb_font_get_glyph_h_advance_func_t:
*
* A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
*
* This method should retrieve the advance for a specified glyph, in
* horizontal-direction text segments. Advances must be returned in
* an #hb_position_t output parameter.
*
**/
font_get_glyph_h_advance_func_t :: font_get_glyph_advance_func_t;

/**
* hb_font_get_glyph_v_advance_func_t:
*
* A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
*
* This method should retrieve the advance for a specified glyph, in
* vertical-direction text segments. Advances must be returned in
* an #hb_position_t output parameter.
*
**/
font_get_glyph_v_advance_func_t :: font_get_glyph_advance_func_t;

/**
* hb_font_get_glyph_advances_func_t:
* @font: #hb_font_t to work upon
* @font_data: @font user data pointer
* @count: The number of glyph IDs in the sequence queried
* @first_glyph: The first glyph ID to query
* @glyph_stride: The stride between successive glyph IDs
* @first_advance: (out): The first advance retrieved
* @advance_stride: The stride between successive advances
* @user_data: User data pointer passed by the caller
*
* A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
*
* This method should retrieve the advances for a sequence of glyphs.
*
**/
font_get_glyph_advances_func_t :: #type (font: *font_t, font_data: *void, count: u32, first_glyph: *codepoint_t, glyph_stride: u32, first_advance: *position_t, advance_stride: u32, user_data: *void) -> void #c_call;

/**
* hb_font_get_glyph_h_advances_func_t:
*
* A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
*
* This method should retrieve the advances for a sequence of glyphs, in
* horizontal-direction text segments.
*
**/
font_get_glyph_h_advances_func_t :: font_get_glyph_advances_func_t;

/**
* hb_font_get_glyph_v_advances_func_t:
*
* A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
*
* This method should retrieve the advances for a sequence of glyphs, in
* vertical-direction text segments.
*
**/
font_get_glyph_v_advances_func_t :: font_get_glyph_advances_func_t;

/**
* hb_font_get_glyph_origin_func_t:
* @font: #hb_font_t to work upon
* @font_data: @font user data pointer
* @glyph: The glyph ID to query
* @x: (out): The X coordinate of the origin
* @y: (out): The Y coordinate of the origin
* @user_data: User data pointer passed by the caller
*
* A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
*
* This method should retrieve the (X,Y) coordinates (in scaled units) of the
* origin for a glyph. Each coordinate must be returned in an #hb_position_t
* output parameter.
*
* Return value: `true` if data found, `false` otherwise
*
**/
font_get_glyph_origin_func_t :: #type (font: *font_t, font_data: *void, glyph: codepoint_t, x: *position_t, y: *position_t, user_data: *void) -> bool_t #c_call;

/**
* hb_font_get_glyph_h_origin_func_t:
*
* A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
*
* This method should retrieve the (X,Y) coordinates (in scaled units) of the
* origin for a glyph, for horizontal-direction text segments. Each
* coordinate must be returned in an #hb_position_t output parameter.
*
**/
font_get_glyph_h_origin_func_t :: font_get_glyph_origin_func_t;

/**
* hb_font_get_glyph_v_origin_func_t:
*
* A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
*
* This method should retrieve the (X,Y) coordinates (in scaled units) of the
* origin for a glyph, for vertical-direction text segments. Each coordinate
* must be returned in an #hb_position_t output parameter.
*
**/
font_get_glyph_v_origin_func_t :: font_get_glyph_origin_func_t;

/**
* hb_font_get_glyph_origins_func_t:
* @font: #hb_font_t to work upon
* @font_data: @font user data pointer
* @first_glyph: The first glyph ID to query
* @count: number of glyphs to query
* @glyph_stride: The stride between successive glyph IDs
* @first_x: (out): The first origin X coordinate retrieved
* @x_stride: The stride between successive origin X coordinates
* @first_y: (out): The first origin Y coordinate retrieved
* @y_stride: The stride between successive origin Y coordinates
* @user_data: User data pointer passed by the caller
*
* A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
*
* This method should retrieve the (X,Y) coordinates (in scaled units) of the
* origin for each requested glyph. Each coordinate value must be returned in
* an #hb_position_t in the two output parameters.
*
* Return value: `true` if data found, `false` otherwise
*
* Since: 11.3.0
**/
font_get_glyph_origins_func_t :: #type (font: *font_t, font_data: *void, count: u32, first_glyph: *codepoint_t, glyph_stride: u32, first_x: *position_t, x_stride: u32, first_y: *position_t, y_stride: u32, user_data: *void) -> bool_t #c_call;

/**
* hb_font_get_glyph_h_origins_func_t:
*
* A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
*
* This method should retrieve the (X,Y) coordinates (in scaled units) of the
* origin for requested glyph, for horizontal-direction text segments. Each
* coordinate must be returned in a the x/y #hb_position_t output parameters.
*
* Since: 11.3.0
**/
font_get_glyph_h_origins_func_t :: font_get_glyph_origins_func_t;

/**
* hb_font_get_glyph_v_origins_func_t:
*
* A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
*
* This method should retrieve the (X,Y) coordinates (in scaled units) of the
* origin for requested glyph, for vertical-direction text segments. Each
* coordinate must be returned in a the x/y #hb_position_t output parameters.
*
* Since: 11.3.0
**/
font_get_glyph_v_origins_func_t :: font_get_glyph_origins_func_t;

/**
* hb_font_get_glyph_kerning_func_t:
* @font: #hb_font_t to work upon
* @font_data: @font user data pointer
* @first_glyph: The glyph ID of the first glyph in the glyph pair
* @second_glyph: The glyph ID of the second glyph in the glyph pair
* @user_data: User data pointer passed by the caller
*
* This method should retrieve the kerning-adjustment value for a glyph-pair in
* the specified font, for horizontal text segments.
*
**/
font_get_glyph_kerning_func_t :: #type (font: *font_t, font_data: *void, first_glyph: codepoint_t, second_glyph: codepoint_t, user_data: *void) -> position_t #c_call;

/**
* hb_font_get_glyph_h_kerning_func_t:
*
* A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
*
* This method should retrieve the kerning-adjustment value for a glyph-pair in
* the specified font, for horizontal text segments.
*
**/
font_get_glyph_h_kerning_func_t :: font_get_glyph_kerning_func_t;

/**
* hb_font_get_glyph_extents_func_t:
* @font: #hb_font_t to work upon
* @font_data: @font user data pointer
* @glyph: The glyph ID to query
* @extents: (out): The #hb_glyph_extents_t retrieved
* @user_data: User data pointer passed by the caller
*
* A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
*
* This method should retrieve the extents for a specified glyph. Extents must be
* returned in an #hb_glyph_extents output parameter.
*
* Return value: `true` if data found, `false` otherwise
*
**/
font_get_glyph_extents_func_t :: #type (font: *font_t, font_data: *void, glyph: codepoint_t, extents: *glyph_extents_t, user_data: *void) -> bool_t #c_call;

/**
* hb_font_get_glyph_contour_point_func_t:
* @font: #hb_font_t to work upon
* @font_data: @font user data pointer
* @glyph: The glyph ID to query
* @point_index: The contour-point index to query
* @x: (out): The X value retrieved for the contour point
* @y: (out): The Y value retrieved for the contour point
* @user_data: User data pointer passed by the caller
*
* A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
*
* This method should retrieve the (X,Y) coordinates (in scaled units) for a
* specified contour point in a glyph. Each coordinate must be returned as
* an #hb_position_t output parameter.
*
* Return value: `true` if data found, `false` otherwise
*
**/
font_get_glyph_contour_point_func_t :: #type (font: *font_t, font_data: *void, glyph: codepoint_t, point_index: u32, x: *position_t, y: *position_t, user_data: *void) -> bool_t #c_call;

/**
* hb_font_get_glyph_name_func_t:
* @font: #hb_font_t to work upon
* @font_data: @font user data pointer
* @glyph: The glyph ID to query
* @name: (out) (array length=size): Name string retrieved for the glyph ID
* @size: Length of the glyph-name string retrieved
* @user_data: User data pointer passed by the caller
*
* A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
*
* This method should retrieve the glyph name that corresponds to a
* glyph ID. The name should be returned in a string output parameter.
*
* Return value: `true` if data found, `false` otherwise
*
**/
font_get_glyph_name_func_t :: #type (font: *font_t, font_data: *void, glyph: codepoint_t, name: *u8, size: u32, user_data: *void) -> bool_t #c_call;

/**
* hb_font_get_glyph_from_name_func_t:
* @font: #hb_font_t to work upon
* @font_data: @font user data pointer
* @name: (array length=len): The name string to query
* @len: The length of the name queried
* @glyph: (out): The glyph ID retrieved
* @user_data: User data pointer passed by the caller
*
* A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
*
* This method should retrieve the glyph ID that corresponds to a glyph-name
* string.
*
* Return value: `true` if data found, `false` otherwise
*
**/
font_get_glyph_from_name_func_t :: #type (font: *font_t, font_data: *void, name: *u8, len: s32, glyph: *codepoint_t, user_data: *void) -> bool_t #c_call;

/**
* hb_font_draw_glyph_or_fail_func_t:
* @font: #hb_font_t to work upon
* @font_data: @font user data pointer
* @glyph: The glyph ID to query
* @draw_funcs: The draw functions to send the shape data to
* @draw_data: The data accompanying the draw functions
* @user_data: User data pointer passed by the caller
*
* A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
*
* Return value: `true` if glyph was drawn, `false` otherwise
*
* Since: 11.2.0
**/
font_draw_glyph_or_fail_func_t :: #type (font: *font_t, font_data: *void, glyph: codepoint_t, draw_funcs: *draw_funcs_t, draw_data: *void, user_data: *void) -> bool_t #c_call;

/**
* hb_font_paint_glyph_or_fail_func_t:
* @font: #hb_font_t to work upon
* @font_data: @font user data pointer
* @glyph: The glyph ID to query
* @paint_funcs: The paint functions to use
* @paint_data: The data accompanying the paint functions
* @palette_index: The color palette to use
* @foreground: The foreground color
* @user_data: User data pointer passed by the caller
*
* A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
*
* Return value: `true` if glyph was painted, `false` otherwise
*
* Since: 11.2.0
*/
font_paint_glyph_or_fail_func_t :: #type (font: *font_t, font_data: *void, glyph: codepoint_t, paint_funcs: *paint_funcs_t, paint_data: *void, palette_index: u32, foreground: color_t, user_data: *void) -> bool_t #c_call;

/**
* hb_font_funcs_set_font_h_extents_func:
* @ffuncs: A font-function structure
* @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
* @user_data: Data to pass to @func
* @destroy: (nullable): The function to call when @user_data is not needed anymore
*
* Sets the implementation function for #hb_font_get_font_h_extents_func_t.
*
* Since: 1.1.2
**/
font_funcs_set_font_h_extents_func :: (ffuncs: *font_funcs_t, func: font_get_font_h_extents_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_font_funcs_set_font_h_extents_func";

/**
* hb_font_funcs_set_font_v_extents_func:
* @ffuncs: A font-function structure
* @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
* @user_data: Data to pass to @func
* @destroy: (nullable): The function to call when @user_data is not needed anymore
*
* Sets the implementation function for #hb_font_get_font_v_extents_func_t.
*
* Since: 1.1.2
**/
font_funcs_set_font_v_extents_func :: (ffuncs: *font_funcs_t, func: font_get_font_v_extents_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_font_funcs_set_font_v_extents_func";

/**
* hb_font_funcs_set_nominal_glyph_func:
* @ffuncs: A font-function structure
* @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
* @user_data: Data to pass to @func
* @destroy: (nullable): The function to call when @user_data is not needed anymore
*
* Sets the implementation function for #hb_font_get_nominal_glyph_func_t.
*
* Since: 1.2.3
**/
font_funcs_set_nominal_glyph_func :: (ffuncs: *font_funcs_t, func: font_get_nominal_glyph_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_font_funcs_set_nominal_glyph_func";

/**
* hb_font_funcs_set_nominal_glyphs_func:
* @ffuncs: A font-function structure
* @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
* @user_data: Data to pass to @func
* @destroy: (nullable): The function to call when @user_data is not needed anymore
*
* Sets the implementation function for #hb_font_get_nominal_glyphs_func_t.
*
* Since: 2.0.0
**/
font_funcs_set_nominal_glyphs_func :: (ffuncs: *font_funcs_t, func: font_get_nominal_glyphs_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_font_funcs_set_nominal_glyphs_func";

/**
* hb_font_funcs_set_variation_glyph_func:
* @ffuncs: A font-function structure
* @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
* @user_data: Data to pass to @func
* @destroy: (nullable): The function to call when @user_data is not needed anymore
*
* Sets the implementation function for #hb_font_get_variation_glyph_func_t.
*
* Since: 1.2.3
**/
font_funcs_set_variation_glyph_func :: (ffuncs: *font_funcs_t, func: font_get_variation_glyph_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_font_funcs_set_variation_glyph_func";

/**
* hb_font_funcs_set_glyph_h_advance_func:
* @ffuncs: A font-function structure
* @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
* @user_data: Data to pass to @func
* @destroy: (nullable): The function to call when @user_data is not needed anymore
*
* Sets the implementation function for #hb_font_get_glyph_h_advance_func_t.
*
* Since: 0.9.2
**/
font_funcs_set_glyph_h_advance_func :: (ffuncs: *font_funcs_t, func: font_get_glyph_h_advance_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_font_funcs_set_glyph_h_advance_func";

/**
* hb_font_funcs_set_glyph_v_advance_func:
* @ffuncs: A font-function structure
* @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
* @user_data: Data to pass to @func
* @destroy: (nullable): The function to call when @user_data is not needed anymore
*
* Sets the implementation function for #hb_font_get_glyph_v_advance_func_t.
*
* Since: 0.9.2
**/
font_funcs_set_glyph_v_advance_func :: (ffuncs: *font_funcs_t, func: font_get_glyph_v_advance_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_font_funcs_set_glyph_v_advance_func";

/**
* hb_font_funcs_set_glyph_h_advances_func:
* @ffuncs: A font-function structure
* @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
* @user_data: Data to pass to @func
* @destroy: (nullable): The function to call when @user_data is not needed anymore
*
* Sets the implementation function for #hb_font_get_glyph_h_advances_func_t.
*
* Since: 1.8.6
**/
font_funcs_set_glyph_h_advances_func :: (ffuncs: *font_funcs_t, func: font_get_glyph_h_advances_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_font_funcs_set_glyph_h_advances_func";

/**
* hb_font_funcs_set_glyph_v_advances_func:
* @ffuncs: A font-function structure
* @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
* @user_data: Data to pass to @func
* @destroy: (nullable): The function to call when @user_data is not needed anymore
*
* Sets the implementation function for #hb_font_get_glyph_v_advances_func_t.
*
* Since: 1.8.6
**/
font_funcs_set_glyph_v_advances_func :: (ffuncs: *font_funcs_t, func: font_get_glyph_v_advances_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_font_funcs_set_glyph_v_advances_func";

/**
* hb_font_funcs_set_glyph_h_origin_func:
* @ffuncs: A font-function structure
* @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
* @user_data: Data to pass to @func
* @destroy: (nullable): The function to call when @user_data is not needed anymore
*
* Sets the implementation function for #hb_font_get_glyph_h_origin_func_t.
*
* Since: 0.9.2
**/
font_funcs_set_glyph_h_origin_func :: (ffuncs: *font_funcs_t, func: font_get_glyph_h_origin_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_font_funcs_set_glyph_h_origin_func";

/**
* hb_font_funcs_set_glyph_v_origin_func:
* @ffuncs: A font-function structure
* @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
* @user_data: Data to pass to @func
* @destroy: (nullable): The function to call when @user_data is not needed anymore
*
* Sets the implementation function for #hb_font_get_glyph_v_origin_func_t.
*
* Since: 0.9.2
**/
font_funcs_set_glyph_v_origin_func :: (ffuncs: *font_funcs_t, func: font_get_glyph_v_origin_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_font_funcs_set_glyph_v_origin_func";

/**
* hb_font_funcs_set_glyph_h_origins_func:
* @ffuncs: A font-function structure
* @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
* @user_data: Data to pass to @func
* @destroy: (nullable): The function to call when @user_data is not needed anymore
*
* Sets the implementation function for #hb_font_get_glyph_h_origins_func_t.
*
* Since: 11.3.0
**/
font_funcs_set_glyph_h_origins_func :: (ffuncs: *font_funcs_t, func: font_get_glyph_h_origins_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_font_funcs_set_glyph_h_origins_func";

/**
* hb_font_funcs_set_glyph_v_origins_func:
* @ffuncs: A font-function structure
* @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
* @user_data: Data to pass to @func
* @destroy: (nullable): The function to call when @user_data is not needed anymore
*
* Sets the implementation function for #hb_font_get_glyph_v_origins_func_t.
*
* Since: 11.3.0
**/
font_funcs_set_glyph_v_origins_func :: (ffuncs: *font_funcs_t, func: font_get_glyph_v_origins_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_font_funcs_set_glyph_v_origins_func";

/**
* hb_font_funcs_set_glyph_h_kerning_func:
* @ffuncs: A font-function structure
* @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
* @user_data: Data to pass to @func
* @destroy: (nullable): The function to call when @user_data is not needed anymore
*
* Sets the implementation function for #hb_font_get_glyph_h_kerning_func_t.
*
* Since: 0.9.2
**/
font_funcs_set_glyph_h_kerning_func :: (ffuncs: *font_funcs_t, func: font_get_glyph_h_kerning_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_font_funcs_set_glyph_h_kerning_func";

/**
* hb_font_funcs_set_glyph_extents_func:
* @ffuncs: A font-function structure
* @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
* @user_data: Data to pass to @func
* @destroy: (nullable): The function to call when @user_data is not needed anymore
*
* Sets the implementation function for #hb_font_get_glyph_extents_func_t.
*
* Since: 0.9.2
**/
font_funcs_set_glyph_extents_func :: (ffuncs: *font_funcs_t, func: font_get_glyph_extents_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_font_funcs_set_glyph_extents_func";

/**
* hb_font_funcs_set_glyph_contour_point_func:
* @ffuncs: A font-function structure
* @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
* @user_data: Data to pass to @func
* @destroy: (nullable): The function to call when @user_data is not needed anymore
*
* Sets the implementation function for #hb_font_get_glyph_contour_point_func_t.
*
* Since: 0.9.2
**/
font_funcs_set_glyph_contour_point_func :: (ffuncs: *font_funcs_t, func: font_get_glyph_contour_point_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_font_funcs_set_glyph_contour_point_func";

/**
* hb_font_funcs_set_glyph_name_func:
* @ffuncs: A font-function structure
* @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
* @user_data: Data to pass to @func
* @destroy: (nullable): The function to call when @user_data is not needed anymore
*
* Sets the implementation function for #hb_font_get_glyph_name_func_t.
*
* Since: 0.9.2
**/
font_funcs_set_glyph_name_func :: (ffuncs: *font_funcs_t, func: font_get_glyph_name_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_font_funcs_set_glyph_name_func";

/**
* hb_font_funcs_set_glyph_from_name_func:
* @ffuncs: A font-function structure
* @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
* @user_data: Data to pass to @func
* @destroy: (nullable): The function to call when @user_data is not needed anymore
*
* Sets the implementation function for #hb_font_get_glyph_from_name_func_t.
*
* Since: 0.9.2
**/
font_funcs_set_glyph_from_name_func :: (ffuncs: *font_funcs_t, func: font_get_glyph_from_name_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_font_funcs_set_glyph_from_name_func";

/**
* hb_font_funcs_set_draw_glyph_or_fail_func:
* @ffuncs: A font-function structure
* @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
* @user_data: Data to pass to @func
* @destroy: (nullable): The function to call when @user_data is not needed anymore
*
* Sets the implementation function for #hb_font_draw_glyph_or_fail_func_t.
*
* Since: 11.2.0
**/
font_funcs_set_draw_glyph_or_fail_func :: (ffuncs: *font_funcs_t, func: font_draw_glyph_or_fail_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_font_funcs_set_draw_glyph_or_fail_func";

/**
* hb_font_funcs_set_paint_glyph_or_fail_func:
* @ffuncs: A font-function structure
* @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
* @user_data: Data to pass to @func
* @destroy: (nullable): The function to call when @user_data is no longer needed
*
* Sets the implementation function for #hb_font_paint_glyph_or_fail_func_t.
*
* Since: 11.2.0
*/
font_funcs_set_paint_glyph_or_fail_func :: (ffuncs: *font_funcs_t, func: font_paint_glyph_or_fail_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_font_funcs_set_paint_glyph_or_fail_func";

/* func dispatch */
font_get_h_extents :: (font: *font_t, extents: *font_extents_t) -> bool_t #foreign harfbuzz "hb_font_get_h_extents";

font_get_v_extents :: (font: *font_t, extents: *font_extents_t) -> bool_t #foreign harfbuzz "hb_font_get_v_extents";

font_get_nominal_glyph :: (font: *font_t, unicode: codepoint_t, glyph: *codepoint_t) -> bool_t #foreign harfbuzz "hb_font_get_nominal_glyph";

font_get_variation_glyph :: (font: *font_t, unicode: codepoint_t, variation_selector: codepoint_t, glyph: *codepoint_t) -> bool_t #foreign harfbuzz "hb_font_get_variation_glyph";

font_get_nominal_glyphs :: (font: *font_t, count: u32, first_unicode: *codepoint_t, unicode_stride: u32, first_glyph: *codepoint_t, glyph_stride: u32) -> u32 #foreign harfbuzz "hb_font_get_nominal_glyphs";

font_get_glyph_h_advance :: (font: *font_t, glyph: codepoint_t) -> position_t #foreign harfbuzz "hb_font_get_glyph_h_advance";

font_get_glyph_v_advance :: (font: *font_t, glyph: codepoint_t) -> position_t #foreign harfbuzz "hb_font_get_glyph_v_advance";

font_get_glyph_h_advances :: (font: *font_t, count: u32, first_glyph: *codepoint_t, glyph_stride: u32, first_advance: *position_t, advance_stride: u32) -> void #foreign harfbuzz "hb_font_get_glyph_h_advances";

font_get_glyph_v_advances :: (font: *font_t, count: u32, first_glyph: *codepoint_t, glyph_stride: u32, first_advance: *position_t, advance_stride: u32) -> void #foreign harfbuzz "hb_font_get_glyph_v_advances";

font_get_glyph_h_origin :: (font: *font_t, glyph: codepoint_t, x: *position_t, y: *position_t) -> bool_t #foreign harfbuzz "hb_font_get_glyph_h_origin";

font_get_glyph_v_origin :: (font: *font_t, glyph: codepoint_t, x: *position_t, y: *position_t) -> bool_t #foreign harfbuzz "hb_font_get_glyph_v_origin";

font_get_glyph_h_origins :: (font: *font_t, count: u32, first_glyph: *codepoint_t, glyph_stride: u32, first_x: *position_t, x_stride: u32, first_y: *position_t, y_stride: u32) -> bool_t #foreign harfbuzz "hb_font_get_glyph_h_origins";

font_get_glyph_v_origins :: (font: *font_t, count: u32, first_glyph: *codepoint_t, glyph_stride: u32, first_x: *position_t, x_stride: u32, first_y: *position_t, y_stride: u32) -> bool_t #foreign harfbuzz "hb_font_get_glyph_v_origins";

font_get_glyph_h_kerning :: (font: *font_t, left_glyph: codepoint_t, right_glyph: codepoint_t) -> position_t #foreign harfbuzz "hb_font_get_glyph_h_kerning";

font_get_glyph_extents :: (font: *font_t, glyph: codepoint_t, extents: *glyph_extents_t) -> bool_t #foreign harfbuzz "hb_font_get_glyph_extents";

font_get_glyph_contour_point :: (font: *font_t, glyph: codepoint_t, point_index: u32, x: *position_t, y: *position_t) -> bool_t #foreign harfbuzz "hb_font_get_glyph_contour_point";

font_get_glyph_name :: (font: *font_t, glyph: codepoint_t, name: *u8, size: u32) -> bool_t #foreign harfbuzz "hb_font_get_glyph_name";

font_get_glyph_from_name :: (font: *font_t, name: *u8, len: s32, glyph: *codepoint_t) -> bool_t #foreign harfbuzz "hb_font_get_glyph_from_name";

font_draw_glyph_or_fail :: (font: *font_t, glyph: codepoint_t, dfuncs: *draw_funcs_t, draw_data: *void) -> bool_t #foreign harfbuzz "hb_font_draw_glyph_or_fail";

font_paint_glyph_or_fail :: (font: *font_t, glyph: codepoint_t, pfuncs: *paint_funcs_t, paint_data: *void, palette_index: u32, foreground: color_t) -> bool_t #foreign harfbuzz "hb_font_paint_glyph_or_fail";

/* Calls either hb_font_get_nominal_glyph() if variation_selector is 0,
* otherwise calls hb_font_get_variation_glyph(). */
font_get_glyph :: (font: *font_t, unicode: codepoint_t, variation_selector: codepoint_t, glyph: *codepoint_t) -> bool_t #foreign harfbuzz "hb_font_get_glyph";

font_get_extents_for_direction :: (font: *font_t, direction: direction_t, extents: *font_extents_t) -> void #foreign harfbuzz "hb_font_get_extents_for_direction";

font_get_glyph_advance_for_direction :: (font: *font_t, glyph: codepoint_t, direction: direction_t, x: *position_t, y: *position_t) -> void #foreign harfbuzz "hb_font_get_glyph_advance_for_direction";

font_get_glyph_advances_for_direction :: (font: *font_t, direction: direction_t, count: u32, first_glyph: *codepoint_t, glyph_stride: u32, first_advance: *position_t, advance_stride: u32) -> void #foreign harfbuzz "hb_font_get_glyph_advances_for_direction";

font_get_glyph_origin_for_direction :: (font: *font_t, glyph: codepoint_t, direction: direction_t, x: *position_t, y: *position_t) -> void #foreign harfbuzz "hb_font_get_glyph_origin_for_direction";

font_add_glyph_origin_for_direction :: (font: *font_t, glyph: codepoint_t, direction: direction_t, x: *position_t, y: *position_t) -> void #foreign harfbuzz "hb_font_add_glyph_origin_for_direction";

font_subtract_glyph_origin_for_direction :: (font: *font_t, glyph: codepoint_t, direction: direction_t, x: *position_t, y: *position_t) -> void #foreign harfbuzz "hb_font_subtract_glyph_origin_for_direction";

font_get_glyph_kerning_for_direction :: (font: *font_t, first_glyph: codepoint_t, second_glyph: codepoint_t, direction: direction_t, x: *position_t, y: *position_t) -> void #foreign harfbuzz "hb_font_get_glyph_kerning_for_direction";

font_get_glyph_extents_for_origin :: (font: *font_t, glyph: codepoint_t, direction: direction_t, extents: *glyph_extents_t) -> bool_t #foreign harfbuzz "hb_font_get_glyph_extents_for_origin";

font_get_glyph_contour_point_for_origin :: (font: *font_t, glyph: codepoint_t, point_index: u32, direction: direction_t, x: *position_t, y: *position_t) -> bool_t #foreign harfbuzz "hb_font_get_glyph_contour_point_for_origin";

/* Generates gidDDD if glyph has no name. */
font_glyph_to_string :: (font: *font_t, glyph: codepoint_t, s: *u8, size: u32) -> void #foreign harfbuzz "hb_font_glyph_to_string";

/* Parses gidDDD and uniUUUU strings automatically. */
font_glyph_from_string :: (font: *font_t, s: *u8, len: s32, glyph: *codepoint_t) -> bool_t #foreign harfbuzz "hb_font_glyph_from_string";

/* Older alias for hb_font_draw_glyph_or_fail() with no return value. */
font_draw_glyph :: (font: *font_t, glyph: codepoint_t, dfuncs: *draw_funcs_t, draw_data: *void) -> void #foreign harfbuzz "hb_font_draw_glyph";

/* Paints color glyph; if failed, draws outline glyph. */
font_paint_glyph :: (font: *font_t, glyph: codepoint_t, pfuncs: *paint_funcs_t, paint_data: *void, palette_index: u32, foreground: color_t) -> void #foreign harfbuzz "hb_font_paint_glyph";

/* Fonts are very light-weight objects */
font_create :: (face: *face_t) -> *font_t #foreign harfbuzz "hb_font_create";

font_create_sub_font :: (parent: *font_t) -> *font_t #foreign harfbuzz "hb_font_create_sub_font";

font_get_empty :: () -> *font_t #foreign harfbuzz "hb_font_get_empty";

font_reference :: (font: *font_t) -> *font_t #foreign harfbuzz "hb_font_reference";

font_destroy :: (font: *font_t) -> void #foreign harfbuzz "hb_font_destroy";

font_set_user_data :: (font: *font_t, key: *user_data_key_t, data: *void, destroy: destroy_func_t, replace: bool_t) -> bool_t #foreign harfbuzz "hb_font_set_user_data";

font_get_user_data :: (font: *font_t, key: *user_data_key_t) -> *void #foreign harfbuzz "hb_font_get_user_data";

font_make_immutable :: (font: *font_t) -> void #foreign harfbuzz "hb_font_make_immutable";

font_is_immutable :: (font: *font_t) -> bool_t #foreign harfbuzz "hb_font_is_immutable";

font_get_serial :: (font: *font_t) -> u32 #foreign harfbuzz "hb_font_get_serial";

font_changed :: (font: *font_t) -> void #foreign harfbuzz "hb_font_changed";

font_set_parent :: (font: *font_t, parent: *font_t) -> void #foreign harfbuzz "hb_font_set_parent";

font_get_parent :: (font: *font_t) -> *font_t #foreign harfbuzz "hb_font_get_parent";

font_get_face :: (font: *font_t) -> *face_t #foreign harfbuzz "hb_font_get_face";

font_set_funcs :: (font: *font_t, klass: *font_funcs_t, font_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_font_set_funcs";

/* Be *very* careful with this function! */
font_set_funcs_data :: (font: *font_t, font_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_font_set_funcs_data";

font_set_funcs_using :: (font: *font_t, name: *u8) -> bool_t #foreign harfbuzz "hb_font_set_funcs_using";

font_list_funcs :: () -> **u8 #foreign harfbuzz "hb_font_list_funcs";

font_set_scale :: (font: *font_t, x_scale: s32, y_scale: s32) -> void #foreign harfbuzz "hb_font_set_scale";

font_get_scale :: (font: *font_t, x_scale: *s32, y_scale: *s32) -> void #foreign harfbuzz "hb_font_get_scale";

/*
* A zero value means "no hinting in that direction"
*/
font_set_ppem :: (font: *font_t, x_ppem: u32, y_ppem: u32) -> void #foreign harfbuzz "hb_font_set_ppem";

font_get_ppem :: (font: *font_t, x_ppem: *u32, y_ppem: *u32) -> void #foreign harfbuzz "hb_font_get_ppem";

/*
* Point size per EM.  Used for optical-sizing in CoreText.
* A value of zero means "not set".
*/
font_set_ptem :: (font: *font_t, ptem: float) -> void #foreign harfbuzz "hb_font_set_ptem";

font_get_ptem :: (font: *font_t) -> float #foreign harfbuzz "hb_font_get_ptem";

font_is_synthetic :: (font: *font_t) -> bool_t #foreign harfbuzz "hb_font_is_synthetic";

font_set_synthetic_bold :: (font: *font_t, x_embolden: float, y_embolden: float, in_place: bool_t) -> void #foreign harfbuzz "hb_font_set_synthetic_bold";

font_get_synthetic_bold :: (font: *font_t, x_embolden: *float, y_embolden: *float, in_place: *bool_t) -> void #foreign harfbuzz "hb_font_get_synthetic_bold";

font_set_synthetic_slant :: (font: *font_t, slant: float) -> void #foreign harfbuzz "hb_font_set_synthetic_slant";

font_get_synthetic_slant :: (font: *font_t) -> float #foreign harfbuzz "hb_font_get_synthetic_slant";

font_set_variations :: (font: *font_t, variations: *variation_t, variations_length: u32) -> void #foreign harfbuzz "hb_font_set_variations";

font_set_variation :: (font: *font_t, tag: tag_t, value: float) -> void #foreign harfbuzz "hb_font_set_variation";

font_set_var_coords_design :: (font: *font_t, coords: *float, coords_length: u32) -> void #foreign harfbuzz "hb_font_set_var_coords_design";

font_get_var_coords_design :: (font: *font_t, length: *u32) -> *float #foreign harfbuzz "hb_font_get_var_coords_design";

font_set_var_coords_normalized :: (font: *font_t, coords: *s32, coords_length: u32) -> void #foreign harfbuzz "hb_font_set_var_coords_normalized";

font_get_var_coords_normalized :: (font: *font_t, length: *u32) -> *s32 #foreign harfbuzz "hb_font_get_var_coords_normalized";

font_set_var_named_instance :: (font: *font_t, instance_index: u32) -> void #foreign harfbuzz "hb_font_set_var_named_instance";

font_get_var_named_instance :: (font: *font_t) -> u32 #foreign harfbuzz "hb_font_get_var_named_instance";

/**
* hb_glyph_info_t:
* @codepoint: either a Unicode code point (before shaping) or a glyph index
*             (after shaping).
* @cluster: the index of the character in the original text that corresponds
*           to this #hb_glyph_info_t, or whatever the client passes to
*           hb_buffer_add(). More than one #hb_glyph_info_t can have the same
*           @cluster value, if they resulted from the same character (e.g. one
*           to many glyph substitution), and when more than one character gets
*           merged in the same glyph (e.g. many to one glyph substitution) the
*           #hb_glyph_info_t will have the smallest cluster value of them.
*           By default some characters are merged into the same cluster
*           (e.g. combining marks have the same cluster as their bases)
*           even if they are separate glyphs, hb_buffer_set_cluster_level()
*           allow selecting more fine-grained cluster handling.
*
* The #hb_glyph_info_t is the structure that holds information about the
* glyphs and their relation to input text.
*/
glyph_info_t :: struct {
    codepoint: codepoint_t;

    /*< private >*/
    mask:      mask_t;

    /*< public >*/
    cluster:   u32;

    /*< private >*/
    var1:      var_int_t;
    var2:      var_int_t;
}

/**
* hb_glyph_flags_t:
* @HB_GLYPH_FLAG_UNSAFE_TO_BREAK: Indicates that if input text is broken at the
* 				   beginning of the cluster this glyph is part of,
* 				   then both sides need to be re-shaped, as the
* 				   result might be different.
* 				   On the flip side, it means that when this
* 				   flag is not present, then it is safe to break
* 				   the glyph-run at the beginning of this
* 				   cluster, and the two sides will represent the
* 				   exact same result one would get if breaking
* 				   input text at the beginning of this cluster
* 				   and shaping the two sides separately.
* 				   This can be used to optimize paragraph
* 				   layout, by avoiding re-shaping of each line
* 				   after line-breaking.
* @HB_GLYPH_FLAG_UNSAFE_TO_CONCAT: Indicates that if input text is changed on one
* 				   side of the beginning of the cluster this glyph
* 				   is part of, then the shaping results for the
* 				   other side might change.
* 				   Note that the absence of this flag will NOT by
* 				   itself mean that it IS safe to concat text.
* 				   Only two pieces of text both of which clear of
* 				   this flag can be concatenated safely.
* 				   This can be used to optimize paragraph
* 				   layout, by avoiding re-shaping of each line
* 				   after line-breaking, by limiting the
* 				   reshaping to a small piece around the
* 				   breaking position only, even if the breaking
* 				   position carries the
* 				   #HB_GLYPH_FLAG_UNSAFE_TO_BREAK or when
* 				   hyphenation or other text transformation
* 				   happens at line-break position, in the following
* 				   way:
* 				   1. Iterate back from the line-break position
* 				   until the first cluster start position that is
* 				   NOT unsafe-to-concat, 2. shape the segment from
* 				   there till the end of line, 3. check whether the
* 				   resulting glyph-run also is clear of the
* 				   unsafe-to-concat at its start-of-text position;
* 				   if it is, just splice it into place and the line
* 				   is shaped; If not, move on to a position further
* 				   back that is clear of unsafe-to-concat and retry
* 				   from there, and repeat.
* 				   At the start of next line a similar algorithm can
* 				   be implemented. That is: 1. Iterate forward from
* 				   the line-break position until the first cluster
* 				   start position that is NOT unsafe-to-concat, 2.
* 				   shape the segment from beginning of the line to
* 				   that position, 3. check whether the resulting
* 				   glyph-run also is clear of the unsafe-to-concat
* 				   at its end-of-text position; if it is, just splice
* 				   it into place and the beginning is shaped; If not,
* 				   move on to a position further forward that is clear
* 				   of unsafe-to-concat and retry up to there, and repeat.
* 				   A slight complication will arise in the
* 				   implementation of the algorithm above,
* 				   because while our buffer API has a way to
* 				   return flags for position corresponding to
* 				   start-of-text, there is currently no position
* 				   corresponding to end-of-text.  This limitation
* 				   can be alleviated by shaping more text than needed
* 				   and looking for unsafe-to-concat flag within text
* 				   clusters.
* 				   The #HB_GLYPH_FLAG_UNSAFE_TO_BREAK flag will
* 				   always imply this flag.
*				   To use this flag, you must enable the buffer flag
*				   @HB_BUFFER_FLAG_PRODUCE_UNSAFE_TO_CONCAT during
*				   shaping, otherwise the buffer flag will not be
*				   reliably produced.
* 				   Since: 4.0.0
* @HB_GLYPH_FLAG_SAFE_TO_INSERT_TATWEEL: In scripts that use elongation (Arabic,
Mongolian, Syriac, etc.), this flag signifies
that it is safe to insert a U+0640 TATWEEL
character before this cluster for elongation.
This flag does not determine the
script-specific elongation places, but only
when it is safe to do the elongation without
interrupting text shaping.
Since: 5.1.0
* @HB_GLYPH_FLAG_DEFINED: All the currently defined flags.
*
* Flags for #hb_glyph_info_t.
*
* Since: 1.5.0
*/
glyph_flags_t :: enum s32 {
    UNSAFE_TO_BREAK        :: 1;
    UNSAFE_TO_CONCAT       :: 2;
    SAFE_TO_INSERT_TATWEEL :: 4;

    DEFINED                :: 7;

    HB_GLYPH_FLAG_UNSAFE_TO_BREAK        :: UNSAFE_TO_BREAK;
    HB_GLYPH_FLAG_UNSAFE_TO_CONCAT       :: UNSAFE_TO_CONCAT;
    HB_GLYPH_FLAG_SAFE_TO_INSERT_TATWEEL :: SAFE_TO_INSERT_TATWEEL;

    HB_GLYPH_FLAG_DEFINED                :: DEFINED;
}

glyph_info_get_glyph_flags :: (info: *glyph_info_t) -> glyph_flags_t #foreign harfbuzz "hb_glyph_info_get_glyph_flags";

/**
* hb_glyph_position_t:
* @x_advance: how much the line advances after drawing this glyph when setting
*             text in horizontal direction.
* @y_advance: how much the line advances after drawing this glyph when setting
*             text in vertical direction.
* @x_offset: how much the glyph moves on the X-axis before drawing it, this
*            should not affect how much the line advances.
* @y_offset: how much the glyph moves on the Y-axis before drawing it, this
*            should not affect how much the line advances.
*
* The #hb_glyph_position_t is the structure that holds the positions of the
* glyph in both horizontal and vertical directions. All positions in
* #hb_glyph_position_t are relative to the current point.
*
*/
glyph_position_t :: struct {
    x_advance: position_t;
    y_advance: position_t;
    x_offset:  position_t;
    y_offset:  position_t;

    /*< private >*/
    var:       var_int_t;
}

/**
* hb_segment_properties_t:
* @direction: the #hb_direction_t of the buffer, see hb_buffer_set_direction().
* @script: the #hb_script_t of the buffer, see hb_buffer_set_script().
* @language: the #hb_language_t of the buffer, see hb_buffer_set_language().
*
* The structure that holds various text properties of an #hb_buffer_t. Can be
* set and retrieved using hb_buffer_set_segment_properties() and
* hb_buffer_get_segment_properties(), respectively.
*/
segment_properties_t :: struct {
    direction: direction_t;
    script:    script_t;
    language:  language_t;

    /*< private >*/
    reserved1: *void;
    reserved2: *void;
}

segment_properties_equal :: (a: *segment_properties_t, b: *segment_properties_t) -> bool_t #foreign harfbuzz "hb_segment_properties_equal";

segment_properties_hash :: (p: *segment_properties_t) -> u32 #foreign harfbuzz "hb_segment_properties_hash";

segment_properties_overlay :: (p: *segment_properties_t, src: *segment_properties_t) -> void #foreign harfbuzz "hb_segment_properties_overlay";

buffer_t :: struct {}

buffer_create :: () -> *buffer_t #foreign harfbuzz "hb_buffer_create";

buffer_create_similar :: (src: *buffer_t) -> *buffer_t #foreign harfbuzz "hb_buffer_create_similar";

buffer_reset :: (buffer: *buffer_t) -> void #foreign harfbuzz "hb_buffer_reset";

buffer_get_empty :: () -> *buffer_t #foreign harfbuzz "hb_buffer_get_empty";

buffer_reference :: (buffer: *buffer_t) -> *buffer_t #foreign harfbuzz "hb_buffer_reference";

buffer_destroy :: (buffer: *buffer_t) -> void #foreign harfbuzz "hb_buffer_destroy";

buffer_set_user_data :: (buffer: *buffer_t, key: *user_data_key_t, data: *void, destroy: destroy_func_t, replace: bool_t) -> bool_t #foreign harfbuzz "hb_buffer_set_user_data";

buffer_get_user_data :: (buffer: *buffer_t, key: *user_data_key_t) -> *void #foreign harfbuzz "hb_buffer_get_user_data";

/**
* hb_buffer_content_type_t:
* @HB_BUFFER_CONTENT_TYPE_INVALID: Initial value for new buffer.
* @HB_BUFFER_CONTENT_TYPE_UNICODE: The buffer contains input characters (before shaping).
* @HB_BUFFER_CONTENT_TYPE_GLYPHS: The buffer contains output glyphs (after shaping).
*
* The type of #hb_buffer_t contents.
*/
buffer_content_type_t :: enum s32 {
    INVALID :: 0;
    UNICODE :: 1;
    GLYPHS  :: 2;

    HB_BUFFER_CONTENT_TYPE_INVALID :: INVALID;
    HB_BUFFER_CONTENT_TYPE_UNICODE :: UNICODE;
    HB_BUFFER_CONTENT_TYPE_GLYPHS  :: GLYPHS;
}

buffer_set_content_type :: (buffer: *buffer_t, content_type: buffer_content_type_t) -> void #foreign harfbuzz "hb_buffer_set_content_type";

buffer_get_content_type :: (buffer: *buffer_t) -> buffer_content_type_t #foreign harfbuzz "hb_buffer_get_content_type";

buffer_set_unicode_funcs :: (buffer: *buffer_t, unicode_funcs: *unicode_funcs_t) -> void #foreign harfbuzz "hb_buffer_set_unicode_funcs";

buffer_get_unicode_funcs :: (buffer: *buffer_t) -> *unicode_funcs_t #foreign harfbuzz "hb_buffer_get_unicode_funcs";

buffer_set_direction :: (buffer: *buffer_t, direction: direction_t) -> void #foreign harfbuzz "hb_buffer_set_direction";

buffer_get_direction :: (buffer: *buffer_t) -> direction_t #foreign harfbuzz "hb_buffer_get_direction";

buffer_set_script :: (buffer: *buffer_t, script: script_t) -> void #foreign harfbuzz "hb_buffer_set_script";

buffer_get_script :: (buffer: *buffer_t) -> script_t #foreign harfbuzz "hb_buffer_get_script";

buffer_set_language :: (buffer: *buffer_t, language: language_t) -> void #foreign harfbuzz "hb_buffer_set_language";

buffer_get_language :: (buffer: *buffer_t) -> language_t #foreign harfbuzz "hb_buffer_get_language";

buffer_set_segment_properties :: (buffer: *buffer_t, props: *segment_properties_t) -> void #foreign harfbuzz "hb_buffer_set_segment_properties";

buffer_get_segment_properties :: (buffer: *buffer_t, props: *segment_properties_t) -> void #foreign harfbuzz "hb_buffer_get_segment_properties";

buffer_guess_segment_properties :: (buffer: *buffer_t) -> void #foreign harfbuzz "hb_buffer_guess_segment_properties";

/**
* hb_buffer_flags_t:
* @HB_BUFFER_FLAG_DEFAULT: the default buffer flag.
* @HB_BUFFER_FLAG_BOT: flag indicating that special handling of the beginning
*                      of text paragraph can be applied to this buffer. Should usually
*                      be set, unless you are passing to the buffer only part
*                      of the text without the full context.
* @HB_BUFFER_FLAG_EOT: flag indicating that special handling of the end of text
*                      paragraph can be applied to this buffer, similar to
*                      @HB_BUFFER_FLAG_BOT.
* @HB_BUFFER_FLAG_PRESERVE_DEFAULT_IGNORABLES:
*                      flag indication that character with Default_Ignorable
*                      Unicode property should use the corresponding glyph
*                      from the font, instead of hiding them (done by
*                      replacing them with the space glyph and zeroing the
*                      advance width.)  This flag takes precedence over
*                      @HB_BUFFER_FLAG_REMOVE_DEFAULT_IGNORABLES.
* @HB_BUFFER_FLAG_REMOVE_DEFAULT_IGNORABLES:
*                      flag indication that character with Default_Ignorable
*                      Unicode property should be removed from glyph string
*                      instead of hiding them (done by replacing them with the
*                      space glyph and zeroing the advance width.)
*                      @HB_BUFFER_FLAG_PRESERVE_DEFAULT_IGNORABLES takes
*                      precedence over this flag. Since: 1.8.0
* @HB_BUFFER_FLAG_DO_NOT_INSERT_DOTTED_CIRCLE:
*                      flag indicating that a dotted circle should
*                      not be inserted in the rendering of incorrect
*                      character sequences (such at <0905 093E>). Since: 2.4.0
* @HB_BUFFER_FLAG_VERIFY:
*                      flag indicating that the hb_shape() call and its variants
*                      should perform various verification processes on the results
*                      of the shaping operation on the buffer.  If the verification
*                      fails, then either a buffer message is sent, if a message
*                      handler is installed on the buffer, or a message is written
*                      to standard error.  In either case, the shaping result might
*                      be modified to show the failed output. Since: 3.4.0
* @HB_BUFFER_FLAG_PRODUCE_UNSAFE_TO_CONCAT:
*                      flag indicating that the @HB_GLYPH_FLAG_UNSAFE_TO_CONCAT
*                      glyph-flag should be produced by the shaper. By default
*                      it will not be produced since it incurs a cost. Since: 4.0.0
* @HB_BUFFER_FLAG_PRODUCE_SAFE_TO_INSERT_TATWEEL:
*                      flag indicating that the @HB_GLYPH_FLAG_SAFE_TO_INSERT_TATWEEL
*                      glyph-flag should be produced by the shaper. By default
*                      it will not be produced. Since: 5.1.0
* @HB_BUFFER_FLAG_DEFINED: All currently defined flags: Since: 4.4.0
*
* Flags for #hb_buffer_t.
*
* Since: 0.9.20
*/
buffer_flags_t :: enum s32 {
    DEFAULT                        :: 0;
    BOT                            :: 1;
    EOT                            :: 2;
    PRESERVE_DEFAULT_IGNORABLES    :: 4;
    REMOVE_DEFAULT_IGNORABLES      :: 8;
    DO_NOT_INSERT_DOTTED_CIRCLE    :: 16;
    VERIFY                         :: 32;
    PRODUCE_UNSAFE_TO_CONCAT       :: 64;
    PRODUCE_SAFE_TO_INSERT_TATWEEL :: 128;

    DEFINED                        :: 255;

    HB_BUFFER_FLAG_DEFAULT                        :: DEFAULT;
    HB_BUFFER_FLAG_BOT                            :: BOT;
    HB_BUFFER_FLAG_EOT                            :: EOT;
    HB_BUFFER_FLAG_PRESERVE_DEFAULT_IGNORABLES    :: PRESERVE_DEFAULT_IGNORABLES;
    HB_BUFFER_FLAG_REMOVE_DEFAULT_IGNORABLES      :: REMOVE_DEFAULT_IGNORABLES;
    HB_BUFFER_FLAG_DO_NOT_INSERT_DOTTED_CIRCLE    :: DO_NOT_INSERT_DOTTED_CIRCLE;
    HB_BUFFER_FLAG_VERIFY                         :: VERIFY;
    HB_BUFFER_FLAG_PRODUCE_UNSAFE_TO_CONCAT       :: PRODUCE_UNSAFE_TO_CONCAT;
    HB_BUFFER_FLAG_PRODUCE_SAFE_TO_INSERT_TATWEEL :: PRODUCE_SAFE_TO_INSERT_TATWEEL;

    HB_BUFFER_FLAG_DEFINED                        :: DEFINED;
}

buffer_set_flags :: (buffer: *buffer_t, flags: buffer_flags_t) -> void #foreign harfbuzz "hb_buffer_set_flags";

buffer_get_flags :: (buffer: *buffer_t) -> buffer_flags_t #foreign harfbuzz "hb_buffer_get_flags";

/**
* hb_buffer_cluster_level_t:
* @HB_BUFFER_CLUSTER_LEVEL_MONOTONE_GRAPHEMES: Return cluster values grouped by graphemes into
*   monotone order.
* @HB_BUFFER_CLUSTER_LEVEL_MONOTONE_CHARACTERS: Return cluster values grouped into monotone order.
* @HB_BUFFER_CLUSTER_LEVEL_CHARACTERS: Don't group cluster values.
* @HB_BUFFER_CLUSTER_LEVEL_DEFAULT: Default cluster level,
*   equal to @HB_BUFFER_CLUSTER_LEVEL_MONOTONE_GRAPHEMES.
* @HB_BUFFER_CLUSTER_LEVEL_GRAPHEMES: Only group clusters, but don't enforce monotone order.
*
* Data type for holding HarfBuzz's clustering behavior options. The cluster level
* dictates one aspect of how HarfBuzz will treat non-base characters
* during shaping.
*
* In @HB_BUFFER_CLUSTER_LEVEL_MONOTONE_GRAPHEMES, non-base
* characters are merged into the cluster of the base character that precedes them.
* There is also cluster merging every time the clusters will otherwise become non-monotone.
*
* In @HB_BUFFER_CLUSTER_LEVEL_MONOTONE_CHARACTERS, non-base characters are initially
* assigned their own cluster values, which are not merged into preceding base
* clusters. This allows HarfBuzz to perform additional operations like reorder
* sequences of adjacent marks. The output is still monotone, but the cluster
* values are more granular.
*
* In @HB_BUFFER_CLUSTER_LEVEL_CHARACTERS, non-base characters are assigned their
* own cluster values, which are not merged into preceding base clusters. Moreover,
* the cluster values are not merged into monotone order. This is the most granular
* cluster level, and it is useful for clients that need to know the exact cluster
* values of each character, but is harder to use for clients, since clusters
* might appear in any order.
*
* In @HB_BUFFER_CLUSTER_LEVEL_GRAPHEMES, non-base characters are merged into the
* cluster of the base character that precedes them. This is similar to the Unicode
* Grapheme Cluster algorithm, but it is not exactly the same. The output is
* not forced to be monotone. This is useful for clients that want to use HarfBuzz
* as a cheap implementation of the Unicode Grapheme Cluster algorithm.
*
* @HB_BUFFER_CLUSTER_LEVEL_MONOTONE_GRAPHEMES is the default, because it maintains
* backward compatibility with older versions of HarfBuzz. New client programs that
* do not need to maintain such backward compatibility are recommended to use
* @HB_BUFFER_CLUSTER_LEVEL_MONOTONE_CHARACTERS instead of the default.
*
* Since: 0.9.42
*/
buffer_cluster_level_t :: enum s32 {
    MONOTONE_GRAPHEMES  :: 0;
    MONOTONE_CHARACTERS :: 1;
    CHARACTERS          :: 2;
    GRAPHEMES           :: 3;
    DEFAULT             :: 0;

    HB_BUFFER_CLUSTER_LEVEL_MONOTONE_GRAPHEMES  :: MONOTONE_GRAPHEMES;
    HB_BUFFER_CLUSTER_LEVEL_MONOTONE_CHARACTERS :: MONOTONE_CHARACTERS;
    HB_BUFFER_CLUSTER_LEVEL_CHARACTERS          :: CHARACTERS;
    HB_BUFFER_CLUSTER_LEVEL_GRAPHEMES           :: GRAPHEMES;
    HB_BUFFER_CLUSTER_LEVEL_DEFAULT             :: DEFAULT;
}

buffer_set_cluster_level :: (buffer: *buffer_t, cluster_level: buffer_cluster_level_t) -> void #foreign harfbuzz "hb_buffer_set_cluster_level";

buffer_get_cluster_level :: (buffer: *buffer_t) -> buffer_cluster_level_t #foreign harfbuzz "hb_buffer_get_cluster_level";

buffer_set_replacement_codepoint :: (buffer: *buffer_t, replacement: codepoint_t) -> void #foreign harfbuzz "hb_buffer_set_replacement_codepoint";

buffer_get_replacement_codepoint :: (buffer: *buffer_t) -> codepoint_t #foreign harfbuzz "hb_buffer_get_replacement_codepoint";

buffer_set_invisible_glyph :: (buffer: *buffer_t, invisible: codepoint_t) -> void #foreign harfbuzz "hb_buffer_set_invisible_glyph";

buffer_get_invisible_glyph :: (buffer: *buffer_t) -> codepoint_t #foreign harfbuzz "hb_buffer_get_invisible_glyph";

buffer_set_not_found_glyph :: (buffer: *buffer_t, not_found: codepoint_t) -> void #foreign harfbuzz "hb_buffer_set_not_found_glyph";

buffer_get_not_found_glyph :: (buffer: *buffer_t) -> codepoint_t #foreign harfbuzz "hb_buffer_get_not_found_glyph";

buffer_set_not_found_variation_selector_glyph :: (buffer: *buffer_t, not_found_variation_selector: codepoint_t) -> void #foreign harfbuzz "hb_buffer_set_not_found_variation_selector_glyph";

buffer_get_not_found_variation_selector_glyph :: (buffer: *buffer_t) -> codepoint_t #foreign harfbuzz "hb_buffer_get_not_found_variation_selector_glyph";

buffer_set_random_state :: (buffer: *buffer_t, state: u32) -> void #foreign harfbuzz "hb_buffer_set_random_state";

buffer_get_random_state :: (buffer: *buffer_t) -> u32 #foreign harfbuzz "hb_buffer_get_random_state";

/*
* Content API.
*/
buffer_clear_contents :: (buffer: *buffer_t) -> void #foreign harfbuzz "hb_buffer_clear_contents";

buffer_pre_allocate :: (buffer: *buffer_t, size: u32) -> bool_t #foreign harfbuzz "hb_buffer_pre_allocate";

buffer_allocation_successful :: (buffer: *buffer_t) -> bool_t #foreign harfbuzz "hb_buffer_allocation_successful";

buffer_reverse :: (buffer: *buffer_t) -> void #foreign harfbuzz "hb_buffer_reverse";

buffer_reverse_range :: (buffer: *buffer_t, start: u32, end: u32) -> void #foreign harfbuzz "hb_buffer_reverse_range";

buffer_reverse_clusters :: (buffer: *buffer_t) -> void #foreign harfbuzz "hb_buffer_reverse_clusters";

/* Filling the buffer in */
buffer_add :: (buffer: *buffer_t, codepoint: codepoint_t, cluster: u32) -> void #foreign harfbuzz "hb_buffer_add";

buffer_add_utf8 :: (buffer: *buffer_t, text: *u8, text_length: s32, item_offset: u32, item_length: s32) -> void #foreign harfbuzz "hb_buffer_add_utf8";

buffer_add_utf16 :: (buffer: *buffer_t, text: *u16, text_length: s32, item_offset: u32, item_length: s32) -> void #foreign harfbuzz "hb_buffer_add_utf16";

buffer_add_utf32 :: (buffer: *buffer_t, text: *u32, text_length: s32, item_offset: u32, item_length: s32) -> void #foreign harfbuzz "hb_buffer_add_utf32";

buffer_add_latin1 :: (buffer: *buffer_t, text: *u8, text_length: s32, item_offset: u32, item_length: s32) -> void #foreign harfbuzz "hb_buffer_add_latin1";

buffer_add_codepoints :: (buffer: *buffer_t, text: *codepoint_t, text_length: s32, item_offset: u32, item_length: s32) -> void #foreign harfbuzz "hb_buffer_add_codepoints";

buffer_append :: (buffer: *buffer_t, source: *buffer_t, start: u32, end: u32) -> void #foreign harfbuzz "hb_buffer_append";

buffer_set_length :: (buffer: *buffer_t, length: u32) -> bool_t #foreign harfbuzz "hb_buffer_set_length";

buffer_get_length :: (buffer: *buffer_t) -> u32 #foreign harfbuzz "hb_buffer_get_length";

/* Getting glyphs out of the buffer */
buffer_get_glyph_infos :: (buffer: *buffer_t, length: *u32) -> *glyph_info_t #foreign harfbuzz "hb_buffer_get_glyph_infos";

buffer_get_glyph_positions :: (buffer: *buffer_t, length: *u32) -> *glyph_position_t #foreign harfbuzz "hb_buffer_get_glyph_positions";

buffer_has_positions :: (buffer: *buffer_t) -> bool_t #foreign harfbuzz "hb_buffer_has_positions";

buffer_normalize_glyphs :: (buffer: *buffer_t) -> void #foreign harfbuzz "hb_buffer_normalize_glyphs";

/**
* hb_buffer_serialize_flags_t:
* @HB_BUFFER_SERIALIZE_FLAG_DEFAULT: serialize glyph names, clusters and positions.
* @HB_BUFFER_SERIALIZE_FLAG_NO_CLUSTERS: do not serialize glyph cluster.
* @HB_BUFFER_SERIALIZE_FLAG_NO_POSITIONS: do not serialize glyph position information.
* @HB_BUFFER_SERIALIZE_FLAG_NO_GLYPH_NAMES: do no serialize glyph name.
* @HB_BUFFER_SERIALIZE_FLAG_GLYPH_EXTENTS: serialize glyph extents.
* @HB_BUFFER_SERIALIZE_FLAG_GLYPH_FLAGS: serialize glyph flags. Since: 1.5.0
* @HB_BUFFER_SERIALIZE_FLAG_NO_ADVANCES: do not serialize glyph advances,
*  glyph offsets will reflect absolute glyph positions. Since: 1.8.0.
*  Note: when this flag is used with a partial range of the buffer (i.e.
*  @start is not 0), calculating the absolute positions has a cost
*  proportional to @start. If the buffer is serialized in many small
*  chunks, this can lead to quadratic behavior. It is recommended to
*  use a larger @buf_size to minimize this cost.
* @HB_BUFFER_SERIALIZE_FLAG_DEFINED: All currently defined flags. Since: 4.4.0
*
* Flags that control what glyph information are serialized in hb_buffer_serialize_glyphs().
*
* Since: 0.9.20
*/
buffer_serialize_flags_t :: enum s32 {
    DEFAULT        :: 0;
    NO_CLUSTERS    :: 1;
    NO_POSITIONS   :: 2;
    NO_GLYPH_NAMES :: 4;
    GLYPH_EXTENTS  :: 8;
    GLYPH_FLAGS    :: 16;
    NO_ADVANCES    :: 32;

    DEFINED        :: 63;

    HB_BUFFER_SERIALIZE_FLAG_DEFAULT        :: DEFAULT;
    HB_BUFFER_SERIALIZE_FLAG_NO_CLUSTERS    :: NO_CLUSTERS;
    HB_BUFFER_SERIALIZE_FLAG_NO_POSITIONS   :: NO_POSITIONS;
    HB_BUFFER_SERIALIZE_FLAG_NO_GLYPH_NAMES :: NO_GLYPH_NAMES;
    HB_BUFFER_SERIALIZE_FLAG_GLYPH_EXTENTS  :: GLYPH_EXTENTS;
    HB_BUFFER_SERIALIZE_FLAG_GLYPH_FLAGS    :: GLYPH_FLAGS;
    HB_BUFFER_SERIALIZE_FLAG_NO_ADVANCES    :: NO_ADVANCES;

    HB_BUFFER_SERIALIZE_FLAG_DEFINED        :: DEFINED;
}

/**
* hb_buffer_serialize_format_t:
* @HB_BUFFER_SERIALIZE_FORMAT_TEXT: a human-readable, plain text format.
* @HB_BUFFER_SERIALIZE_FORMAT_JSON: a machine-readable JSON format.
* @HB_BUFFER_SERIALIZE_FORMAT_INVALID: invalid format.
*
* The buffer serialization and de-serialization format used in
* hb_buffer_serialize_glyphs() and hb_buffer_deserialize_glyphs().
*
* Since: 0.9.2
*/
buffer_serialize_format_t :: enum s32 {
    TEXT    :: 1413830740;
    JSON    :: 1246973774;
    INVALID :: 0;

    HB_BUFFER_SERIALIZE_FORMAT_TEXT    :: TEXT;
    HB_BUFFER_SERIALIZE_FORMAT_JSON    :: JSON;
    HB_BUFFER_SERIALIZE_FORMAT_INVALID :: INVALID;
}

buffer_serialize_format_from_string :: (str: *u8, len: s32) -> buffer_serialize_format_t #foreign harfbuzz "hb_buffer_serialize_format_from_string";

buffer_serialize_format_to_string :: (format: buffer_serialize_format_t) -> *u8 #foreign harfbuzz "hb_buffer_serialize_format_to_string";

buffer_serialize_list_formats :: () -> **u8 #foreign harfbuzz "hb_buffer_serialize_list_formats";

buffer_serialize_glyphs :: (buffer: *buffer_t, start: u32, end: u32, buf: *u8, buf_size: u32, buf_consumed: *u32, font: *font_t, format: buffer_serialize_format_t, flags: buffer_serialize_flags_t) -> u32 #foreign harfbuzz "hb_buffer_serialize_glyphs";

buffer_serialize_unicode :: (buffer: *buffer_t, start: u32, end: u32, buf: *u8, buf_size: u32, buf_consumed: *u32, format: buffer_serialize_format_t, flags: buffer_serialize_flags_t) -> u32 #foreign harfbuzz "hb_buffer_serialize_unicode";

buffer_serialize :: (buffer: *buffer_t, start: u32, end: u32, buf: *u8, buf_size: u32, buf_consumed: *u32, font: *font_t, format: buffer_serialize_format_t, flags: buffer_serialize_flags_t) -> u32 #foreign harfbuzz "hb_buffer_serialize";

buffer_deserialize_glyphs :: (buffer: *buffer_t, buf: *u8, buf_len: s32, end_ptr: **u8, font: *font_t, format: buffer_serialize_format_t) -> bool_t #foreign harfbuzz "hb_buffer_deserialize_glyphs";

buffer_deserialize_unicode :: (buffer: *buffer_t, buf: *u8, buf_len: s32, end_ptr: **u8, format: buffer_serialize_format_t) -> bool_t #foreign harfbuzz "hb_buffer_deserialize_unicode";

buffer_deserialize_glyphs2 :: (buffer: *buffer_t, buf: *u8, buf_len: s32, buf_consumed: *u32, font: *font_t, format: buffer_serialize_format_t) -> bool_t #foreign harfbuzz "hb_buffer_deserialize_glyphs2";

buffer_deserialize_unicode2 :: (buffer: *buffer_t, buf: *u8, buf_len: s32, buf_consumed: *u32, format: buffer_serialize_format_t) -> bool_t #foreign harfbuzz "hb_buffer_deserialize_unicode2";

/**
* hb_buffer_diff_flags_t:
* @HB_BUFFER_DIFF_FLAG_EQUAL: equal buffers.
* @HB_BUFFER_DIFF_FLAG_CONTENT_TYPE_MISMATCH: buffers with different
*     #hb_buffer_content_type_t.
* @HB_BUFFER_DIFF_FLAG_LENGTH_MISMATCH: buffers with differing length.
* @HB_BUFFER_DIFF_FLAG_NOTDEF_PRESENT: `.notdef` glyph is present in the
*     reference buffer.
* @HB_BUFFER_DIFF_FLAG_DOTTED_CIRCLE_PRESENT: dotted circle glyph is present
*     in the reference buffer.
* @HB_BUFFER_DIFF_FLAG_CODEPOINT_MISMATCH: difference in #hb_glyph_info_t.codepoint
* @HB_BUFFER_DIFF_FLAG_CLUSTER_MISMATCH: difference in #hb_glyph_info_t.cluster
* @HB_BUFFER_DIFF_FLAG_GLYPH_FLAGS_MISMATCH: difference in #hb_glyph_flags_t.
* @HB_BUFFER_DIFF_FLAG_POSITION_MISMATCH: difference in #hb_glyph_position_t.
*
* Flags from comparing two #hb_buffer_t's.
*
* Buffer with different #hb_buffer_content_type_t cannot be meaningfully
* compared in any further detail.
*
* For buffers with differing length, the per-glyph comparison is not
* attempted, though we do still scan reference buffer for dotted circle and
* `.notdef` glyphs.
*
* If the buffers have the same length, we compare them glyph-by-glyph and
* report which aspect(s) of the glyph info/position are different.
*
* Since: 1.5.0
*/
buffer_diff_flags_t :: enum s32 {
    EQUAL                 :: 0;

    CONTENT_TYPE_MISMATCH :: 1;

    LENGTH_MISMATCH       :: 2;

    NOTDEF_PRESENT        :: 4;
    DOTTED_CIRCLE_PRESENT :: 8;

    CODEPOINT_MISMATCH    :: 16;
    CLUSTER_MISMATCH      :: 32;
    GLYPH_FLAGS_MISMATCH  :: 64;
    POSITION_MISMATCH     :: 128;

    HB_BUFFER_DIFF_FLAG_EQUAL                 :: EQUAL;

    HB_BUFFER_DIFF_FLAG_CONTENT_TYPE_MISMATCH :: CONTENT_TYPE_MISMATCH;

    HB_BUFFER_DIFF_FLAG_LENGTH_MISMATCH       :: LENGTH_MISMATCH;

    HB_BUFFER_DIFF_FLAG_NOTDEF_PRESENT        :: NOTDEF_PRESENT;
    HB_BUFFER_DIFF_FLAG_DOTTED_CIRCLE_PRESENT :: DOTTED_CIRCLE_PRESENT;

    HB_BUFFER_DIFF_FLAG_CODEPOINT_MISMATCH    :: CODEPOINT_MISMATCH;
    HB_BUFFER_DIFF_FLAG_CLUSTER_MISMATCH      :: CLUSTER_MISMATCH;
    HB_BUFFER_DIFF_FLAG_GLYPH_FLAGS_MISMATCH  :: GLYPH_FLAGS_MISMATCH;
    HB_BUFFER_DIFF_FLAG_POSITION_MISMATCH     :: POSITION_MISMATCH;
}

/* Compare the contents of two buffers, report types of differences. */
buffer_diff :: (buffer: *buffer_t, reference: *buffer_t, dottedcircle_glyph: codepoint_t, position_fuzz: u32) -> buffer_diff_flags_t #foreign harfbuzz "hb_buffer_diff";

/**
* hb_buffer_message_func_t:
* @buffer: An #hb_buffer_t to work upon
* @font: The #hb_font_t the @buffer is shaped with
* @message: `NULL`-terminated message passed to the function
* @user_data: User data pointer passed by the caller
*
* A callback method for #hb_buffer_t. The method gets called with the
* #hb_buffer_t it was set on, the #hb_font_t the buffer is shaped with and a
* message describing what step of the shaping process will be performed.
* Returning `false` from this method will skip this shaping step and move to
* the next one.
*
* Return value: `true` to perform the shaping step, `false` to skip it.
*
* Since: 1.1.3
*/
buffer_message_func_t :: #type (buffer: *buffer_t, font: *font_t, message: *u8, user_data: *void) -> bool_t #c_call;

buffer_set_message_func :: (buffer: *buffer_t, func: buffer_message_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_buffer_set_message_func";

buffer_changed :: (buffer: *buffer_t) -> void #foreign harfbuzz "hb_buffer_changed";

/**
* hb_font_get_glyph_func_t:
* @font: #hb_font_t to work upon
* @font_data: @font user data pointer
* @unicode: The Unicode code point to query
* @variation_selector: The  variation-selector code point to query
* @glyph: (out): The glyph ID retrieved
* @user_data: User data pointer passed by the caller
*
* A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
*
* This method should retrieve the glyph ID for a specified Unicode code point
* font, with an optional variation selector.
*
* Return value: `true` if data found, `false` otherwise
* Deprecated: 1.2.3
*
**/
font_get_glyph_func_t :: #type (font: *font_t, font_data: *void, unicode: codepoint_t, variation_selector: codepoint_t, glyph: *codepoint_t, user_data: *void) -> bool_t #c_call;

font_funcs_set_glyph_func :: (ffuncs: *font_funcs_t, func: font_get_glyph_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_font_funcs_set_glyph_func";

/**
* hb_unicode_eastasian_width_func_t:
* @ufuncs: A Unicode-functions structure
* @unicode: The code point to query
* @user_data: User data pointer passed by the caller
*
* A virtual method for the #hb_unicode_funcs_t structure.
*
* Deprecated: 2.0.0
*/
unicode_eastasian_width_func_t :: #type (ufuncs: *unicode_funcs_t, unicode: codepoint_t, user_data: *void) -> u32 #c_call;

/**
* hb_unicode_funcs_set_eastasian_width_func:
* @ufuncs: a Unicode-function structure
* @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
* @user_data: Data to pass to @func
* @destroy: (nullable): The function to call when @user_data is not needed anymore
*
* Sets the implementation function for #hb_unicode_eastasian_width_func_t.
*
* Since: 0.9.2
* Deprecated: 2.0.0
**/
unicode_funcs_set_eastasian_width_func :: (ufuncs: *unicode_funcs_t, func: unicode_eastasian_width_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_unicode_funcs_set_eastasian_width_func";

/**
* hb_unicode_eastasian_width:
* @ufuncs: a Unicode-function structure
* @unicode: The code point to query
*
* Don't use. Not used by HarfBuzz.
*
* Since: 0.9.2
* Deprecated: 2.0.0
**/
unicode_eastasian_width :: (ufuncs: *unicode_funcs_t, unicode: codepoint_t) -> u32 #foreign harfbuzz "hb_unicode_eastasian_width";

/**
* hb_unicode_decompose_compatibility_func_t:
* @ufuncs: a Unicode function structure
* @u: codepoint to decompose
* @decomposed: address of codepoint array (of length #HB_UNICODE_MAX_DECOMPOSITION_LEN) to write decomposition into
* @user_data: user data pointer as passed to hb_unicode_funcs_set_decompose_compatibility_func()
*
* Fully decompose @u to its Unicode compatibility decomposition. The codepoints of the decomposition will be written to @decomposed.
* The complete length of the decomposition will be returned.
*
* If @u has no compatibility decomposition, zero should be returned.
*
* The Unicode standard guarantees that a buffer of length #HB_UNICODE_MAX_DECOMPOSITION_LEN codepoints will always be sufficient for any
* compatibility decomposition plus an terminating value of 0.  Consequently, @decompose must be allocated by the caller to be at least this length.  Implementations
* of this function type must ensure that they do not write past the provided array.
*
* Return value: number of codepoints in the full compatibility decomposition of @u, or 0 if no decomposition available.
*
* Deprecated: 2.0.0
*/
unicode_decompose_compatibility_func_t :: #type (ufuncs: *unicode_funcs_t, u: codepoint_t, decomposed: *codepoint_t, user_data: *void) -> u32 #c_call;

/**
* hb_unicode_funcs_set_decompose_compatibility_func:
* @ufuncs: A Unicode-functions structure
* @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
* @user_data: Data to pass to @func
* @destroy: (nullable): The function to call when @user_data is not needed anymore
*
* Sets the implementation function for #hb_unicode_decompose_compatibility_func_t.
*
*
*
* Since: 0.9.2
* Deprecated: 2.0.0
**/
unicode_funcs_set_decompose_compatibility_func :: (ufuncs: *unicode_funcs_t, func: unicode_decompose_compatibility_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_unicode_funcs_set_decompose_compatibility_func";

unicode_decompose_compatibility :: (ufuncs: *unicode_funcs_t, u: codepoint_t, decomposed: *codepoint_t) -> u32 #foreign harfbuzz "hb_unicode_decompose_compatibility";

/**
* hb_font_get_glyph_v_kerning_func_t:
*
* A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
*
* This method should retrieve the kerning-adjustment value for a glyph-pair in
* the specified font, for vertical text segments.
*
**/
font_get_glyph_v_kerning_func_t :: font_get_glyph_kerning_func_t;

/**
* hb_font_funcs_set_glyph_v_kerning_func:
* @ffuncs: A font-function structure
* @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
* @user_data: Data to pass to @func
* @destroy: (nullable): The function to call when @user_data is not needed anymore
*
* Sets the implementation function for #hb_font_get_glyph_v_kerning_func_t.
*
* Since: 0.9.2
* Deprecated: 2.0.0
**/
font_funcs_set_glyph_v_kerning_func :: (ffuncs: *font_funcs_t, func: font_get_glyph_v_kerning_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_font_funcs_set_glyph_v_kerning_func";

font_get_glyph_v_kerning :: (font: *font_t, top_glyph: codepoint_t, bottom_glyph: codepoint_t) -> position_t #foreign harfbuzz "hb_font_get_glyph_v_kerning";

/**
* hb_font_get_glyph_shape_func_t:
* @font: #hb_font_t to work upon
* @font_data: @font user data pointer
* @glyph: The glyph ID to query
* @draw_funcs: The draw functions to send the shape data to
* @draw_data: The data accompanying the draw functions
* @user_data: User data pointer passed by the caller
*
* A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
*
* Since: 4.0.0
* Deprecated: 7.0.0: Use #hb_font_draw_glyph_func_t instead
**/
font_get_glyph_shape_func_t :: #type (font: *font_t, font_data: *void, glyph: codepoint_t, draw_funcs: *draw_funcs_t, draw_data: *void, user_data: *void) -> void #c_call;

/**
* hb_font_draw_glyph_func_t:
* @font: #hb_font_t to work upon
* @font_data: @font user data pointer
* @glyph: The glyph ID to query
* @draw_funcs: The draw functions to send the shape data to
* @draw_data: The data accompanying the draw functions
* @user_data: User data pointer passed by the caller
*
* A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
*
* Since: 7.0.0
* Deprecated: 11.2.0: Use hb_font_draw_glyph_func_or_fail_t instead.
**/
font_draw_glyph_func_t :: #type (font: *font_t, font_data: *void, glyph: codepoint_t, draw_funcs: *draw_funcs_t, draw_data: *void, user_data: *void) -> void #c_call;

/**
* hb_font_paint_glyph_func_t:
* @font: #hb_font_t to work upon
* @font_data: @font user data pointer
* @glyph: The glyph ID to query
* @paint_funcs: The paint functions to use
* @paint_data: The data accompanying the paint functions
* @palette_index: The color palette to use
* @foreground: The foreground color
* @user_data: User data pointer passed by the caller
*
* A virtual method for the #hb_font_funcs_t of an #hb_font_t object.
*
* Since: 7.0.0
* Deprecated: 11.2.0: Use hb_font_paint_glyph_or_fail_func_t instead.
*/
font_paint_glyph_func_t :: #type (font: *font_t, font_data: *void, glyph: codepoint_t, paint_funcs: *paint_funcs_t, paint_data: *void, palette_index: u32, foreground: color_t, user_data: *void) -> bool_t #c_call;

/**
* hb_font_funcs_set_glyph_shape_func:
* @ffuncs: A font-function structure
* @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
* @user_data: Data to pass to @func
* @destroy: (nullable): The function to call when @user_data is not needed anymore
*
* Sets the implementation function for #hb_font_get_glyph_shape_func_t,
* which is the same as #hb_font_draw_glyph_func_t.
*
* Since: 4.0.0
* Deprecated: 7.0.0: Use hb_font_funcs_set_draw_glyph_func() instead
**/
font_funcs_set_glyph_shape_func :: (ffuncs: *font_funcs_t, func: font_get_glyph_shape_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_font_funcs_set_glyph_shape_func";

/**
* hb_font_funcs_set_draw_glyph_func:
* @ffuncs: A font-function structure
* @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
* @user_data: Data to pass to @func
* @destroy: (nullable): The function to call when @user_data is not needed anymore
*
* Sets the implementation function for #hb_font_draw_glyph_func_t.
*
* Since: 7.0.0
* Deprecated: 11.2.0: Use hb_font_funcs_set_draw_glyph_or_fail_func instead.
**/
font_funcs_set_draw_glyph_func :: (ffuncs: *font_funcs_t, func: font_draw_glyph_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_font_funcs_set_draw_glyph_func";

/**
* hb_font_funcs_set_paint_glyph_func:
* @ffuncs: A font-function structure
* @func: (closure user_data) (destroy destroy) (scope notified): The callback function to assign
* @user_data: Data to pass to @func
* @destroy: (nullable): The function to call when @user_data is no longer needed
*
* Sets the implementation function for #hb_font_paint_glyph_func_t.
*
* Since: 7.0.0
* Deprecated: 11.2.0: Use hb_font_funcs_set_paint_glyph_or_fail_func() instead.
*/
font_funcs_set_paint_glyph_func :: (ffuncs: *font_funcs_t, func: font_paint_glyph_func_t, user_data: *void, destroy: destroy_func_t) -> void #foreign harfbuzz "hb_font_funcs_set_paint_glyph_func";

font_get_glyph_shape :: (font: *font_t, glyph: codepoint_t, dfuncs: *draw_funcs_t, draw_data: *void) -> void #foreign harfbuzz "hb_font_get_glyph_shape";

font_set_face :: (font: *font_t, face: *face_t) -> void #foreign harfbuzz "hb_font_set_face";

shape :: (font: *font_t, buffer: *buffer_t, features: *feature_t, num_features: u32) -> void #foreign harfbuzz "hb_shape";

shape_full :: (font: *font_t, buffer: *buffer_t, features: *feature_t, num_features: u32, shaper_list: **u8) -> bool_t #foreign harfbuzz "hb_shape_full";

shape_list_shapers :: () -> **u8 #foreign harfbuzz "hb_shape_list_shapers";

shape_plan_t :: struct {}

shape_plan_create :: (face: *face_t, props: *segment_properties_t, user_features: *feature_t, num_user_features: u32, shaper_list: **u8) -> *shape_plan_t #foreign harfbuzz "hb_shape_plan_create";

shape_plan_create_cached :: (face: *face_t, props: *segment_properties_t, user_features: *feature_t, num_user_features: u32, shaper_list: **u8) -> *shape_plan_t #foreign harfbuzz "hb_shape_plan_create_cached";

shape_plan_create2 :: (face: *face_t, props: *segment_properties_t, user_features: *feature_t, num_user_features: u32, coords: *s32, num_coords: u32, shaper_list: **u8) -> *shape_plan_t #foreign harfbuzz "hb_shape_plan_create2";

shape_plan_create_cached2 :: (face: *face_t, props: *segment_properties_t, user_features: *feature_t, num_user_features: u32, coords: *s32, num_coords: u32, shaper_list: **u8) -> *shape_plan_t #foreign harfbuzz "hb_shape_plan_create_cached2";

shape_plan_get_empty :: () -> *shape_plan_t #foreign harfbuzz "hb_shape_plan_get_empty";

shape_plan_reference :: (shape_plan: *shape_plan_t) -> *shape_plan_t #foreign harfbuzz "hb_shape_plan_reference";

shape_plan_destroy :: (shape_plan: *shape_plan_t) -> void #foreign harfbuzz "hb_shape_plan_destroy";

shape_plan_set_user_data :: (shape_plan: *shape_plan_t, key: *user_data_key_t, data: *void, destroy: destroy_func_t, replace: bool_t) -> bool_t #foreign harfbuzz "hb_shape_plan_set_user_data";

shape_plan_get_user_data :: (shape_plan: *shape_plan_t, key: *user_data_key_t) -> *void #foreign harfbuzz "hb_shape_plan_get_user_data";

shape_plan_execute :: (shape_plan: *shape_plan_t, font: *font_t, buffer: *buffer_t, features: *feature_t, num_features: u32) -> bool_t #foreign harfbuzz "hb_shape_plan_execute";

shape_plan_get_shaper :: (shape_plan: *shape_plan_t) -> *u8 #foreign harfbuzz "hb_shape_plan_get_shaper";

/**
* hb_style_tag_t:
* @HB_STYLE_TAG_ITALIC: Used to vary between non-italic and italic.
* A value of 0 can be interpreted as "Roman" (non-italic); a value of 1 can
* be interpreted as (fully) italic.
* @HB_STYLE_TAG_OPTICAL_SIZE: Used to vary design to suit different text sizes.
* Non-zero. Values can be interpreted as text size, in points.
* @HB_STYLE_TAG_SLANT_ANGLE: Used to vary between upright and slanted text. Values
* must be greater than -90 and less than +90. Values can be interpreted as
* the angle, in counter-clockwise degrees, of oblique slant from whatever the
* designer considers to be upright for that font design. Typical right-leaning
* Italic fonts have a negative slant angle (typically around -12)
* @HB_STYLE_TAG_SLANT_RATIO: same as @HB_STYLE_TAG_SLANT_ANGLE expression as ratio.
* Typical right-leaning Italic fonts have a positive slant ratio (typically around 0.2)
* @HB_STYLE_TAG_WIDTH: Used to vary width of text from narrower to wider.
* Non-zero. Values can be interpreted as a percentage of whatever the font
* designer considers “normal width” for that font design.
* @HB_STYLE_TAG_WEIGHT: Used to vary stroke thicknesses or other design details
* to give variation from lighter to blacker. Values can be interpreted in direct
* comparison to values for usWeightClass in the OS/2 table,
* or the CSS font-weight property.
*
* Defined by [OpenType Design-Variation Axis Tag Registry](https://docs.microsoft.com/en-us/typography/opentype/spec/dvaraxisreg).
*
* Since: 3.0.0
**/
style_tag_t :: enum s32 {
    HB_STYLE_TAG_ITALIC       :: 1769234796;
    HB_STYLE_TAG_OPTICAL_SIZE :: 1869640570;
    HB_STYLE_TAG_SLANT_ANGLE  :: 1936486004;
    HB_STYLE_TAG_SLANT_RATIO  :: 1399615092;
    HB_STYLE_TAG_WIDTH        :: 2003072104;
    HB_STYLE_TAG_WEIGHT       :: 2003265652;

    HB_STYLE_TAG_MAX_VALUE    :: 2147483647;
    _HB_STYLE_TAG_MAX_VALUE :: HB_STYLE_TAG_MAX_VALUE;
}

style_get_value :: (font: *font_t, style_tag: style_tag_t) -> float #foreign harfbuzz "hb_style_get_value";

version :: (major: *u32, minor: *u32, micro: *u32) -> void #foreign harfbuzz "hb_version";

version_string :: () -> *u8 #foreign harfbuzz "hb_version_string";

version_atleast :: (major: u32, minor: u32, micro: u32) -> bool_t #foreign harfbuzz "hb_version_atleast";

#scope_file

#import "Basic"; // For assert

harfbuzz :: #library "windows/harfbuzz";

#run {
    {
        instance: _hb_var_int_t;
        assert(((cast(*void)(*instance._u32)) - cast(*void)(*instance)) == 0, "_hb_var_int_t._u32 has unexpected offset % instead of 0", ((cast(*void)(*instance._u32)) - cast(*void)(*instance)));
        assert(size_of(type_of(_hb_var_int_t._u32)) == 4, "_hb_var_int_t._u32 has unexpected size % instead of 4", size_of(type_of(_hb_var_int_t._u32)));
        assert(((cast(*void)(*instance.i32)) - cast(*void)(*instance)) == 0, "_hb_var_int_t.i32 has unexpected offset % instead of 0", ((cast(*void)(*instance.i32)) - cast(*void)(*instance)));
        assert(size_of(type_of(_hb_var_int_t.i32)) == 4, "_hb_var_int_t.i32 has unexpected size % instead of 4", size_of(type_of(_hb_var_int_t.i32)));
        assert(((cast(*void)(*instance._u16)) - cast(*void)(*instance)) == 0, "_hb_var_int_t._u16 has unexpected offset % instead of 0", ((cast(*void)(*instance._u16)) - cast(*void)(*instance)));
        assert(size_of(type_of(_hb_var_int_t._u16)) == 4, "_hb_var_int_t._u16 has unexpected size % instead of 4", size_of(type_of(_hb_var_int_t._u16)));
        assert(((cast(*void)(*instance.i16)) - cast(*void)(*instance)) == 0, "_hb_var_int_t.i16 has unexpected offset % instead of 0", ((cast(*void)(*instance.i16)) - cast(*void)(*instance)));
        assert(size_of(type_of(_hb_var_int_t.i16)) == 4, "_hb_var_int_t.i16 has unexpected size % instead of 4", size_of(type_of(_hb_var_int_t.i16)));
        assert(((cast(*void)(*instance._u8)) - cast(*void)(*instance)) == 0, "_hb_var_int_t._u8 has unexpected offset % instead of 0", ((cast(*void)(*instance._u8)) - cast(*void)(*instance)));
        assert(size_of(type_of(_hb_var_int_t._u8)) == 4, "_hb_var_int_t._u8 has unexpected size % instead of 4", size_of(type_of(_hb_var_int_t._u8)));
        assert(((cast(*void)(*instance.i8)) - cast(*void)(*instance)) == 0, "_hb_var_int_t.i8 has unexpected offset % instead of 0", ((cast(*void)(*instance.i8)) - cast(*void)(*instance)));
        assert(size_of(type_of(_hb_var_int_t.i8)) == 4, "_hb_var_int_t.i8 has unexpected size % instead of 4", size_of(type_of(_hb_var_int_t.i8)));
        assert(size_of(_hb_var_int_t) == 4, "_hb_var_int_t has size % instead of 4", size_of(_hb_var_int_t));
    }

    {
        instance: _hb_var_num_t;
        assert(((cast(*void)(*instance.f)) - cast(*void)(*instance)) == 0, "_hb_var_num_t.f has unexpected offset % instead of 0", ((cast(*void)(*instance.f)) - cast(*void)(*instance)));
        assert(size_of(type_of(_hb_var_num_t.f)) == 4, "_hb_var_num_t.f has unexpected size % instead of 4", size_of(type_of(_hb_var_num_t.f)));
        assert(((cast(*void)(*instance._u32)) - cast(*void)(*instance)) == 0, "_hb_var_num_t._u32 has unexpected offset % instead of 0", ((cast(*void)(*instance._u32)) - cast(*void)(*instance)));
        assert(size_of(type_of(_hb_var_num_t._u32)) == 4, "_hb_var_num_t._u32 has unexpected size % instead of 4", size_of(type_of(_hb_var_num_t._u32)));
        assert(((cast(*void)(*instance.i32)) - cast(*void)(*instance)) == 0, "_hb_var_num_t.i32 has unexpected offset % instead of 0", ((cast(*void)(*instance.i32)) - cast(*void)(*instance)));
        assert(size_of(type_of(_hb_var_num_t.i32)) == 4, "_hb_var_num_t.i32 has unexpected size % instead of 4", size_of(type_of(_hb_var_num_t.i32)));
        assert(((cast(*void)(*instance._u16)) - cast(*void)(*instance)) == 0, "_hb_var_num_t._u16 has unexpected offset % instead of 0", ((cast(*void)(*instance._u16)) - cast(*void)(*instance)));
        assert(size_of(type_of(_hb_var_num_t._u16)) == 4, "_hb_var_num_t._u16 has unexpected size % instead of 4", size_of(type_of(_hb_var_num_t._u16)));
        assert(((cast(*void)(*instance.i16)) - cast(*void)(*instance)) == 0, "_hb_var_num_t.i16 has unexpected offset % instead of 0", ((cast(*void)(*instance.i16)) - cast(*void)(*instance)));
        assert(size_of(type_of(_hb_var_num_t.i16)) == 4, "_hb_var_num_t.i16 has unexpected size % instead of 4", size_of(type_of(_hb_var_num_t.i16)));
        assert(((cast(*void)(*instance._u8)) - cast(*void)(*instance)) == 0, "_hb_var_num_t._u8 has unexpected offset % instead of 0", ((cast(*void)(*instance._u8)) - cast(*void)(*instance)));
        assert(size_of(type_of(_hb_var_num_t._u8)) == 4, "_hb_var_num_t._u8 has unexpected size % instead of 4", size_of(type_of(_hb_var_num_t._u8)));
        assert(((cast(*void)(*instance.i8)) - cast(*void)(*instance)) == 0, "_hb_var_num_t.i8 has unexpected offset % instead of 0", ((cast(*void)(*instance.i8)) - cast(*void)(*instance)));
        assert(size_of(type_of(_hb_var_num_t.i8)) == 4, "_hb_var_num_t.i8 has unexpected size % instead of 4", size_of(type_of(_hb_var_num_t.i8)));
        assert(size_of(_hb_var_num_t) == 4, "_hb_var_num_t has size % instead of 4", size_of(_hb_var_num_t));
    }

    {
        instance: user_data_key_t;
        assert(((cast(*void)(*instance.unused)) - cast(*void)(*instance)) == 0, "user_data_key_t.unused has unexpected offset % instead of 0", ((cast(*void)(*instance.unused)) - cast(*void)(*instance)));
        assert(size_of(type_of(user_data_key_t.unused)) == 1, "user_data_key_t.unused has unexpected size % instead of 1", size_of(type_of(user_data_key_t.unused)));
        assert(size_of(user_data_key_t) == 1, "user_data_key_t has size % instead of 1", size_of(user_data_key_t));
    }

    {
        instance: feature_t;
        assert(((cast(*void)(*instance.tag)) - cast(*void)(*instance)) == 0, "feature_t.tag has unexpected offset % instead of 0", ((cast(*void)(*instance.tag)) - cast(*void)(*instance)));
        assert(size_of(type_of(feature_t.tag)) == 4, "feature_t.tag has unexpected size % instead of 4", size_of(type_of(feature_t.tag)));
        assert(((cast(*void)(*instance.value)) - cast(*void)(*instance)) == 4, "feature_t.value has unexpected offset % instead of 4", ((cast(*void)(*instance.value)) - cast(*void)(*instance)));
        assert(size_of(type_of(feature_t.value)) == 4, "feature_t.value has unexpected size % instead of 4", size_of(type_of(feature_t.value)));
        assert(((cast(*void)(*instance.start)) - cast(*void)(*instance)) == 8, "feature_t.start has unexpected offset % instead of 8", ((cast(*void)(*instance.start)) - cast(*void)(*instance)));
        assert(size_of(type_of(feature_t.start)) == 4, "feature_t.start has unexpected size % instead of 4", size_of(type_of(feature_t.start)));
        assert(((cast(*void)(*instance.end)) - cast(*void)(*instance)) == 12, "feature_t.end has unexpected offset % instead of 12", ((cast(*void)(*instance.end)) - cast(*void)(*instance)));
        assert(size_of(type_of(feature_t.end)) == 4, "feature_t.end has unexpected size % instead of 4", size_of(type_of(feature_t.end)));
        assert(size_of(feature_t) == 16, "feature_t has size % instead of 16", size_of(feature_t));
    }

    {
        instance: variation_t;
        assert(((cast(*void)(*instance.tag)) - cast(*void)(*instance)) == 0, "variation_t.tag has unexpected offset % instead of 0", ((cast(*void)(*instance.tag)) - cast(*void)(*instance)));
        assert(size_of(type_of(variation_t.tag)) == 4, "variation_t.tag has unexpected size % instead of 4", size_of(type_of(variation_t.tag)));
        assert(((cast(*void)(*instance.value)) - cast(*void)(*instance)) == 4, "variation_t.value has unexpected offset % instead of 4", ((cast(*void)(*instance.value)) - cast(*void)(*instance)));
        assert(size_of(type_of(variation_t.value)) == 4, "variation_t.value has unexpected size % instead of 4", size_of(type_of(variation_t.value)));
        assert(size_of(variation_t) == 8, "variation_t has size % instead of 8", size_of(variation_t));
    }

    {
        instance: glyph_extents_t;
        assert(((cast(*void)(*instance.x_bearing)) - cast(*void)(*instance)) == 0, "glyph_extents_t.x_bearing has unexpected offset % instead of 0", ((cast(*void)(*instance.x_bearing)) - cast(*void)(*instance)));
        assert(size_of(type_of(glyph_extents_t.x_bearing)) == 4, "glyph_extents_t.x_bearing has unexpected size % instead of 4", size_of(type_of(glyph_extents_t.x_bearing)));
        assert(((cast(*void)(*instance.y_bearing)) - cast(*void)(*instance)) == 4, "glyph_extents_t.y_bearing has unexpected offset % instead of 4", ((cast(*void)(*instance.y_bearing)) - cast(*void)(*instance)));
        assert(size_of(type_of(glyph_extents_t.y_bearing)) == 4, "glyph_extents_t.y_bearing has unexpected size % instead of 4", size_of(type_of(glyph_extents_t.y_bearing)));
        assert(((cast(*void)(*instance.width)) - cast(*void)(*instance)) == 8, "glyph_extents_t.width has unexpected offset % instead of 8", ((cast(*void)(*instance.width)) - cast(*void)(*instance)));
        assert(size_of(type_of(glyph_extents_t.width)) == 4, "glyph_extents_t.width has unexpected size % instead of 4", size_of(type_of(glyph_extents_t.width)));
        assert(((cast(*void)(*instance.height)) - cast(*void)(*instance)) == 12, "glyph_extents_t.height has unexpected offset % instead of 12", ((cast(*void)(*instance.height)) - cast(*void)(*instance)));
        assert(size_of(type_of(glyph_extents_t.height)) == 4, "glyph_extents_t.height has unexpected size % instead of 4", size_of(type_of(glyph_extents_t.height)));
        assert(size_of(glyph_extents_t) == 16, "glyph_extents_t has size % instead of 16", size_of(glyph_extents_t));
    }

    {
        instance: draw_state_t;
        assert(((cast(*void)(*instance.path_open)) - cast(*void)(*instance)) == 0, "draw_state_t.path_open has unexpected offset % instead of 0", ((cast(*void)(*instance.path_open)) - cast(*void)(*instance)));
        assert(size_of(type_of(draw_state_t.path_open)) == 4, "draw_state_t.path_open has unexpected size % instead of 4", size_of(type_of(draw_state_t.path_open)));
        assert(((cast(*void)(*instance.path_start_x)) - cast(*void)(*instance)) == 4, "draw_state_t.path_start_x has unexpected offset % instead of 4", ((cast(*void)(*instance.path_start_x)) - cast(*void)(*instance)));
        assert(size_of(type_of(draw_state_t.path_start_x)) == 4, "draw_state_t.path_start_x has unexpected size % instead of 4", size_of(type_of(draw_state_t.path_start_x)));
        assert(((cast(*void)(*instance.path_start_y)) - cast(*void)(*instance)) == 8, "draw_state_t.path_start_y has unexpected offset % instead of 8", ((cast(*void)(*instance.path_start_y)) - cast(*void)(*instance)));
        assert(size_of(type_of(draw_state_t.path_start_y)) == 4, "draw_state_t.path_start_y has unexpected size % instead of 4", size_of(type_of(draw_state_t.path_start_y)));
        assert(((cast(*void)(*instance.current_x)) - cast(*void)(*instance)) == 12, "draw_state_t.current_x has unexpected offset % instead of 12", ((cast(*void)(*instance.current_x)) - cast(*void)(*instance)));
        assert(size_of(type_of(draw_state_t.current_x)) == 4, "draw_state_t.current_x has unexpected size % instead of 4", size_of(type_of(draw_state_t.current_x)));
        assert(((cast(*void)(*instance.current_y)) - cast(*void)(*instance)) == 16, "draw_state_t.current_y has unexpected offset % instead of 16", ((cast(*void)(*instance.current_y)) - cast(*void)(*instance)));
        assert(size_of(type_of(draw_state_t.current_y)) == 4, "draw_state_t.current_y has unexpected size % instead of 4", size_of(type_of(draw_state_t.current_y)));
        assert(((cast(*void)(*instance.reserved1)) - cast(*void)(*instance)) == 20, "draw_state_t.reserved1 has unexpected offset % instead of 20", ((cast(*void)(*instance.reserved1)) - cast(*void)(*instance)));
        assert(size_of(type_of(draw_state_t.reserved1)) == 4, "draw_state_t.reserved1 has unexpected size % instead of 4", size_of(type_of(draw_state_t.reserved1)));
        assert(((cast(*void)(*instance.reserved2)) - cast(*void)(*instance)) == 24, "draw_state_t.reserved2 has unexpected offset % instead of 24", ((cast(*void)(*instance.reserved2)) - cast(*void)(*instance)));
        assert(size_of(type_of(draw_state_t.reserved2)) == 4, "draw_state_t.reserved2 has unexpected size % instead of 4", size_of(type_of(draw_state_t.reserved2)));
        assert(((cast(*void)(*instance.reserved3)) - cast(*void)(*instance)) == 28, "draw_state_t.reserved3 has unexpected offset % instead of 28", ((cast(*void)(*instance.reserved3)) - cast(*void)(*instance)));
        assert(size_of(type_of(draw_state_t.reserved3)) == 4, "draw_state_t.reserved3 has unexpected size % instead of 4", size_of(type_of(draw_state_t.reserved3)));
        assert(((cast(*void)(*instance.reserved4)) - cast(*void)(*instance)) == 32, "draw_state_t.reserved4 has unexpected offset % instead of 32", ((cast(*void)(*instance.reserved4)) - cast(*void)(*instance)));
        assert(size_of(type_of(draw_state_t.reserved4)) == 4, "draw_state_t.reserved4 has unexpected size % instead of 4", size_of(type_of(draw_state_t.reserved4)));
        assert(((cast(*void)(*instance.reserved5)) - cast(*void)(*instance)) == 36, "draw_state_t.reserved5 has unexpected offset % instead of 36", ((cast(*void)(*instance.reserved5)) - cast(*void)(*instance)));
        assert(size_of(type_of(draw_state_t.reserved5)) == 4, "draw_state_t.reserved5 has unexpected size % instead of 4", size_of(type_of(draw_state_t.reserved5)));
        assert(((cast(*void)(*instance.reserved6)) - cast(*void)(*instance)) == 40, "draw_state_t.reserved6 has unexpected offset % instead of 40", ((cast(*void)(*instance.reserved6)) - cast(*void)(*instance)));
        assert(size_of(type_of(draw_state_t.reserved6)) == 4, "draw_state_t.reserved6 has unexpected size % instead of 4", size_of(type_of(draw_state_t.reserved6)));
        assert(((cast(*void)(*instance.reserved7)) - cast(*void)(*instance)) == 44, "draw_state_t.reserved7 has unexpected offset % instead of 44", ((cast(*void)(*instance.reserved7)) - cast(*void)(*instance)));
        assert(size_of(type_of(draw_state_t.reserved7)) == 4, "draw_state_t.reserved7 has unexpected size % instead of 4", size_of(type_of(draw_state_t.reserved7)));
        assert(size_of(draw_state_t) == 48, "draw_state_t has size % instead of 48", size_of(draw_state_t));
    }

    {
        instance: color_stop_t;
        assert(((cast(*void)(*instance.offset)) - cast(*void)(*instance)) == 0, "color_stop_t.offset has unexpected offset % instead of 0", ((cast(*void)(*instance.offset)) - cast(*void)(*instance)));
        assert(size_of(type_of(color_stop_t.offset)) == 4, "color_stop_t.offset has unexpected size % instead of 4", size_of(type_of(color_stop_t.offset)));
        assert(((cast(*void)(*instance.is_foreground)) - cast(*void)(*instance)) == 4, "color_stop_t.is_foreground has unexpected offset % instead of 4", ((cast(*void)(*instance.is_foreground)) - cast(*void)(*instance)));
        assert(size_of(type_of(color_stop_t.is_foreground)) == 4, "color_stop_t.is_foreground has unexpected size % instead of 4", size_of(type_of(color_stop_t.is_foreground)));
        assert(((cast(*void)(*instance.color)) - cast(*void)(*instance)) == 8, "color_stop_t.color has unexpected offset % instead of 8", ((cast(*void)(*instance.color)) - cast(*void)(*instance)));
        assert(size_of(type_of(color_stop_t.color)) == 4, "color_stop_t.color has unexpected size % instead of 4", size_of(type_of(color_stop_t.color)));
        assert(size_of(color_stop_t) == 12, "color_stop_t has size % instead of 12", size_of(color_stop_t));
    }

    {
        instance: color_line_t;
        assert(((cast(*void)(*instance.data)) - cast(*void)(*instance)) == 0, "color_line_t.data has unexpected offset % instead of 0", ((cast(*void)(*instance.data)) - cast(*void)(*instance)));
        assert(size_of(type_of(color_line_t.data)) == 8, "color_line_t.data has unexpected size % instead of 8", size_of(type_of(color_line_t.data)));
        assert(((cast(*void)(*instance.get_color_stops)) - cast(*void)(*instance)) == 8, "color_line_t.get_color_stops has unexpected offset % instead of 8", ((cast(*void)(*instance.get_color_stops)) - cast(*void)(*instance)));
        assert(size_of(type_of(color_line_t.get_color_stops)) == 8, "color_line_t.get_color_stops has unexpected size % instead of 8", size_of(type_of(color_line_t.get_color_stops)));
        assert(((cast(*void)(*instance.get_color_stops_user_data)) - cast(*void)(*instance)) == 16, "color_line_t.get_color_stops_user_data has unexpected offset % instead of 16", ((cast(*void)(*instance.get_color_stops_user_data)) - cast(*void)(*instance)));
        assert(size_of(type_of(color_line_t.get_color_stops_user_data)) == 8, "color_line_t.get_color_stops_user_data has unexpected size % instead of 8", size_of(type_of(color_line_t.get_color_stops_user_data)));
        assert(((cast(*void)(*instance.get_extend)) - cast(*void)(*instance)) == 24, "color_line_t.get_extend has unexpected offset % instead of 24", ((cast(*void)(*instance.get_extend)) - cast(*void)(*instance)));
        assert(size_of(type_of(color_line_t.get_extend)) == 8, "color_line_t.get_extend has unexpected size % instead of 8", size_of(type_of(color_line_t.get_extend)));
        assert(((cast(*void)(*instance.get_extend_user_data)) - cast(*void)(*instance)) == 32, "color_line_t.get_extend_user_data has unexpected offset % instead of 32", ((cast(*void)(*instance.get_extend_user_data)) - cast(*void)(*instance)));
        assert(size_of(type_of(color_line_t.get_extend_user_data)) == 8, "color_line_t.get_extend_user_data has unexpected size % instead of 8", size_of(type_of(color_line_t.get_extend_user_data)));
        assert(((cast(*void)(*instance.reserved0)) - cast(*void)(*instance)) == 40, "color_line_t.reserved0 has unexpected offset % instead of 40", ((cast(*void)(*instance.reserved0)) - cast(*void)(*instance)));
        assert(size_of(type_of(color_line_t.reserved0)) == 8, "color_line_t.reserved0 has unexpected size % instead of 8", size_of(type_of(color_line_t.reserved0)));
        assert(((cast(*void)(*instance.reserved1)) - cast(*void)(*instance)) == 48, "color_line_t.reserved1 has unexpected offset % instead of 48", ((cast(*void)(*instance.reserved1)) - cast(*void)(*instance)));
        assert(size_of(type_of(color_line_t.reserved1)) == 8, "color_line_t.reserved1 has unexpected size % instead of 8", size_of(type_of(color_line_t.reserved1)));
        assert(((cast(*void)(*instance.reserved2)) - cast(*void)(*instance)) == 56, "color_line_t.reserved2 has unexpected offset % instead of 56", ((cast(*void)(*instance.reserved2)) - cast(*void)(*instance)));
        assert(size_of(type_of(color_line_t.reserved2)) == 8, "color_line_t.reserved2 has unexpected size % instead of 8", size_of(type_of(color_line_t.reserved2)));
        assert(((cast(*void)(*instance.reserved3)) - cast(*void)(*instance)) == 64, "color_line_t.reserved3 has unexpected offset % instead of 64", ((cast(*void)(*instance.reserved3)) - cast(*void)(*instance)));
        assert(size_of(type_of(color_line_t.reserved3)) == 8, "color_line_t.reserved3 has unexpected size % instead of 8", size_of(type_of(color_line_t.reserved3)));
        assert(((cast(*void)(*instance.reserved5)) - cast(*void)(*instance)) == 72, "color_line_t.reserved5 has unexpected offset % instead of 72", ((cast(*void)(*instance.reserved5)) - cast(*void)(*instance)));
        assert(size_of(type_of(color_line_t.reserved5)) == 8, "color_line_t.reserved5 has unexpected size % instead of 8", size_of(type_of(color_line_t.reserved5)));
        assert(((cast(*void)(*instance.reserved6)) - cast(*void)(*instance)) == 80, "color_line_t.reserved6 has unexpected offset % instead of 80", ((cast(*void)(*instance.reserved6)) - cast(*void)(*instance)));
        assert(size_of(type_of(color_line_t.reserved6)) == 8, "color_line_t.reserved6 has unexpected size % instead of 8", size_of(type_of(color_line_t.reserved6)));
        assert(((cast(*void)(*instance.reserved7)) - cast(*void)(*instance)) == 88, "color_line_t.reserved7 has unexpected offset % instead of 88", ((cast(*void)(*instance.reserved7)) - cast(*void)(*instance)));
        assert(size_of(type_of(color_line_t.reserved7)) == 8, "color_line_t.reserved7 has unexpected size % instead of 8", size_of(type_of(color_line_t.reserved7)));
        assert(((cast(*void)(*instance.reserved8)) - cast(*void)(*instance)) == 96, "color_line_t.reserved8 has unexpected offset % instead of 96", ((cast(*void)(*instance.reserved8)) - cast(*void)(*instance)));
        assert(size_of(type_of(color_line_t.reserved8)) == 8, "color_line_t.reserved8 has unexpected size % instead of 8", size_of(type_of(color_line_t.reserved8)));
        assert(size_of(color_line_t) == 104, "color_line_t has size % instead of 104", size_of(color_line_t));
    }

    {
        instance: font_extents_t;
        assert(((cast(*void)(*instance.ascender)) - cast(*void)(*instance)) == 0, "font_extents_t.ascender has unexpected offset % instead of 0", ((cast(*void)(*instance.ascender)) - cast(*void)(*instance)));
        assert(size_of(type_of(font_extents_t.ascender)) == 4, "font_extents_t.ascender has unexpected size % instead of 4", size_of(type_of(font_extents_t.ascender)));
        assert(((cast(*void)(*instance.descender)) - cast(*void)(*instance)) == 4, "font_extents_t.descender has unexpected offset % instead of 4", ((cast(*void)(*instance.descender)) - cast(*void)(*instance)));
        assert(size_of(type_of(font_extents_t.descender)) == 4, "font_extents_t.descender has unexpected size % instead of 4", size_of(type_of(font_extents_t.descender)));
        assert(((cast(*void)(*instance.line_gap)) - cast(*void)(*instance)) == 8, "font_extents_t.line_gap has unexpected offset % instead of 8", ((cast(*void)(*instance.line_gap)) - cast(*void)(*instance)));
        assert(size_of(type_of(font_extents_t.line_gap)) == 4, "font_extents_t.line_gap has unexpected size % instead of 4", size_of(type_of(font_extents_t.line_gap)));
        assert(((cast(*void)(*instance.reserved9)) - cast(*void)(*instance)) == 12, "font_extents_t.reserved9 has unexpected offset % instead of 12", ((cast(*void)(*instance.reserved9)) - cast(*void)(*instance)));
        assert(size_of(type_of(font_extents_t.reserved9)) == 4, "font_extents_t.reserved9 has unexpected size % instead of 4", size_of(type_of(font_extents_t.reserved9)));
        assert(((cast(*void)(*instance.reserved8)) - cast(*void)(*instance)) == 16, "font_extents_t.reserved8 has unexpected offset % instead of 16", ((cast(*void)(*instance.reserved8)) - cast(*void)(*instance)));
        assert(size_of(type_of(font_extents_t.reserved8)) == 4, "font_extents_t.reserved8 has unexpected size % instead of 4", size_of(type_of(font_extents_t.reserved8)));
        assert(((cast(*void)(*instance.reserved7)) - cast(*void)(*instance)) == 20, "font_extents_t.reserved7 has unexpected offset % instead of 20", ((cast(*void)(*instance.reserved7)) - cast(*void)(*instance)));
        assert(size_of(type_of(font_extents_t.reserved7)) == 4, "font_extents_t.reserved7 has unexpected size % instead of 4", size_of(type_of(font_extents_t.reserved7)));
        assert(((cast(*void)(*instance.reserved6)) - cast(*void)(*instance)) == 24, "font_extents_t.reserved6 has unexpected offset % instead of 24", ((cast(*void)(*instance.reserved6)) - cast(*void)(*instance)));
        assert(size_of(type_of(font_extents_t.reserved6)) == 4, "font_extents_t.reserved6 has unexpected size % instead of 4", size_of(type_of(font_extents_t.reserved6)));
        assert(((cast(*void)(*instance.reserved5)) - cast(*void)(*instance)) == 28, "font_extents_t.reserved5 has unexpected offset % instead of 28", ((cast(*void)(*instance.reserved5)) - cast(*void)(*instance)));
        assert(size_of(type_of(font_extents_t.reserved5)) == 4, "font_extents_t.reserved5 has unexpected size % instead of 4", size_of(type_of(font_extents_t.reserved5)));
        assert(((cast(*void)(*instance.reserved4)) - cast(*void)(*instance)) == 32, "font_extents_t.reserved4 has unexpected offset % instead of 32", ((cast(*void)(*instance.reserved4)) - cast(*void)(*instance)));
        assert(size_of(type_of(font_extents_t.reserved4)) == 4, "font_extents_t.reserved4 has unexpected size % instead of 4", size_of(type_of(font_extents_t.reserved4)));
        assert(((cast(*void)(*instance.reserved3)) - cast(*void)(*instance)) == 36, "font_extents_t.reserved3 has unexpected offset % instead of 36", ((cast(*void)(*instance.reserved3)) - cast(*void)(*instance)));
        assert(size_of(type_of(font_extents_t.reserved3)) == 4, "font_extents_t.reserved3 has unexpected size % instead of 4", size_of(type_of(font_extents_t.reserved3)));
        assert(((cast(*void)(*instance.reserved2)) - cast(*void)(*instance)) == 40, "font_extents_t.reserved2 has unexpected offset % instead of 40", ((cast(*void)(*instance.reserved2)) - cast(*void)(*instance)));
        assert(size_of(type_of(font_extents_t.reserved2)) == 4, "font_extents_t.reserved2 has unexpected size % instead of 4", size_of(type_of(font_extents_t.reserved2)));
        assert(((cast(*void)(*instance.reserved1)) - cast(*void)(*instance)) == 44, "font_extents_t.reserved1 has unexpected offset % instead of 44", ((cast(*void)(*instance.reserved1)) - cast(*void)(*instance)));
        assert(size_of(type_of(font_extents_t.reserved1)) == 4, "font_extents_t.reserved1 has unexpected size % instead of 4", size_of(type_of(font_extents_t.reserved1)));
        assert(size_of(font_extents_t) == 48, "font_extents_t has size % instead of 48", size_of(font_extents_t));
    }

    {
        instance: glyph_info_t;
        assert(((cast(*void)(*instance.codepoint)) - cast(*void)(*instance)) == 0, "glyph_info_t.codepoint has unexpected offset % instead of 0", ((cast(*void)(*instance.codepoint)) - cast(*void)(*instance)));
        assert(size_of(type_of(glyph_info_t.codepoint)) == 4, "glyph_info_t.codepoint has unexpected size % instead of 4", size_of(type_of(glyph_info_t.codepoint)));
        assert(((cast(*void)(*instance.mask)) - cast(*void)(*instance)) == 4, "glyph_info_t.mask has unexpected offset % instead of 4", ((cast(*void)(*instance.mask)) - cast(*void)(*instance)));
        assert(size_of(type_of(glyph_info_t.mask)) == 4, "glyph_info_t.mask has unexpected size % instead of 4", size_of(type_of(glyph_info_t.mask)));
        assert(((cast(*void)(*instance.cluster)) - cast(*void)(*instance)) == 8, "glyph_info_t.cluster has unexpected offset % instead of 8", ((cast(*void)(*instance.cluster)) - cast(*void)(*instance)));
        assert(size_of(type_of(glyph_info_t.cluster)) == 4, "glyph_info_t.cluster has unexpected size % instead of 4", size_of(type_of(glyph_info_t.cluster)));
        assert(((cast(*void)(*instance.var1)) - cast(*void)(*instance)) == 12, "glyph_info_t.var1 has unexpected offset % instead of 12", ((cast(*void)(*instance.var1)) - cast(*void)(*instance)));
        assert(size_of(type_of(glyph_info_t.var1)) == 4, "glyph_info_t.var1 has unexpected size % instead of 4", size_of(type_of(glyph_info_t.var1)));
        assert(((cast(*void)(*instance.var2)) - cast(*void)(*instance)) == 16, "glyph_info_t.var2 has unexpected offset % instead of 16", ((cast(*void)(*instance.var2)) - cast(*void)(*instance)));
        assert(size_of(type_of(glyph_info_t.var2)) == 4, "glyph_info_t.var2 has unexpected size % instead of 4", size_of(type_of(glyph_info_t.var2)));
        assert(size_of(glyph_info_t) == 20, "glyph_info_t has size % instead of 20", size_of(glyph_info_t));
    }

    {
        instance: glyph_position_t;
        assert(((cast(*void)(*instance.x_advance)) - cast(*void)(*instance)) == 0, "glyph_position_t.x_advance has unexpected offset % instead of 0", ((cast(*void)(*instance.x_advance)) - cast(*void)(*instance)));
        assert(size_of(type_of(glyph_position_t.x_advance)) == 4, "glyph_position_t.x_advance has unexpected size % instead of 4", size_of(type_of(glyph_position_t.x_advance)));
        assert(((cast(*void)(*instance.y_advance)) - cast(*void)(*instance)) == 4, "glyph_position_t.y_advance has unexpected offset % instead of 4", ((cast(*void)(*instance.y_advance)) - cast(*void)(*instance)));
        assert(size_of(type_of(glyph_position_t.y_advance)) == 4, "glyph_position_t.y_advance has unexpected size % instead of 4", size_of(type_of(glyph_position_t.y_advance)));
        assert(((cast(*void)(*instance.x_offset)) - cast(*void)(*instance)) == 8, "glyph_position_t.x_offset has unexpected offset % instead of 8", ((cast(*void)(*instance.x_offset)) - cast(*void)(*instance)));
        assert(size_of(type_of(glyph_position_t.x_offset)) == 4, "glyph_position_t.x_offset has unexpected size % instead of 4", size_of(type_of(glyph_position_t.x_offset)));
        assert(((cast(*void)(*instance.y_offset)) - cast(*void)(*instance)) == 12, "glyph_position_t.y_offset has unexpected offset % instead of 12", ((cast(*void)(*instance.y_offset)) - cast(*void)(*instance)));
        assert(size_of(type_of(glyph_position_t.y_offset)) == 4, "glyph_position_t.y_offset has unexpected size % instead of 4", size_of(type_of(glyph_position_t.y_offset)));
        assert(((cast(*void)(*instance.var)) - cast(*void)(*instance)) == 16, "glyph_position_t.var has unexpected offset % instead of 16", ((cast(*void)(*instance.var)) - cast(*void)(*instance)));
        assert(size_of(type_of(glyph_position_t.var)) == 4, "glyph_position_t.var has unexpected size % instead of 4", size_of(type_of(glyph_position_t.var)));
        assert(size_of(glyph_position_t) == 20, "glyph_position_t has size % instead of 20", size_of(glyph_position_t));
    }

    {
        instance: segment_properties_t;
        assert(((cast(*void)(*instance.direction)) - cast(*void)(*instance)) == 0, "segment_properties_t.direction has unexpected offset % instead of 0", ((cast(*void)(*instance.direction)) - cast(*void)(*instance)));
        assert(size_of(type_of(segment_properties_t.direction)) == 4, "segment_properties_t.direction has unexpected size % instead of 4", size_of(type_of(segment_properties_t.direction)));
        assert(((cast(*void)(*instance.script)) - cast(*void)(*instance)) == 4, "segment_properties_t.script has unexpected offset % instead of 4", ((cast(*void)(*instance.script)) - cast(*void)(*instance)));
        assert(size_of(type_of(segment_properties_t.script)) == 4, "segment_properties_t.script has unexpected size % instead of 4", size_of(type_of(segment_properties_t.script)));
        assert(((cast(*void)(*instance.language)) - cast(*void)(*instance)) == 8, "segment_properties_t.language has unexpected offset % instead of 8", ((cast(*void)(*instance.language)) - cast(*void)(*instance)));
        assert(size_of(type_of(segment_properties_t.language)) == 8, "segment_properties_t.language has unexpected size % instead of 8", size_of(type_of(segment_properties_t.language)));
        assert(((cast(*void)(*instance.reserved1)) - cast(*void)(*instance)) == 16, "segment_properties_t.reserved1 has unexpected offset % instead of 16", ((cast(*void)(*instance.reserved1)) - cast(*void)(*instance)));
        assert(size_of(type_of(segment_properties_t.reserved1)) == 8, "segment_properties_t.reserved1 has unexpected size % instead of 8", size_of(type_of(segment_properties_t.reserved1)));
        assert(((cast(*void)(*instance.reserved2)) - cast(*void)(*instance)) == 24, "segment_properties_t.reserved2 has unexpected offset % instead of 24", ((cast(*void)(*instance.reserved2)) - cast(*void)(*instance)));
        assert(size_of(type_of(segment_properties_t.reserved2)) == 8, "segment_properties_t.reserved2 has unexpected size % instead of 8", size_of(type_of(segment_properties_t.reserved2)));
        assert(size_of(segment_properties_t) == 32, "segment_properties_t has size % instead of 32", size_of(segment_properties_t));
    }
}

