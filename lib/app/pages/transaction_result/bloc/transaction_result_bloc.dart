import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'transaction_result_event.dart';
part 'transaction_result_state.dart';

@injectable
class TransactionResultBloc
    extends Bloc<TransactionResultEvent, TransactionResultState> {
  TransactionResultBloc() : super(TransactionResultInitial()) {
    on<TransactionResultEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
