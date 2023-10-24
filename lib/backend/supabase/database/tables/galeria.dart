import '../database.dart';

class GaleriaTable extends SupabaseTable<GaleriaRow> {
  @override
  String get tableName => 'galeria';

  @override
  GaleriaRow createRow(Map<String, dynamic> data) => GaleriaRow(data);
}

class GaleriaRow extends SupabaseDataRow {
  GaleriaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => GaleriaTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get imgport => getField<String>('imgport');
  set imgport(String? value) => setField<String>('imgport', value);

  String? get iduser => getField<String>('iduser');
  set iduser(String? value) => setField<String>('iduser', value);

  String? get img => getField<String>('img');
  set img(String? value) => setField<String>('img', value);
}
