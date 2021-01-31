part of 'services.dart';

class TicketServices {
  static CollectionReference ticketCollection =
      Firestore.instance.collection('tickets');

  static Future<void> saveTicket(String id, Ticket ticket) async {
    await ticketCollection.document().setData({
      'movieID': ticket.movieDetail.id ?? "",
      'userID': id ?? "",
      'theaterName': ticket.theater.name,
      'time': ticket.time.millisecondsSinceEpoch ??
          DateTime.now().millisecondsSinceEpoch,
      'bookingCode': ticket.bookingCode,
      'seats': ticket.seatString,
      'name': ticket.name,
      'totalPrice': ticket.totalPrice
    });
  }

  static Future<List<Ticket>> getTickets(String userID) async {
    QuerySnapshot snapshot = await ticketCollection.getDocuments();

    var documents = snapshot.documents.where((document) =>
        document.data['userID'] ==
        userID); // mengambil data dari id yang di tentukan

    List<Ticket> tickets = [];
    for (var document in documents) {
      MovieDetail movieDetail = await MovieServices.getDetails(null,
          movieID:
              document.data['movieID']); //mengambil detail genre dan langauge

      tickets.add(Ticket(
          movieDetail,
          Theater(document.data['theaterName']),
          DateTime.fromMillisecondsSinceEpoch(document.data['time']),
          document.data['bookingCode'],
          document.data['seats'].toString().split(','),
          document.data['name'],
          document.data['totalPrice'])); //memasukan data ke model ticket
    }
    return tickets;
  }
}
