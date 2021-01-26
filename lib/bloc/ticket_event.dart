part of 'ticket_bloc.dart';

abstract class TicketEvent extends Equatable {
  const TicketEvent();

  @override
  List<Object> get props => [];
}

class GetTickets extends Equatable {
  final String userID;

  GetTickets(this.userID);

  @override
  List<Object> get props => [userID];
}

class BuyTickets extends Equatable {
  final Ticket ticket;
  final String userID;

  BuyTickets(this.ticket, this.userID);

  @override
  List<Object> get props => [ticket, userID];
}
