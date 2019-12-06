import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';
// deleted test folder to avoid errors
void main() => runApp(MaterialApp(
  home: QuoteList(),

));

class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {

  List<Quote> quotes = [
    // order doesnt matter
    Quote(author:'Oscar Wilde', text:'Be yourself; everyone else is already taken'),
    Quote(author:'Oscar Wilde', text:'The truth is rarely pure and never simple'),
    Quote(author:'Oscar Wilde', text:'I have nothing  to declare except my genius')
  ];

  // this way is more modular
//  Widget quoteTemplate(quote){
//
//    return QuoteCard(quote: quote);
//  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Awesome Quotes'),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        // this the same as the first commented out body
//        children: quotes.map((quote) => quoteTemplate(quote) ).toList(),
        // this is more efficient
        children: quotes.map((quote) => QuoteCard(
            quote : quote,
            delete: () {
              setState(() {
                quotes.remove(quote);
              });
            }
        )).toList(),

      ),
    );
  }
}

