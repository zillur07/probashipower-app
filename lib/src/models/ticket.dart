class Ticket {
  final String id;
  final String ticketName;
  final String airportFrom;
  final String airportTo;
  final String flyDateTime;
  final String flyDuration;
  final String ticketFare;
  final String airlineName;
  final String airlineContact;

  Ticket({
    required this.id,
    required this.ticketName,
    required this.airportFrom,
    required this.airportTo,
    required this.flyDateTime,
    required this.flyDuration,
    required this.ticketFare,
    required this.airlineName,
    required this.airlineContact,
  });

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      id: json['id'],
      ticketName: json['ticket_name'],
      airportFrom: json['airport_from'],
      airportTo: json['airport_to'],
      flyDateTime: json['fly_date_time'],
      flyDuration: json['fly_duration'],
      ticketFare: json['ticket_fare'],
      airlineName: json['airline_name'],
      airlineContact: json['airline_contact'],
    );
  }
}
