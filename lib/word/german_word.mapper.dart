// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'german_word.dart';

class GermanPrepositionMapper extends ClassMapperBase<GermanPreposition> {
  GermanPrepositionMapper._();

  static GermanPrepositionMapper? _instance;
  static GermanPrepositionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GermanPrepositionMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'GermanPreposition';

  static String _$prepositionCase(GermanPreposition v) => v.prepositionCase;
  static const Field<GermanPreposition, String> _f$prepositionCase = Field(
    'prepositionCase',
    _$prepositionCase,
    opt: true,
    def: "ACCUSATIVE, DATIVE, GENITIVE, TWO-WAY",
  );
  static List<String> _$commonContractions(GermanPreposition v) =>
      v.commonContractions;
  static const Field<GermanPreposition, List<String>>
  _f$commonContractions = Field(
    'commonContractions',
    _$commonContractions,
    opt: true,
    def: const [
      "List of common contractions with articles. Examples: ins, im, zum, am, beim, vom, ans, aufs. Use empty list if not applicable.",
    ],
  );

  @override
  final MappableFields<GermanPreposition> fields = const {
    #prepositionCase: _f$prepositionCase,
    #commonContractions: _f$commonContractions,
  };

  static GermanPreposition _instantiate(DecodingData data) {
    return GermanPreposition(
      prepositionCase: data.dec(_f$prepositionCase),
      commonContractions: data.dec(_f$commonContractions),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static GermanPreposition fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GermanPreposition>(map);
  }

  static GermanPreposition fromJson(String json) {
    return ensureInitialized().decodeJson<GermanPreposition>(json);
  }
}

mixin GermanPrepositionMappable {
  String toJson() {
    return GermanPrepositionMapper.ensureInitialized()
        .encodeJson<GermanPreposition>(this as GermanPreposition);
  }

  Map<String, dynamic> toMap() {
    return GermanPrepositionMapper.ensureInitialized()
        .encodeMap<GermanPreposition>(this as GermanPreposition);
  }

  GermanPrepositionCopyWith<
    GermanPreposition,
    GermanPreposition,
    GermanPreposition
  >
  get copyWith =>
      _GermanPrepositionCopyWithImpl<GermanPreposition, GermanPreposition>(
        this as GermanPreposition,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return GermanPrepositionMapper.ensureInitialized().stringifyValue(
      this as GermanPreposition,
    );
  }

  @override
  bool operator ==(Object other) {
    return GermanPrepositionMapper.ensureInitialized().equalsValue(
      this as GermanPreposition,
      other,
    );
  }

  @override
  int get hashCode {
    return GermanPrepositionMapper.ensureInitialized().hashValue(
      this as GermanPreposition,
    );
  }
}

extension GermanPrepositionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GermanPreposition, $Out> {
  GermanPrepositionCopyWith<$R, GermanPreposition, $Out>
  get $asGermanPreposition => $base.as(
    (v, t, t2) => _GermanPrepositionCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class GermanPrepositionCopyWith<
  $R,
  $In extends GermanPreposition,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
  get commonContractions;
  $R call({String? prepositionCase, List<String>? commonContractions});
  GermanPrepositionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _GermanPrepositionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GermanPreposition, $Out>
    implements GermanPrepositionCopyWith<$R, GermanPreposition, $Out> {
  _GermanPrepositionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GermanPreposition> $mapper =
      GermanPrepositionMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>
  get commonContractions => ListCopyWith(
    $value.commonContractions,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(commonContractions: v),
  );
  @override
  $R call({String? prepositionCase, List<String>? commonContractions}) =>
      $apply(
        FieldCopyWithData({
          if (prepositionCase != null) #prepositionCase: prepositionCase,
          if (commonContractions != null)
            #commonContractions: commonContractions,
        }),
      );
  @override
  GermanPreposition $make(CopyWithData data) => GermanPreposition(
    prepositionCase: data.get(#prepositionCase, or: $value.prepositionCase),
    commonContractions: data.get(
      #commonContractions,
      or: $value.commonContractions,
    ),
  );

  @override
  GermanPrepositionCopyWith<$R2, GermanPreposition, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _GermanPrepositionCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class GermanVerbMapper extends ClassMapperBase<GermanVerb> {
  GermanVerbMapper._();

  static GermanVerbMapper? _instance;
  static GermanVerbMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GermanVerbMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'GermanVerb';

  static String _$simplePast(GermanVerb v) => v.simplePast;
  static const Field<GermanVerb, String> _f$simplePast = Field(
    'simplePast',
    _$simplePast,
    opt: true,
    def:
        "The simple past form (Präteritum). Example: ging, hatte, war. Use the infinitive form if not applicable.",
  );
  static String _$pastParticiple(GermanVerb v) => v.pastParticiple;
  static const Field<GermanVerb, String> _f$pastParticiple = Field(
    'pastParticiple',
    _$pastParticiple,
    opt: true,
    def:
        "The past participle form (Partizip II). Must include ge- prefix if applicable. Example: gegangen, gehabt, gewesen. Use the infinitive form if not applicable.",
  );
  static String _$thirdPersonPresent(GermanVerb v) => v.thirdPersonPresent;
  static const Field<GermanVerb, String> _f$thirdPersonPresent = Field(
    'thirdPersonPresent',
    _$thirdPersonPresent,
    opt: true,
    def:
        "The third person singular present form. Example: geht, hat, ist, gibt, fährt. Use the infinitive form if there's no vowel change.",
  );
  static bool _$isSeparable(GermanVerb v) => v.isSeparable;
  static const Field<GermanVerb, bool> _f$isSeparable = Field(
    'isSeparable',
    _$isSeparable,
    opt: true,
    def: false,
  );
  static bool _$isReflexive(GermanVerb v) => v.isReflexive;
  static const Field<GermanVerb, bool> _f$isReflexive = Field(
    'isReflexive',
    _$isReflexive,
    opt: true,
    def: false,
  );
  static String _$fixedPreposition(GermanVerb v) => v.fixedPreposition;
  static const Field<GermanVerb, String> _f$fixedPreposition = Field(
    'fixedPreposition',
    _$fixedPreposition,
    opt: true,
    def:
        "The exact preposition that must be used with this verb. Example: an, auf, über, mit, für, von. Use empty string if no fixed preposition.",
  );
  static String _$prepositionCase(GermanVerb v) => v.prepositionCase;
  static const Field<GermanVerb, String> _f$prepositionCase = Field(
    'prepositionCase',
    _$prepositionCase,
    opt: true,
    def: "ACCUSATIVE, DATIVE. Use empty string if not applicable.",
  );
  static String _$governedCase(GermanVerb v) => v.governedCase;
  static const Field<GermanVerb, String> _f$governedCase = Field(
    'governedCase',
    _$governedCase,
    opt: true,
    def: "ACCUSATIVE, DATIVE, GENITIVE. Use empty string if not applicable.",
  );

  @override
  final MappableFields<GermanVerb> fields = const {
    #simplePast: _f$simplePast,
    #pastParticiple: _f$pastParticiple,
    #thirdPersonPresent: _f$thirdPersonPresent,
    #isSeparable: _f$isSeparable,
    #isReflexive: _f$isReflexive,
    #fixedPreposition: _f$fixedPreposition,
    #prepositionCase: _f$prepositionCase,
    #governedCase: _f$governedCase,
  };

  static GermanVerb _instantiate(DecodingData data) {
    return GermanVerb(
      simplePast: data.dec(_f$simplePast),
      pastParticiple: data.dec(_f$pastParticiple),
      thirdPersonPresent: data.dec(_f$thirdPersonPresent),
      isSeparable: data.dec(_f$isSeparable),
      isReflexive: data.dec(_f$isReflexive),
      fixedPreposition: data.dec(_f$fixedPreposition),
      prepositionCase: data.dec(_f$prepositionCase),
      governedCase: data.dec(_f$governedCase),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static GermanVerb fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GermanVerb>(map);
  }

  static GermanVerb fromJson(String json) {
    return ensureInitialized().decodeJson<GermanVerb>(json);
  }
}

mixin GermanVerbMappable {
  String toJson() {
    return GermanVerbMapper.ensureInitialized().encodeJson<GermanVerb>(
      this as GermanVerb,
    );
  }

  Map<String, dynamic> toMap() {
    return GermanVerbMapper.ensureInitialized().encodeMap<GermanVerb>(
      this as GermanVerb,
    );
  }

  GermanVerbCopyWith<GermanVerb, GermanVerb, GermanVerb> get copyWith =>
      _GermanVerbCopyWithImpl<GermanVerb, GermanVerb>(
        this as GermanVerb,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return GermanVerbMapper.ensureInitialized().stringifyValue(
      this as GermanVerb,
    );
  }

  @override
  bool operator ==(Object other) {
    return GermanVerbMapper.ensureInitialized().equalsValue(
      this as GermanVerb,
      other,
    );
  }

  @override
  int get hashCode {
    return GermanVerbMapper.ensureInitialized().hashValue(this as GermanVerb);
  }
}

extension GermanVerbValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GermanVerb, $Out> {
  GermanVerbCopyWith<$R, GermanVerb, $Out> get $asGermanVerb =>
      $base.as((v, t, t2) => _GermanVerbCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class GermanVerbCopyWith<$R, $In extends GermanVerb, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? simplePast,
    String? pastParticiple,
    String? thirdPersonPresent,
    bool? isSeparable,
    bool? isReflexive,
    String? fixedPreposition,
    String? prepositionCase,
    String? governedCase,
  });
  GermanVerbCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _GermanVerbCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GermanVerb, $Out>
    implements GermanVerbCopyWith<$R, GermanVerb, $Out> {
  _GermanVerbCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GermanVerb> $mapper =
      GermanVerbMapper.ensureInitialized();
  @override
  $R call({
    String? simplePast,
    String? pastParticiple,
    String? thirdPersonPresent,
    bool? isSeparable,
    bool? isReflexive,
    String? fixedPreposition,
    String? prepositionCase,
    String? governedCase,
  }) => $apply(
    FieldCopyWithData({
      if (simplePast != null) #simplePast: simplePast,
      if (pastParticiple != null) #pastParticiple: pastParticiple,
      if (thirdPersonPresent != null) #thirdPersonPresent: thirdPersonPresent,
      if (isSeparable != null) #isSeparable: isSeparable,
      if (isReflexive != null) #isReflexive: isReflexive,
      if (fixedPreposition != null) #fixedPreposition: fixedPreposition,
      if (prepositionCase != null) #prepositionCase: prepositionCase,
      if (governedCase != null) #governedCase: governedCase,
    }),
  );
  @override
  GermanVerb $make(CopyWithData data) => GermanVerb(
    simplePast: data.get(#simplePast, or: $value.simplePast),
    pastParticiple: data.get(#pastParticiple, or: $value.pastParticiple),
    thirdPersonPresent: data.get(
      #thirdPersonPresent,
      or: $value.thirdPersonPresent,
    ),
    isSeparable: data.get(#isSeparable, or: $value.isSeparable),
    isReflexive: data.get(#isReflexive, or: $value.isReflexive),
    fixedPreposition: data.get(#fixedPreposition, or: $value.fixedPreposition),
    prepositionCase: data.get(#prepositionCase, or: $value.prepositionCase),
    governedCase: data.get(#governedCase, or: $value.governedCase),
  );

  @override
  GermanVerbCopyWith<$R2, GermanVerb, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _GermanVerbCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class GermanNounMapper extends ClassMapperBase<GermanNoun> {
  GermanNounMapper._();

  static GermanNounMapper? _instance;
  static GermanNounMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GermanNounMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'GermanNoun';

  static String _$gender(GermanNoun v) => v.gender;
  static const Field<GermanNoun, String> _f$gender = Field(
    'gender',
    _$gender,
    opt: true,
    def: "Choose only one: der, die, das",
  );
  static String _$pluralForm(GermanNoun v) => v.pluralForm;
  static const Field<GermanNoun, String> _f$pluralForm = Field(
    'pluralForm',
    _$pluralForm,
    opt: true,
    def:
        "The exact plural form of the noun. Example: Kinder, Häuser, Frauen. If the noun has no plural form, use the same word as singular.",
  );

  @override
  final MappableFields<GermanNoun> fields = const {
    #gender: _f$gender,
    #pluralForm: _f$pluralForm,
  };

  static GermanNoun _instantiate(DecodingData data) {
    return GermanNoun(
      gender: data.dec(_f$gender),
      pluralForm: data.dec(_f$pluralForm),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static GermanNoun fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GermanNoun>(map);
  }

  static GermanNoun fromJson(String json) {
    return ensureInitialized().decodeJson<GermanNoun>(json);
  }
}

mixin GermanNounMappable {
  String toJson() {
    return GermanNounMapper.ensureInitialized().encodeJson<GermanNoun>(
      this as GermanNoun,
    );
  }

  Map<String, dynamic> toMap() {
    return GermanNounMapper.ensureInitialized().encodeMap<GermanNoun>(
      this as GermanNoun,
    );
  }

  GermanNounCopyWith<GermanNoun, GermanNoun, GermanNoun> get copyWith =>
      _GermanNounCopyWithImpl<GermanNoun, GermanNoun>(
        this as GermanNoun,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return GermanNounMapper.ensureInitialized().stringifyValue(
      this as GermanNoun,
    );
  }

  @override
  bool operator ==(Object other) {
    return GermanNounMapper.ensureInitialized().equalsValue(
      this as GermanNoun,
      other,
    );
  }

  @override
  int get hashCode {
    return GermanNounMapper.ensureInitialized().hashValue(this as GermanNoun);
  }
}

extension GermanNounValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GermanNoun, $Out> {
  GermanNounCopyWith<$R, GermanNoun, $Out> get $asGermanNoun =>
      $base.as((v, t, t2) => _GermanNounCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class GermanNounCopyWith<$R, $In extends GermanNoun, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? gender, String? pluralForm});
  GermanNounCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _GermanNounCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GermanNoun, $Out>
    implements GermanNounCopyWith<$R, GermanNoun, $Out> {
  _GermanNounCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GermanNoun> $mapper =
      GermanNounMapper.ensureInitialized();
  @override
  $R call({String? gender, String? pluralForm}) => $apply(
    FieldCopyWithData({
      if (gender != null) #gender: gender,
      if (pluralForm != null) #pluralForm: pluralForm,
    }),
  );
  @override
  GermanNoun $make(CopyWithData data) => GermanNoun(
    gender: data.get(#gender, or: $value.gender),
    pluralForm: data.get(#pluralForm, or: $value.pluralForm),
  );

  @override
  GermanNounCopyWith<$R2, GermanNoun, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _GermanNounCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class GermanAdjectiveMapper extends ClassMapperBase<GermanAdjective> {
  GermanAdjectiveMapper._();

  static GermanAdjectiveMapper? _instance;
  static GermanAdjectiveMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GermanAdjectiveMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'GermanAdjective';

  static String _$comparative(GermanAdjective v) => v.comparative;
  static const Field<GermanAdjective, String> _f$comparative = Field(
    'comparative',
    _$comparative,
    opt: true,
    def:
        "The comparative form. Example: besser, schöner, größer. Use base+er for regular forms. Use the base form if not applicable.",
  );
  static String _$superlative(GermanAdjective v) => v.superlative;
  static const Field<GermanAdjective, String> _f$superlative = Field(
    'superlative',
    _$superlative,
    opt: true,
    def:
        "The superlative form WITHOUT 'am'. Example: best, schönst, größt. Use base+st for regular forms. Use the base form if not applicable.",
  );

  @override
  final MappableFields<GermanAdjective> fields = const {
    #comparative: _f$comparative,
    #superlative: _f$superlative,
  };

  static GermanAdjective _instantiate(DecodingData data) {
    return GermanAdjective(
      comparative: data.dec(_f$comparative),
      superlative: data.dec(_f$superlative),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static GermanAdjective fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GermanAdjective>(map);
  }

  static GermanAdjective fromJson(String json) {
    return ensureInitialized().decodeJson<GermanAdjective>(json);
  }
}

mixin GermanAdjectiveMappable {
  String toJson() {
    return GermanAdjectiveMapper.ensureInitialized()
        .encodeJson<GermanAdjective>(this as GermanAdjective);
  }

  Map<String, dynamic> toMap() {
    return GermanAdjectiveMapper.ensureInitialized().encodeMap<GermanAdjective>(
      this as GermanAdjective,
    );
  }

  GermanAdjectiveCopyWith<GermanAdjective, GermanAdjective, GermanAdjective>
  get copyWith =>
      _GermanAdjectiveCopyWithImpl<GermanAdjective, GermanAdjective>(
        this as GermanAdjective,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return GermanAdjectiveMapper.ensureInitialized().stringifyValue(
      this as GermanAdjective,
    );
  }

  @override
  bool operator ==(Object other) {
    return GermanAdjectiveMapper.ensureInitialized().equalsValue(
      this as GermanAdjective,
      other,
    );
  }

  @override
  int get hashCode {
    return GermanAdjectiveMapper.ensureInitialized().hashValue(
      this as GermanAdjective,
    );
  }
}

extension GermanAdjectiveValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GermanAdjective, $Out> {
  GermanAdjectiveCopyWith<$R, GermanAdjective, $Out> get $asGermanAdjective =>
      $base.as((v, t, t2) => _GermanAdjectiveCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class GermanAdjectiveCopyWith<$R, $In extends GermanAdjective, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? comparative, String? superlative});
  GermanAdjectiveCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _GermanAdjectiveCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GermanAdjective, $Out>
    implements GermanAdjectiveCopyWith<$R, GermanAdjective, $Out> {
  _GermanAdjectiveCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GermanAdjective> $mapper =
      GermanAdjectiveMapper.ensureInitialized();
  @override
  $R call({String? comparative, String? superlative}) => $apply(
    FieldCopyWithData({
      if (comparative != null) #comparative: comparative,
      if (superlative != null) #superlative: superlative,
    }),
  );
  @override
  GermanAdjective $make(CopyWithData data) => GermanAdjective(
    comparative: data.get(#comparative, or: $value.comparative),
    superlative: data.get(#superlative, or: $value.superlative),
  );

  @override
  GermanAdjectiveCopyWith<$R2, GermanAdjective, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _GermanAdjectiveCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class GermanAdverbMapper extends ClassMapperBase<GermanAdverb> {
  GermanAdverbMapper._();

  static GermanAdverbMapper? _instance;
  static GermanAdverbMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GermanAdverbMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'GermanAdverb';

  static String _$comparativeForm(GermanAdverb v) => v.comparativeForm;
  static const Field<GermanAdverb, String> _f$comparativeForm = Field(
    'comparativeForm',
    _$comparativeForm,
    opt: true,
    def:
        "The comparative form. Example: lieber, eher, mehr. Use the base form if not applicable.",
  );
  static String _$superlativeForm(GermanAdverb v) => v.superlativeForm;
  static const Field<GermanAdverb, String> _f$superlativeForm = Field(
    'superlativeForm',
    _$superlativeForm,
    opt: true,
    def:
        "The superlative form with 'am'. Example: am liebsten, am ehesten, am meisten. Use the base form if not applicable.",
  );

  @override
  final MappableFields<GermanAdverb> fields = const {
    #comparativeForm: _f$comparativeForm,
    #superlativeForm: _f$superlativeForm,
  };

  static GermanAdverb _instantiate(DecodingData data) {
    return GermanAdverb(
      comparativeForm: data.dec(_f$comparativeForm),
      superlativeForm: data.dec(_f$superlativeForm),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static GermanAdverb fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GermanAdverb>(map);
  }

  static GermanAdverb fromJson(String json) {
    return ensureInitialized().decodeJson<GermanAdverb>(json);
  }
}

mixin GermanAdverbMappable {
  String toJson() {
    return GermanAdverbMapper.ensureInitialized().encodeJson<GermanAdverb>(
      this as GermanAdverb,
    );
  }

  Map<String, dynamic> toMap() {
    return GermanAdverbMapper.ensureInitialized().encodeMap<GermanAdverb>(
      this as GermanAdverb,
    );
  }

  GermanAdverbCopyWith<GermanAdverb, GermanAdverb, GermanAdverb> get copyWith =>
      _GermanAdverbCopyWithImpl<GermanAdverb, GermanAdverb>(
        this as GermanAdverb,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return GermanAdverbMapper.ensureInitialized().stringifyValue(
      this as GermanAdverb,
    );
  }

  @override
  bool operator ==(Object other) {
    return GermanAdverbMapper.ensureInitialized().equalsValue(
      this as GermanAdverb,
      other,
    );
  }

  @override
  int get hashCode {
    return GermanAdverbMapper.ensureInitialized().hashValue(
      this as GermanAdverb,
    );
  }
}

extension GermanAdverbValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GermanAdverb, $Out> {
  GermanAdverbCopyWith<$R, GermanAdverb, $Out> get $asGermanAdverb =>
      $base.as((v, t, t2) => _GermanAdverbCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class GermanAdverbCopyWith<$R, $In extends GermanAdverb, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? comparativeForm, String? superlativeForm});
  GermanAdverbCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _GermanAdverbCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GermanAdverb, $Out>
    implements GermanAdverbCopyWith<$R, GermanAdverb, $Out> {
  _GermanAdverbCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GermanAdverb> $mapper =
      GermanAdverbMapper.ensureInitialized();
  @override
  $R call({String? comparativeForm, String? superlativeForm}) => $apply(
    FieldCopyWithData({
      if (comparativeForm != null) #comparativeForm: comparativeForm,
      if (superlativeForm != null) #superlativeForm: superlativeForm,
    }),
  );
  @override
  GermanAdverb $make(CopyWithData data) => GermanAdverb(
    comparativeForm: data.get(#comparativeForm, or: $value.comparativeForm),
    superlativeForm: data.get(#superlativeForm, or: $value.superlativeForm),
  );

  @override
  GermanAdverbCopyWith<$R2, GermanAdverb, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _GermanAdverbCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class GermanWordDefinitionMapper extends ClassMapperBase<GermanWordDefinition> {
  GermanWordDefinitionMapper._();

  static GermanWordDefinitionMapper? _instance;
  static GermanWordDefinitionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GermanWordDefinitionMapper._());
      WordExampleMapper.ensureInitialized();
      GermanNounMapper.ensureInitialized();
      GermanVerbMapper.ensureInitialized();
      GermanPrepositionMapper.ensureInitialized();
      GermanAdjectiveMapper.ensureInitialized();
      GermanAdverbMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GermanWordDefinition';

  static List<WordExample> _$examples(GermanWordDefinition v) => v.examples;
  static const Field<GermanWordDefinition, List<WordExample>> _f$examples =
      Field(
        'examples',
        _$examples,
        opt: true,
        def: const [WordExample(), WordExample()],
      );
  static String _$meaning(GermanWordDefinition v) => v.meaning;
  static const Field<GermanWordDefinition, String> _f$meaning = Field(
    'meaning',
    _$meaning,
    opt: true,
    def: "Meaning of this word in this specific context",
  );
  static String _$partOfSpeech(GermanWordDefinition v) => v.partOfSpeech;
  static const Field<GermanWordDefinition, String> _f$partOfSpeech = Field(
    'partOfSpeech',
    _$partOfSpeech,
    opt: true,
    def: "Part of speech of the word in this specific context",
  );
  static GermanNoun? _$nounInfo(GermanWordDefinition v) => v.nounInfo;
  static const Field<GermanWordDefinition, GermanNoun> _f$nounInfo = Field(
    'nounInfo',
    _$nounInfo,
    opt: true,
    def: const GermanNoun(),
  );
  static GermanVerb? _$verbInfo(GermanWordDefinition v) => v.verbInfo;
  static const Field<GermanWordDefinition, GermanVerb> _f$verbInfo = Field(
    'verbInfo',
    _$verbInfo,
    opt: true,
    def: const GermanVerb(),
  );
  static GermanPreposition? _$prepositionInfo(GermanWordDefinition v) =>
      v.prepositionInfo;
  static const Field<GermanWordDefinition, GermanPreposition>
  _f$prepositionInfo = Field(
    'prepositionInfo',
    _$prepositionInfo,
    opt: true,
    def: const GermanPreposition(),
  );
  static GermanAdjective? _$adjectiveInfo(GermanWordDefinition v) =>
      v.adjectiveInfo;
  static const Field<GermanWordDefinition, GermanAdjective> _f$adjectiveInfo =
      Field(
        'adjectiveInfo',
        _$adjectiveInfo,
        opt: true,
        def: const GermanAdjective(),
      );
  static GermanAdverb? _$adverbInfo(GermanWordDefinition v) => v.adverbInfo;
  static const Field<GermanWordDefinition, GermanAdverb> _f$adverbInfo = Field(
    'adverbInfo',
    _$adverbInfo,
    opt: true,
    def: const GermanAdverb(),
  );

  @override
  final MappableFields<GermanWordDefinition> fields = const {
    #examples: _f$examples,
    #meaning: _f$meaning,
    #partOfSpeech: _f$partOfSpeech,
    #nounInfo: _f$nounInfo,
    #verbInfo: _f$verbInfo,
    #prepositionInfo: _f$prepositionInfo,
    #adjectiveInfo: _f$adjectiveInfo,
    #adverbInfo: _f$adverbInfo,
  };

  static GermanWordDefinition _instantiate(DecodingData data) {
    return GermanWordDefinition(
      examples: data.dec(_f$examples),
      meaning: data.dec(_f$meaning),
      partOfSpeech: data.dec(_f$partOfSpeech),
      nounInfo: data.dec(_f$nounInfo),
      verbInfo: data.dec(_f$verbInfo),
      prepositionInfo: data.dec(_f$prepositionInfo),
      adjectiveInfo: data.dec(_f$adjectiveInfo),
      adverbInfo: data.dec(_f$adverbInfo),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static GermanWordDefinition fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GermanWordDefinition>(map);
  }

  static GermanWordDefinition fromJson(String json) {
    return ensureInitialized().decodeJson<GermanWordDefinition>(json);
  }
}

mixin GermanWordDefinitionMappable {
  String toJson() {
    return GermanWordDefinitionMapper.ensureInitialized()
        .encodeJson<GermanWordDefinition>(this as GermanWordDefinition);
  }

  Map<String, dynamic> toMap() {
    return GermanWordDefinitionMapper.ensureInitialized()
        .encodeMap<GermanWordDefinition>(this as GermanWordDefinition);
  }

  GermanWordDefinitionCopyWith<
    GermanWordDefinition,
    GermanWordDefinition,
    GermanWordDefinition
  >
  get copyWith =>
      _GermanWordDefinitionCopyWithImpl<
        GermanWordDefinition,
        GermanWordDefinition
      >(this as GermanWordDefinition, $identity, $identity);
  @override
  String toString() {
    return GermanWordDefinitionMapper.ensureInitialized().stringifyValue(
      this as GermanWordDefinition,
    );
  }

  @override
  bool operator ==(Object other) {
    return GermanWordDefinitionMapper.ensureInitialized().equalsValue(
      this as GermanWordDefinition,
      other,
    );
  }

  @override
  int get hashCode {
    return GermanWordDefinitionMapper.ensureInitialized().hashValue(
      this as GermanWordDefinition,
    );
  }
}

extension GermanWordDefinitionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GermanWordDefinition, $Out> {
  GermanWordDefinitionCopyWith<$R, GermanWordDefinition, $Out>
  get $asGermanWordDefinition => $base.as(
    (v, t, t2) => _GermanWordDefinitionCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class GermanWordDefinitionCopyWith<
  $R,
  $In extends GermanWordDefinition,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    WordExample,
    WordExampleCopyWith<$R, WordExample, WordExample>
  >
  get examples;
  GermanNounCopyWith<$R, GermanNoun, GermanNoun>? get nounInfo;
  GermanVerbCopyWith<$R, GermanVerb, GermanVerb>? get verbInfo;
  GermanPrepositionCopyWith<$R, GermanPreposition, GermanPreposition>?
  get prepositionInfo;
  GermanAdjectiveCopyWith<$R, GermanAdjective, GermanAdjective>?
  get adjectiveInfo;
  GermanAdverbCopyWith<$R, GermanAdverb, GermanAdverb>? get adverbInfo;
  $R call({
    List<WordExample>? examples,
    String? meaning,
    String? partOfSpeech,
    GermanNoun? nounInfo,
    GermanVerb? verbInfo,
    GermanPreposition? prepositionInfo,
    GermanAdjective? adjectiveInfo,
    GermanAdverb? adverbInfo,
  });
  GermanWordDefinitionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _GermanWordDefinitionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GermanWordDefinition, $Out>
    implements GermanWordDefinitionCopyWith<$R, GermanWordDefinition, $Out> {
  _GermanWordDefinitionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GermanWordDefinition> $mapper =
      GermanWordDefinitionMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    WordExample,
    WordExampleCopyWith<$R, WordExample, WordExample>
  >
  get examples => ListCopyWith(
    $value.examples,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(examples: v),
  );
  @override
  GermanNounCopyWith<$R, GermanNoun, GermanNoun>? get nounInfo =>
      $value.nounInfo?.copyWith.$chain((v) => call(nounInfo: v));
  @override
  GermanVerbCopyWith<$R, GermanVerb, GermanVerb>? get verbInfo =>
      $value.verbInfo?.copyWith.$chain((v) => call(verbInfo: v));
  @override
  GermanPrepositionCopyWith<$R, GermanPreposition, GermanPreposition>?
  get prepositionInfo =>
      $value.prepositionInfo?.copyWith.$chain((v) => call(prepositionInfo: v));
  @override
  GermanAdjectiveCopyWith<$R, GermanAdjective, GermanAdjective>?
  get adjectiveInfo =>
      $value.adjectiveInfo?.copyWith.$chain((v) => call(adjectiveInfo: v));
  @override
  GermanAdverbCopyWith<$R, GermanAdverb, GermanAdverb>? get adverbInfo =>
      $value.adverbInfo?.copyWith.$chain((v) => call(adverbInfo: v));
  @override
  $R call({
    List<WordExample>? examples,
    String? meaning,
    String? partOfSpeech,
    Object? nounInfo = $none,
    Object? verbInfo = $none,
    Object? prepositionInfo = $none,
    Object? adjectiveInfo = $none,
    Object? adverbInfo = $none,
  }) => $apply(
    FieldCopyWithData({
      if (examples != null) #examples: examples,
      if (meaning != null) #meaning: meaning,
      if (partOfSpeech != null) #partOfSpeech: partOfSpeech,
      if (nounInfo != $none) #nounInfo: nounInfo,
      if (verbInfo != $none) #verbInfo: verbInfo,
      if (prepositionInfo != $none) #prepositionInfo: prepositionInfo,
      if (adjectiveInfo != $none) #adjectiveInfo: adjectiveInfo,
      if (adverbInfo != $none) #adverbInfo: adverbInfo,
    }),
  );
  @override
  GermanWordDefinition $make(CopyWithData data) => GermanWordDefinition(
    examples: data.get(#examples, or: $value.examples),
    meaning: data.get(#meaning, or: $value.meaning),
    partOfSpeech: data.get(#partOfSpeech, or: $value.partOfSpeech),
    nounInfo: data.get(#nounInfo, or: $value.nounInfo),
    verbInfo: data.get(#verbInfo, or: $value.verbInfo),
    prepositionInfo: data.get(#prepositionInfo, or: $value.prepositionInfo),
    adjectiveInfo: data.get(#adjectiveInfo, or: $value.adjectiveInfo),
    adverbInfo: data.get(#adverbInfo, or: $value.adverbInfo),
  );

  @override
  GermanWordDefinitionCopyWith<$R2, GermanWordDefinition, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _GermanWordDefinitionCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class GermanWordMapper extends ClassMapperBase<GermanWord> {
  GermanWordMapper._();

  static GermanWordMapper? _instance;
  static GermanWordMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GermanWordMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'GermanWord';

  static String _$wordLema(GermanWord v) => v.wordLema;
  static const Field<GermanWord, String> _f$wordLema = Field(
    'wordLema',
    _$wordLema,
    opt: true,
    def: "Base form of the word",
  );
  static List<WordDefinition> _$definitions(GermanWord v) => v.definitions;
  static const Field<GermanWord, List<WordDefinition>> _f$definitions = Field(
    'definitions',
    _$definitions,
    opt: true,
    def: const [GermanWordDefinition(), GermanWordDefinition()],
  );

  @override
  final MappableFields<GermanWord> fields = const {
    #wordLema: _f$wordLema,
    #definitions: _f$definitions,
  };

  static GermanWord _instantiate(DecodingData data) {
    return GermanWord(
      wordLema: data.dec(_f$wordLema),
      definitions: data.dec(_f$definitions),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static GermanWord fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GermanWord>(map);
  }

  static GermanWord fromJson(String json) {
    return ensureInitialized().decodeJson<GermanWord>(json);
  }
}

mixin GermanWordMappable {
  String toJson() {
    return GermanWordMapper.ensureInitialized().encodeJson<GermanWord>(
      this as GermanWord,
    );
  }

  Map<String, dynamic> toMap() {
    return GermanWordMapper.ensureInitialized().encodeMap<GermanWord>(
      this as GermanWord,
    );
  }

  GermanWordCopyWith<GermanWord, GermanWord, GermanWord> get copyWith =>
      _GermanWordCopyWithImpl<GermanWord, GermanWord>(
        this as GermanWord,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return GermanWordMapper.ensureInitialized().stringifyValue(
      this as GermanWord,
    );
  }

  @override
  bool operator ==(Object other) {
    return GermanWordMapper.ensureInitialized().equalsValue(
      this as GermanWord,
      other,
    );
  }

  @override
  int get hashCode {
    return GermanWordMapper.ensureInitialized().hashValue(this as GermanWord);
  }
}

extension GermanWordValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GermanWord, $Out> {
  GermanWordCopyWith<$R, GermanWord, $Out> get $asGermanWord =>
      $base.as((v, t, t2) => _GermanWordCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class GermanWordCopyWith<$R, $In extends GermanWord, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    WordDefinition,
    ObjectCopyWith<$R, WordDefinition, WordDefinition>
  >
  get definitions;
  $R call({String? wordLema, List<WordDefinition>? definitions});
  GermanWordCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _GermanWordCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GermanWord, $Out>
    implements GermanWordCopyWith<$R, GermanWord, $Out> {
  _GermanWordCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GermanWord> $mapper =
      GermanWordMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    WordDefinition,
    ObjectCopyWith<$R, WordDefinition, WordDefinition>
  >
  get definitions => ListCopyWith(
    $value.definitions,
    (v, t) => ObjectCopyWith(v, $identity, t),
    (v) => call(definitions: v),
  );
  @override
  $R call({String? wordLema, List<WordDefinition>? definitions}) => $apply(
    FieldCopyWithData({
      if (wordLema != null) #wordLema: wordLema,
      if (definitions != null) #definitions: definitions,
    }),
  );
  @override
  GermanWord $make(CopyWithData data) => GermanWord(
    wordLema: data.get(#wordLema, or: $value.wordLema),
    definitions: data.get(#definitions, or: $value.definitions),
  );

  @override
  GermanWordCopyWith<$R2, GermanWord, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _GermanWordCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

