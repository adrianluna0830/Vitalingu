// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'word.dart';

class WordExampleMapper extends ClassMapperBase<WordExample> {
  WordExampleMapper._();

  static WordExampleMapper? _instance;
  static WordExampleMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = WordExampleMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'WordExample';

  static String _$untranslatedExample(WordExample v) => v.untranslatedExample;
  static const Field<WordExample, String> _f$untranslatedExample = Field(
    'untranslatedExample',
    _$untranslatedExample,
    opt: true,
    def: "A untranslated sentence example of the word in the target language",
  );
  static String _$translatedExample(WordExample v) => v.translatedExample;
  static const Field<WordExample, String> _f$translatedExample = Field(
    'translatedExample',
    _$translatedExample,
    opt: true,
    def:
        "The same untranslated sentence translated to the specified native language",
  );

  @override
  final MappableFields<WordExample> fields = const {
    #untranslatedExample: _f$untranslatedExample,
    #translatedExample: _f$translatedExample,
  };

  static WordExample _instantiate(DecodingData data) {
    return WordExample(
      untranslatedExample: data.dec(_f$untranslatedExample),
      translatedExample: data.dec(_f$translatedExample),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static WordExample fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<WordExample>(map);
  }

  static WordExample fromJson(String json) {
    return ensureInitialized().decodeJson<WordExample>(json);
  }
}

mixin WordExampleMappable {
  String toJson() {
    return WordExampleMapper.ensureInitialized().encodeJson<WordExample>(
      this as WordExample,
    );
  }

  Map<String, dynamic> toMap() {
    return WordExampleMapper.ensureInitialized().encodeMap<WordExample>(
      this as WordExample,
    );
  }

  WordExampleCopyWith<WordExample, WordExample, WordExample> get copyWith =>
      _WordExampleCopyWithImpl<WordExample, WordExample>(
        this as WordExample,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return WordExampleMapper.ensureInitialized().stringifyValue(
      this as WordExample,
    );
  }

  @override
  bool operator ==(Object other) {
    return WordExampleMapper.ensureInitialized().equalsValue(
      this as WordExample,
      other,
    );
  }

  @override
  int get hashCode {
    return WordExampleMapper.ensureInitialized().hashValue(this as WordExample);
  }
}

extension WordExampleValueCopy<$R, $Out>
    on ObjectCopyWith<$R, WordExample, $Out> {
  WordExampleCopyWith<$R, WordExample, $Out> get $asWordExample =>
      $base.as((v, t, t2) => _WordExampleCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class WordExampleCopyWith<$R, $In extends WordExample, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? untranslatedExample, String? translatedExample});
  WordExampleCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _WordExampleCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, WordExample, $Out>
    implements WordExampleCopyWith<$R, WordExample, $Out> {
  _WordExampleCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<WordExample> $mapper =
      WordExampleMapper.ensureInitialized();
  @override
  $R call({String? untranslatedExample, String? translatedExample}) => $apply(
    FieldCopyWithData({
      if (untranslatedExample != null)
        #untranslatedExample: untranslatedExample,
      if (translatedExample != null) #translatedExample: translatedExample,
    }),
  );
  @override
  WordExample $make(CopyWithData data) => WordExample(
    untranslatedExample: data.get(
      #untranslatedExample,
      or: $value.untranslatedExample,
    ),
    translatedExample: data.get(
      #translatedExample,
      or: $value.translatedExample,
    ),
  );

  @override
  WordExampleCopyWith<$R2, WordExample, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _WordExampleCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

