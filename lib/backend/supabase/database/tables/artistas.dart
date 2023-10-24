import '../database.dart';

class ArtistasTable extends SupabaseTable<ArtistasRow> {
  @override
  String get tableName => 'Artistas';

  @override
  ArtistasRow createRow(Map<String, dynamic> data) => ArtistasRow(data);
}

class ArtistasRow extends SupabaseDataRow {
  ArtistasRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ArtistasTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  String? get nome => getField<String>('Nome');
  set nome(String? value) => setField<String>('Nome', value);

  int? get idade => getField<int>('Idade');
  set idade(int? value) => setField<int>('Idade', value);

  String get imgurl => getField<String>('imgurl')!;
  set imgurl(String value) => setField<String>('imgurl', value);

  String? get buket => getField<String>('buket');
  set buket(String? value) => setField<String>('buket', value);
}
