// Copyright (c) 2015, José Luis Esteban. All rights reserved. Use of this source code
// is governed by a GPL-style license that can be found in the LICENSE file.

import 'dart:html';

import 'package:polymer/polymer.dart';
import 'package:markdown/markdown.dart' show markdownToHtml;


/// A Polymer `<time-line>` element.
@CustomTag('time-line')
class TimeLine extends PolymerElement {
  @published String header="missing header";
  @published String subject="missing subject";
  @published String url_doc="";


  int _id = 0;

  /// Constructor used to create instance of MainApp.
  TimeLine.created() : super.created()
  {
    var item = new HtmlHtmlElement();
    item.appendHtml(markdownToHtml(header));
    item.appendHtml(markdownToHtml(subject));
    $["header"].children.add(item);

    //TimeLine  tl = document.querySelector('#timeline');

    HttpRequest.getString(url_doc)
        .then((text) => appendDocument(text));

  }

  void add(String date, String label, String content) {
    _id += 1;
    var item = new ParagraphElement();

    $["timeline"].children.add(item);
    item.appendHtml('''      <li class='work'>
        <input class='radio' id='work${_id}' name='works' type='radio' ${_id==1? "checked" :""}>
        <div class="relative">
          <label for='work${_id}'>${markdownToHtml(label)}</label>
          <span class='date'>${markdownToHtml(date)}</span>
          <span class='circle'></span>
        </div>
        <div class='content'>
          <p>
            ${markdownToHtml(content.trim())}
          </p>
        </div>
      </li>
      ''');
  }


  void appendDocument(String document) {
    DateTime today = new DateTime.now();
    String dateSlug ="${today.year.toString()}-${today.month.toString().padLeft(2,'0')}-${today.day.toString().padLeft(2,'0')}";
    document = document.replaceAll(new RegExp(r'{{now}}'), dateSlug);

    document = "\n" + document;
    var lines = document.split("\n- ");
    var counter=0;
    while(counter<lines.length)
    {
      while(lines[counter]=="")  counter++;
      add(lines[counter], lines[counter+1], lines[counter+2]);
      counter += 3;
    }
  }
  // Optional lifecycle methods - uncomment if needed.

//  /// Called when an instance of main-app is inserted into the DOM.
//  attached() {
//    super.attached();
//  }

//  /// Called when an instance of main-app is removed from the DOM.
//  detached() {
//    super.detached();
//  }

//  /// Called when an attribute (such as a class) of an instance of
//  /// main-app is added, changed, or removed.
//  attributeChanged(String name, String oldValue, String newValue) {
//    super.attributeChanges(name, oldValue, newValue);
//  }

//  /// Called when main-app has been fully prepared (Shadow DOM created,
//  /// property observers set up, event listeners attached).
//  ready() {
//    super.ready();
//  }
}
