import '../database.dart';

class HistoriasTable extends SupabaseTable<HistoriasRow> {
  @override
  String get tableName => 'historias';

  @override
  HistoriasRow createRow(Map<String, dynamic> data) => HistoriasRow(data);
}

class HistoriasRow extends SupabaseDataRow {
  HistoriasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => HistoriasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get titulo => getField<String>('titulo')!;
  set titulo(String value) => setField<String>('titulo', value);

  String get conteudo => getField<String>('conteudo')!;
  set conteudo(String value) => setField<String>('conteudo', value);

  DateTime? get dataCriacao => getField<DateTime>('data_criacao');
  set dataCriacao(DateTime? value) => setField<DateTime>('data_criacao', value);
}
