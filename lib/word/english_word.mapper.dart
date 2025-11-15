// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'english_word.dart';

class EnglishVerbMapper extends ClassMapperBase<EnglishVerb> {
  EnglishVerbMapper._();

  static EnglishVerbMapper? _instance;
  static EnglishVerbMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EnglishVerbMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'EnglishVerb';

  static String _$simplePast(EnglishVerb v) => v.simplePast;
  static const Field<EnglishVerb, String> _f$simplePast = Field(
    'simplePast',
    _$simplePast,
    opt: true,
    def:
        "Simple past form. Example: went, had, was, took, made. Use base form if regular (-ed rule applies).",
  );
  static String _$pastParticiple(EnglishVerb v) => v.pastParticiple;
  static const Field<EnglishVerb, String> _f$pastParticiple = Field(
    'pastParticiple',
    _$pastParticiple,
    opt: true,
    def:
        "Past participle form. Example: gone, had, been, taken, made. Use base form if regular (-ed rule applies).",
  );

  @override
  final MappableFields<EnglishVerb> fields = const {
    #simplePast: _f$simplePast,
    #pastParticiple: _f$pastParticiple,
  };

  static EnglishVerb _instantiate(DecodingData data) {
    return EnglishVerb(
      simplePast: data.dec(_f$simplePast),
      pastParticiple: data.dec(_f$pastParticiple),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static EnglishVerb fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<EnglishVerb>(map);
  }

  static EnglishVerb fromJson(String json) {
    return ensureInitialized().decodeJson<EnglishVerb>(json);
  }
}

mixin EnglishVerbMappable {
  String toJson() {
    return EnglishVerbMapper.ensureInitialized().encodeJson<EnglishVerb>(
      this as EnglishVerb,
    );
  }

  Map<String, dynamic> toMap() {
    return EnglishVerbMapper.ensureInitialized().encodeMap<EnglishVerb>(
      this as EnglishVerb,
    );
  }

  EnglishVerbCopyWith<EnglishVerb, EnglishVerb, EnglishVerb> get copyWith =>
      _EnglishVerbCopyWithImpl<EnglishVerb, EnglishVerb>(
        this as EnglishVerb,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return EnglishVerbMapper.ensureInitialized().stringifyValue(
      this as EnglishVerb,
    );
  }

  @override
  bool operator ==(Object other) {
    return EnglishVerbMapper.ensureInitialized().equalsValue(
      this as EnglishVerb,
      other,
    );
  }

  @override
  int get hashCode {
    return EnglishVerbMapper.ensureInitialized().hashValue(this as EnglishVerb);
  }
}

extension EnglishVerbValueCopy<$R, $Out>
    on ObjectCopyWith<$R, EnglishVerb, $Out> {
  EnglishVerbCopyWith<$R, EnglishVerb, $Out> get $asEnglishVerb =>
      $base.as((v, t, t2) => _EnglishVerbCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class EnglishVerbCopyWith<$R, $In extends EnglishVerb, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? simplePast, String? pastParticiple});
  EnglishVerbCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _EnglishVerbCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, EnglishVerb, $Out>
    implements EnglishVerbCopyWith<$R, EnglishVerb, $Out> {
  _EnglishVerbCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<EnglishVerb> $mapper =
      EnglishVerbMapper.ensureInitialized();
  @override
  $R call({String? simplePast, String? pastParticiple}) => $apply(
    FieldCopyWithData({
      if (simplePast != null) #simplePast: simplePast,
      if (pastParticiple != null) #pastParticiple: pastParticiple,
    }),
  );
  @override
  EnglishVerb $make(CopyWithData data) => EnglishVerb(
    simplePast: data.get(#simplePast, or: $value.simplePast),
    pastParticiple: data.get(#pastParticiple, or: $value.pastParticiple),
  );

  @override
  EnglishVerbCopyWith<$R2, EnglishVerb, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _EnglishVerbCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class EnglishNounMapper extends ClassMapperBase<EnglishNoun> {
  EnglishNounMapper._();

  static EnglishNounMapper? _instance;
  static EnglishNounMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EnglishNounMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'EnglishNoun';

  static String _$pluralForm(EnglishNoun v) => v.pluralForm;
  static const Field<EnglishNoun, String> _f$pluralForm = Field(
    'pluralForm',
    _$pluralForm,
    opt: true,
    def:
        "Exact plural form. Example: children, geese, mice, sheep, data. Use base form+s if regular. Use same word if uncountable.",
  );

  @override
  final MappableFields<EnglishNoun> fields = const {#pluralForm: _f$pluralForm};

  static EnglishNoun _instantiate(DecodingData data) {
    return EnglishNoun(pluralForm: data.dec(_f$pluralForm));
  }

  @override
  final Function instantiate = _instantiate;

  static EnglishNoun fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<EnglishNoun>(map);
  }

  static EnglishNoun fromJson(String json) {
    return ensureInitialized().decodeJson<EnglishNoun>(json);
  }
}

mixin EnglishNounMappable {
  String toJson() {
    return EnglishNounMapper.ensureInitialized().encodeJson<EnglishNoun>(
      this as EnglishNoun,
    );
  }

  Map<String, dynamic> toMap() {
    return EnglishNounMapper.ensureInitialized().encodeMap<EnglishNoun>(
      this as EnglishNoun,
    );
  }

  EnglishNounCopyWith<EnglishNoun, EnglishNoun, EnglishNoun> get copyWith =>
      _EnglishNounCopyWithImpl<EnglishNoun, EnglishNoun>(
        this as EnglishNoun,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return EnglishNounMapper.ensureInitialized().stringifyValue(
      this as EnglishNoun,
    );
  }

  @override
  bool operator ==(Object other) {
    return EnglishNounMapper.ensureInitialized().equalsValue(
      this as EnglishNoun,
      other,
    );
  }

  @override
  int get hashCode {
    return EnglishNounMapper.ensureInitialized().hashValue(this as EnglishNoun);
  }
}

extension EnglishNounValueCopy<$R, $Out>
    on ObjectCopyWith<$R, EnglishNoun, $Out> {
  EnglishNounCopyWith<$R, EnglishNoun, $Out> get $asEnglishNoun =>
      $base.as((v, t, t2) => _EnglishNounCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class EnglishNounCopyWith<$R, $In extends EnglishNoun, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? pluralForm});
  EnglishNounCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _EnglishNounCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, EnglishNoun, $Out>
    implements EnglishNounCopyWith<$R, EnglishNoun, $Out> {
  _EnglishNounCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<EnglishNoun> $mapper =
      EnglishNounMapper.ensureInitialized();
  @override
  $R call({String? pluralForm}) => $apply(
    FieldCopyWithData({if (pluralForm != null) #pluralForm: pluralForm}),
  );
  @override
  EnglishNoun $make(CopyWithData data) =>
      EnglishNoun(pluralForm: data.get(#pluralForm, or: $value.pluralForm));

  @override
  EnglishNounCopyWith<$R2, EnglishNoun, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _EnglishNounCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class EnglishAdjectiveMapper extends ClassMapperBase<EnglishAdjective> {
  EnglishAdjectiveMapper._();

  static EnglishAdjectiveMapper? _instance;
  static EnglishAdjectiveMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EnglishAdjectiveMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'EnglishAdjective';

  static String _$comparative(EnglishAdjective v) => v.comparative;
  static const Field<EnglishAdjective, String> _f$comparative = Field(
    'comparative',
    _$comparative,
    opt: true,
    def:
        "Comparative form. Example: better, worse, more beautiful. Use base form if regular (-er or more+base).",
  );
  static String _$superlative(EnglishAdjective v) => v.superlative;
  static const Field<EnglishAdjective, String> _f$superlative = Field(
    'superlative',
    _$superlative,
    opt: true,
    def:
        "Superlative form. Example: best, worst, most beautiful. Use base form if regular (-est or most+base).",
  );

  @override
  final MappableFields<EnglishAdjective> fields = const {
    #comparative: _f$comparative,
    #superlative: _f$superlative,
  };

  static EnglishAdjective _instantiate(DecodingData data) {
    return EnglishAdjective(
      comparative: data.dec(_f$comparative),
      superlative: data.dec(_f$superlative),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static EnglishAdjective fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<EnglishAdjective>(map);
  }

  static EnglishAdjective fromJson(String json) {
    return ensureInitialized().decodeJson<EnglishAdjective>(json);
  }
}

mixin EnglishAdjectiveMappable {
  String toJson() {
    return EnglishAdjectiveMapper.ensureInitialized()
        .encodeJson<EnglishAdjective>(this as EnglishAdjective);
  }

  Map<String, dynamic> toMap() {
    return EnglishAdjectiveMapper.ensureInitialized()
        .encodeMap<EnglishAdjective>(this as EnglishAdjective);
  }

  EnglishAdjectiveCopyWith<EnglishAdjective, EnglishAdjective, EnglishAdjective>
  get copyWith =>
      _EnglishAdjectiveCopyWithImpl<EnglishAdjective, EnglishAdjective>(
        this as EnglishAdjective,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return EnglishAdjectiveMapper.ensureInitialized().stringifyValue(
      this as EnglishAdjective,
    );
  }

  @override
  bool operator ==(Object other) {
    return EnglishAdjectiveMapper.ensureInitialized().equalsValue(
      this as EnglishAdjective,
      other,
    );
  }

  @override
  int get hashCode {
    return EnglishAdjectiveMapper.ensureInitialized().hashValue(
      this as EnglishAdjective,
    );
  }
}

extension EnglishAdjectiveValueCopy<$R, $Out>
    on ObjectCopyWith<$R, EnglishAdjective, $Out> {
  EnglishAdjectiveCopyWith<$R, EnglishAdjective, $Out>
  get $asEnglishAdjective =>
      $base.as((v, t, t2) => _EnglishAdjectiveCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class EnglishAdjectiveCopyWith<$R, $In extends EnglishAdjective, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? comparative, String? superlative});
  EnglishAdjectiveCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _EnglishAdjectiveCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, EnglishAdjective, $Out>
    implements EnglishAdjectiveCopyWith<$R, EnglishAdjective, $Out> {
  _EnglishAdjectiveCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<EnglishAdjective> $mapper =
      EnglishAdjectiveMapper.ensureInitialized();
  @override
  $R call({String? comparative, String? superlative}) => $apply(
    FieldCopyWithData({
      if (comparative != null) #comparative: comparative,
      if (superlative != null) #superlative: superlative,
    }),
  );
  @override
  EnglishAdjective $make(CopyWithData data) => EnglishAdjective(
    comparative: data.get(#comparative, or: $value.comparative),
    superlative: data.get(#superlative, or: $value.superlative),
  );

  @override
  EnglishAdjectiveCopyWith<$R2, EnglishAdjective, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _EnglishAdjectiveCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class EnglishAdverbMapper extends ClassMapperBase<EnglishAdverb> {
  EnglishAdverbMapper._();

  static EnglishAdverbMapper? _instance;
  static EnglishAdverbMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EnglishAdverbMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'EnglishAdverb';

  static String _$comparative(EnglishAdverb v) => v.comparative;
  static const Field<EnglishAdverb, String> _f$comparative = Field(
    'comparative',
    _$comparative,
    opt: true,
    def:
        "Comparative form. Example: better, more quickly, faster. Use base form if regular (more+base).",
  );
  static String _$superlative(EnglishAdverb v) => v.superlative;
  static const Field<EnglishAdverb, String> _f$superlative = Field(
    'superlative',
    _$superlative,
    opt: true,
    def:
        "Superlative form. Example: best, most quickly, fastest. Use base form if regular (most+base).",
  );

  @override
  final MappableFields<EnglishAdverb> fields = const {
    #comparative: _f$comparative,
    #superlative: _f$superlative,
  };

  static EnglishAdverb _instantiate(DecodingData data) {
    return EnglishAdverb(
      comparative: data.dec(_f$comparative),
      superlative: data.dec(_f$superlative),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static EnglishAdverb fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<EnglishAdverb>(map);
  }

  static EnglishAdverb fromJson(String json) {
    return ensureInitialized().decodeJson<EnglishAdverb>(json);
  }
}

mixin EnglishAdverbMappable {
  String toJson() {
    return EnglishAdverbMapper.ensureInitialized().encodeJson<EnglishAdverb>(
      this as EnglishAdverb,
    );
  }

  Map<String, dynamic> toMap() {
    return EnglishAdverbMapper.ensureInitialized().encodeMap<EnglishAdverb>(
      this as EnglishAdverb,
    );
  }

  EnglishAdverbCopyWith<EnglishAdverb, EnglishAdverb, EnglishAdverb>
  get copyWith => _EnglishAdverbCopyWithImpl<EnglishAdverb, EnglishAdverb>(
    this as EnglishAdverb,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return EnglishAdverbMapper.ensureInitialized().stringifyValue(
      this as EnglishAdverb,
    );
  }

  @override
  bool operator ==(Object other) {
    return EnglishAdverbMapper.ensureInitialized().equalsValue(
      this as EnglishAdverb,
      other,
    );
  }

  @override
  int get hashCode {
    return EnglishAdverbMapper.ensureInitialized().hashValue(
      this as EnglishAdverb,
    );
  }
}

extension EnglishAdverbValueCopy<$R, $Out>
    on ObjectCopyWith<$R, EnglishAdverb, $Out> {
  EnglishAdverbCopyWith<$R, EnglishAdverb, $Out> get $asEnglishAdverb =>
      $base.as((v, t, t2) => _EnglishAdverbCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class EnglishAdverbCopyWith<$R, $In extends EnglishAdverb, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? comparative, String? superlative});
  EnglishAdverbCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _EnglishAdverbCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, EnglishAdverb, $Out>
    implements EnglishAdverbCopyWith<$R, EnglishAdverb, $Out> {
  _EnglishAdverbCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<EnglishAdverb> $mapper =
      EnglishAdverbMapper.ensureInitialized();
  @override
  $R call({String? comparative, String? superlative}) => $apply(
    FieldCopyWithData({
      if (comparative != null) #comparative: comparative,
      if (superlative != null) #superlative: superlative,
    }),
  );
  @override
  EnglishAdverb $make(CopyWithData data) => EnglishAdverb(
    comparative: data.get(#comparative, or: $value.comparative),
    superlative: data.get(#superlative, or: $value.superlative),
  );

  @override
  EnglishAdverbCopyWith<$R2, EnglishAdverb, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _EnglishAdverbCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class EnglishWordDefinitionMapper
    extends ClassMapperBase<EnglishWordDefinition> {
  EnglishWordDefinitionMapper._();

  static EnglishWordDefinitionMapper? _instance;
  static EnglishWordDefinitionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EnglishWordDefinitionMapper._());
      WordExampleMapper.ensureInitialized();
      EnglishNounMapper.ensureInitialized();
      EnglishVerbMapper.ensureInitialized();
      EnglishAdjectiveMapper.ensureInitialized();
      EnglishAdverbMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'EnglishWordDefinition';

  static List<WordExample> _$examples(EnglishWordDefinition v) => v.examples;
  static const Field<EnglishWordDefinition, List<WordExample>> _f$examples =
      Field(
        'examples',
        _$examples,
        opt: true,
        def: const [WordExample(), WordExample()],
      );
  static String _$meaning(EnglishWordDefinition v) => v.meaning;
  static const Field<EnglishWordDefinition, String> _f$meaning = Field(
    'meaning',
    _$meaning,
    opt: true,
    def: "Meaning of this word in this specific context",
  );
  static String _$partOfSpeech(EnglishWordDefinition v) => v.partOfSpeech;
  static const Field<EnglishWordDefinition, String> _f$partOfSpeech = Field(
    'partOfSpeech',
    _$partOfSpeech,
    opt: true,
    def: "Part of speech of the word in this specific context",
  );
  static EnglishNoun? _$nounInfo(EnglishWordDefinition v) => v.nounInfo;
  static const Field<EnglishWordDefinition, EnglishNoun> _f$nounInfo = Field(
    'nounInfo',
    _$nounInfo,
    opt: true,
    def: const EnglishNoun(),
  );
  static EnglishVerb? _$verbInfo(EnglishWordDefinition v) => v.verbInfo;
  static const Field<EnglishWordDefinition, EnglishVerb> _f$verbInfo = Field(
    'verbInfo',
    _$verbInfo,
    opt: true,
    def: const EnglishVerb(),
  );
  static EnglishAdjective? _$adjectiveInfo(EnglishWordDefinition v) =>
      v.adjectiveInfo;
  static const Field<EnglishWordDefinition, EnglishAdjective> _f$adjectiveInfo =
      Field(
        'adjectiveInfo',
        _$adjectiveInfo,
        opt: true,
        def: const EnglishAdjective(),
      );
  static EnglishAdverb? _$adverbInfo(EnglishWordDefinition v) => v.adverbInfo;
  static const Field<EnglishWordDefinition, EnglishAdverb> _f$adverbInfo =
      Field('adverbInfo', _$adverbInfo, opt: true, def: const EnglishAdverb());

  @override
  final MappableFields<EnglishWordDefinition> fields = const {
    #examples: _f$examples,
    #meaning: _f$meaning,
    #partOfSpeech: _f$partOfSpeech,
    #nounInfo: _f$nounInfo,
    #verbInfo: _f$verbInfo,
    #adjectiveInfo: _f$adjectiveInfo,
    #adverbInfo: _f$adverbInfo,
  };

  static EnglishWordDefinition _instantiate(DecodingData data) {
    return EnglishWordDefinition(
      examples: data.dec(_f$examples),
      meaning: data.dec(_f$meaning),
      partOfSpeech: data.dec(_f$partOfSpeech),
      nounInfo: data.dec(_f$nounInfo),
      verbInfo: data.dec(_f$verbInfo),
      adjectiveInfo: data.dec(_f$adjectiveInfo),
      adverbInfo: data.dec(_f$adverbInfo),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static EnglishWordDefinition fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<EnglishWordDefinition>(map);
  }

  static EnglishWordDefinition fromJson(String json) {
    return ensureInitialized().decodeJson<EnglishWordDefinition>(json);
  }
}

mixin EnglishWordDefinitionMappable {
  String toJson() {
    return EnglishWordDefinitionMapper.ensureInitialized()
        .encodeJson<EnglishWordDefinition>(this as EnglishWordDefinition);
  }

  Map<String, dynamic> toMap() {
    return EnglishWordDefinitionMapper.ensureInitialized()
        .encodeMap<EnglishWordDefinition>(this as EnglishWordDefinition);
  }

  EnglishWordDefinitionCopyWith<
    EnglishWordDefinition,
    EnglishWordDefinition,
    EnglishWordDefinition
  >
  get copyWith =>
      _EnglishWordDefinitionCopyWithImpl<
        EnglishWordDefinition,
        EnglishWordDefinition
      >(this as EnglishWordDefinition, $identity, $identity);
  @override
  String toString() {
    return EnglishWordDefinitionMapper.ensureInitialized().stringifyValue(
      this as EnglishWordDefinition,
    );
  }

  @override
  bool operator ==(Object other) {
    return EnglishWordDefinitionMapper.ensureInitialized().equalsValue(
      this as EnglishWordDefinition,
      other,
    );
  }

  @override
  int get hashCode {
    return EnglishWordDefinitionMapper.ensureInitialized().hashValue(
      this as EnglishWordDefinition,
    );
  }
}

extension EnglishWordDefinitionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, EnglishWordDefinition, $Out> {
  EnglishWordDefinitionCopyWith<$R, EnglishWordDefinition, $Out>
  get $asEnglishWordDefinition => $base.as(
    (v, t, t2) => _EnglishWordDefinitionCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class EnglishWordDefinitionCopyWith<
  $R,
  $In extends EnglishWordDefinition,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    WordExample,
    WordExampleCopyWith<$R, WordExample, WordExample>
  >
  get examples;
  EnglishNounCopyWith<$R, EnglishNoun, EnglishNoun>? get nounInfo;
  EnglishVerbCopyWith<$R, EnglishVerb, EnglishVerb>? get verbInfo;
  EnglishAdjectiveCopyWith<$R, EnglishAdjective, EnglishAdjective>?
  get adjectiveInfo;
  EnglishAdverbCopyWith<$R, EnglishAdverb, EnglishAdverb>? get adverbInfo;
  $R call({
    List<WordExample>? examples,
    String? meaning,
    String? partOfSpeech,
    EnglishNoun? nounInfo,
    EnglishVerb? verbInfo,
    EnglishAdjective? adjectiveInfo,
    EnglishAdverb? adverbInfo,
  });
  EnglishWordDefinitionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _EnglishWordDefinitionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, EnglishWordDefinition, $Out>
    implements EnglishWordDefinitionCopyWith<$R, EnglishWordDefinition, $Out> {
  _EnglishWordDefinitionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<EnglishWordDefinition> $mapper =
      EnglishWordDefinitionMapper.ensureInitialized();
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
  EnglishNounCopyWith<$R, EnglishNoun, EnglishNoun>? get nounInfo =>
      $value.nounInfo?.copyWith.$chain((v) => call(nounInfo: v));
  @override
  EnglishVerbCopyWith<$R, EnglishVerb, EnglishVerb>? get verbInfo =>
      $value.verbInfo?.copyWith.$chain((v) => call(verbInfo: v));
  @override
  EnglishAdjectiveCopyWith<$R, EnglishAdjective, EnglishAdjective>?
  get adjectiveInfo =>
      $value.adjectiveInfo?.copyWith.$chain((v) => call(adjectiveInfo: v));
  @override
  EnglishAdverbCopyWith<$R, EnglishAdverb, EnglishAdverb>? get adverbInfo =>
      $value.adverbInfo?.copyWith.$chain((v) => call(adverbInfo: v));
  @override
  $R call({
    List<WordExample>? examples,
    String? meaning,
    String? partOfSpeech,
    Object? nounInfo = $none,
    Object? verbInfo = $none,
    Object? adjectiveInfo = $none,
    Object? adverbInfo = $none,
  }) => $apply(
    FieldCopyWithData({
      if (examples != null) #examples: examples,
      if (meaning != null) #meaning: meaning,
      if (partOfSpeech != null) #partOfSpeech: partOfSpeech,
      if (nounInfo != $none) #nounInfo: nounInfo,
      if (verbInfo != $none) #verbInfo: verbInfo,
      if (adjectiveInfo != $none) #adjectiveInfo: adjectiveInfo,
      if (adverbInfo != $none) #adverbInfo: adverbInfo,
    }),
  );
  @override
  EnglishWordDefinition $make(CopyWithData data) => EnglishWordDefinition(
    examples: data.get(#examples, or: $value.examples),
    meaning: data.get(#meaning, or: $value.meaning),
    partOfSpeech: data.get(#partOfSpeech, or: $value.partOfSpeech),
    nounInfo: data.get(#nounInfo, or: $value.nounInfo),
    verbInfo: data.get(#verbInfo, or: $value.verbInfo),
    adjectiveInfo: data.get(#adjectiveInfo, or: $value.adjectiveInfo),
    adverbInfo: data.get(#adverbInfo, or: $value.adverbInfo),
  );

  @override
  EnglishWordDefinitionCopyWith<$R2, EnglishWordDefinition, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _EnglishWordDefinitionCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class EnglishWordMapper extends ClassMapperBase<EnglishWord> {
  EnglishWordMapper._();

  static EnglishWordMapper? _instance;
  static EnglishWordMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EnglishWordMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'EnglishWord';

  @override
  final MappableFields<EnglishWord> fields = const {};

  static EnglishWord _instantiate(DecodingData data) {
    throw MapperException.missingConstructor('EnglishWord');
  }

  @override
  final Function instantiate = _instantiate;

  static EnglishWord fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<EnglishWord>(map);
  }

  static EnglishWord fromJson(String json) {
    return ensureInitialized().decodeJson<EnglishWord>(json);
  }
}

mixin EnglishWordMappable {
  String toJson() {
    return EnglishWordMapper.ensureInitialized().encodeJson<EnglishWord>(
      this as EnglishWord,
    );
  }

  Map<String, dynamic> toMap() {
    return EnglishWordMapper.ensureInitialized().encodeMap<EnglishWord>(
      this as EnglishWord,
    );
  }

  EnglishWordCopyWith<EnglishWord, EnglishWord, EnglishWord> get copyWith;
  @override
  String toString() {
    return EnglishWordMapper.ensureInitialized().stringifyValue(
      this as EnglishWord,
    );
  }

  @override
  bool operator ==(Object other) {
    return EnglishWordMapper.ensureInitialized().equalsValue(
      this as EnglishWord,
      other,
    );
  }

  @override
  int get hashCode {
    return EnglishWordMapper.ensureInitialized().hashValue(this as EnglishWord);
  }
}

abstract class EnglishWordCopyWith<$R, $In extends EnglishWord, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call();
  EnglishWordCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

