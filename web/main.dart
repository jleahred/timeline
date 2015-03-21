import 'dart:html';
import "package:polymer/polymer.dart";
import "package:timeline/time-line.dart";


main() {
  initPolymer().run(() {
    // code here works most of the time
    Polymer.onReady.then((_) {
      // some things must wait until onReady callback is called
      // for an example look at the discussion linked below

      //test_adding_lines();
      //test_adding_document();
    });
  });
}

void test_adding_lines()
{
  TimeLine  tl = document.querySelector('#timeline');

  tl.add("2012", "Higs Boson",
  '''
      Higgs boson is discovered at CERN (confirmed to 99.999% certainty) 
      ''');

  tl.add("2010", "The Neanderthal Genome",
  '''
      Project presented preliminary genetic evidence that interbreeding did likely take place and that a small but significant portion of Neanderthal admixture is present in modern non-African populations. 
      ''');

  tl.add("2003", "Poincaré Conjecture",
  '''
      Grigori Perelman presents proof of the Poincaré Conjecture. 
      ''');

  tl.add("1994", "Fermat's Last Theorem",
  '''
      Andrew Wiles proves Fermat's Last Theorem 
      ''');

  tl.add("1948", "Quantum electrodynamics",
  '''
      Richard Feynman, Julian Schwinger, Sin-Itiro Tomonaga and Freeman Dyson: Quantum electrodynamics 
      ''');

  tl.add("1905", "Einstein",
  '''
      Albert Einstein: theory of special relativity, explanation of Brownian motion, and photoelectric effect 
      ''');

  tl.add("1897", "cathode rays",
  '''
      J.J. Thomson discovers the electron in cathode rays 
      ''');

  tl.add("1873", "electromagnetism",
  '''
      James Clerk Maxwell: Theory of electromagnetism 
      ''');

  tl.add("1869", "Periodic table",
  '''
      Dmitri Mendeleev: Periodic table 
      ''');

  tl.add("1861", "Germs",
  '''
      Louis Pasteur: Germ theory 
      ''');

  tl.add("1859", "evolution",
  '''
      Charles Darwin and Alfred Wallace: Theory of evolution by natural selection
      ''');
}

void test_adding_document()
{
  TimeLine  tl = document.querySelector('#timeline');

  HttpRequest.getString("example.txt")
      .then((text) => tl.appendDocument(text));

}
