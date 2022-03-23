import 'package:tmdb_api/tmdb_api.dart';

class Constants {
  Constants._();
  final tmdbWithCustomLogs = TMDB(
    //TMDB instance
    ApiKeys('9ec4f1d87c2e96217ce33040ea8ae757',
        'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI5ZWM0ZjFkODdjMmU5NjIxN2NlMzMwNDBlYThhZTc1NyIsInN1YiI6IjYyM2FiNGY0ODQ0NDhlMDA0N2UxMTE2YSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.g_2FU0aoMw9-DKm22KXJD_lkwiNHu6xKbAN_AGfY_VM'), //ApiKeys instance with your keys,
  );
}
