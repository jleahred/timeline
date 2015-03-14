// Copyright (c) 2015, José Luis Esteban. All rights reserved. Use of this source code
// is governed by a GPL-style license that can be found in the LICENSE file.

import 'dart:html';

import 'package:polymer/polymer.dart';

/// A Polymer `<time-line>` element.
@CustomTag('time-line')
class TimeLine extends PolymerElement {
  int _id = 0;

  /// Constructor used to create instance of MainApp.
  TimeLine.created() : super.created()
  {
    //  test
    /*
    add("aa", "kk", "kkkkk");
    add("aa", "kk", "kkkkk");
    add("aa", "kk", "kkkkk");
    */
  }

  void add(String date, String label, String content) {
    _id += 1;
    var item = new ParagraphElement();

    $["timeline"].children.add(item);
    item.appendHtml('''      <li class='work'>
        <input class='radio' id='work${_id}' name='works' type='radio' ${_id==1? "checked" :""}>
        <div class="relative">
          <label for='work${_id}'>${label}</label>
          <span class='date'>${date}</span>
          <span class='circle'></span>
        </div>
        <div class='content'>
          <p>
            ${content}
          </p>
        </div>
      </li>
      ''');
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
